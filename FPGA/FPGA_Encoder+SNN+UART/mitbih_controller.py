#!/usr/bin/env python3
"""
MIT-BIH Arrhythmia FPGA Host Controller
Streams ECG data to FPGA and reads SNN/encoding results in real-time
"""

import serial
import time
import numpy as np
import struct
import threading
from collections import deque
from datetime import datetime
import csv

try:
    import wfdb  # optional: for native MIT-BIH file support
    HAS_WFDB = True
except ImportError:
    HAS_WFDB = False
    print("warning: wfdb not installed. install with: pip install wfdb")


class MITBIHDataLoader:
    """loads mit-bih arrhythmia database signals and annotations"""
    
    def __init__(self, record_number=100, channel=0):
        """
        record_number: MIT-BIH record (100-234, or use name like '100')
        channel: 0 or 1 (two-channel ECG)
        """
        self.record = str(record_number)
        self.channel = channel
        self.fs = 360  # sampling frequency
        self.signal = None
        self.annotations = None
        self.duration_sec = None
        
    def load_wfdb(self):
        """load using wfdb library (easiest)"""
        if not HAS_WFDB:
            raise ImportError("wfdb library required. pip install wfdb")
        
        # download from physionet if needed
        import os
        data_dir = f"mitdb/{self.record}"
        os.makedirs(data_dir, exist_ok=True)
        
        try:
            record = wfdb.rdrecord(f"mitdb/{self.record}")
            self.signal = record.p_signal[:, self.channel]  # shape: (N,)
            self.annotations = wfdb.rdann(f"mitdb/{self.record}", "atr")
            self.duration_sec = len(self.signal) / self.fs
            return True
        except Exception as e:
            print(f"error loading mit-bih record {self.record}: {e}")
            return False
    
    def load_raw_dat(self, filename):
        """
        load raw .dat file (manual format parsing)
        MIT-BIH raw format: 12-bit samples packed 3 bytes per 2 samples
        """
        try:
            with open(filename, 'rb') as f:
                raw_bytes = f.read()
            
            # unpack 12-bit samples from 3-byte triplets
            samples = []
            for i in range(0, len(raw_bytes) - 2, 3):
                b0, b1, b2 = raw_bytes[i], raw_bytes[i+1], raw_bytes[i+2]
                # first 12-bit sample in first 1.5 bytes
                s1 = ((b0 << 4) | (b1 >> 4)) & 0xFFF
                # second 12-bit sample in last 1.5 bytes
                s2 = ((b1 << 8) | b2) & 0xFFF
                samples.extend([s1, s2])
            
            # sign extend 12-bit to 16-bit
            self.signal = np.array(samples, dtype=np.int16)
            self.signal = np.where(self.signal >= 2048, self.signal - 4096, self.signal)
            
            # extract channel
            if self.channel == 1:
                self.signal = self.signal[1::2]
            else:
                self.signal = self.signal[0::2]
            
            self.duration_sec = len(self.signal) / self.fs
            return True
        except Exception as e:
            print(f"error loading raw dat: {e}")
            return False
    
    def load_annotations(self, filename):
        """parse .atr annotation file"""
        try:
            annotations = {}
            with open(filename, 'r') as f:
                for line in f:
                    parts = line.split()
                    if len(parts) >= 2:
                        sample_idx = int(parts[0])
                        beat_type = parts[1]
                        annotations[sample_idx] = beat_type
            self.annotations = annotations
            return True
        except Exception as e:
            print(f"error loading annotations: {e}")
            return False
    
    def get_signal(self):
        """return signal array"""
        return self.signal
    
    def get_annotation_at(self, sample_idx):
        """get beat type at sample index"""
        if self.annotations is None:
            return None
        
        if isinstance(self.annotations, dict):
            # raw dict format
            return self.annotations.get(sample_idx, 'unknown')
        else:
            # wfdb annotation object
            for idx, ann in zip(self.annotations.sample, self.annotations.symbol):
                if idx == sample_idx:
                    return ann
            return 'unknown'


class FPGAController:
    """communicates with fpga over uart"""
    
    # operating modes
    MODE_ENCODING = 0
    MODE_SNN = 1
    
    def __init__(self, port='/dev/ttyUSB0', baudrate=115200, timeout=0.1, mode='snn'):
        self.port = port
        self.baudrate = baudrate
        self.timeout = timeout
        self.mode = mode  # 'snn' or 'encoding'
        self.ser = None
        self.connected = False
        self.sample_sent = 0
        self.sample_received = 0
        
    def connect(self):
        """open serial connection"""
        try:
            self.ser = serial.Serial(self.port, self.baudrate, timeout=self.timeout)
            time.sleep(0.5)  # wait for port to stabilize
            self.connected = True
            print(f"connected to {self.port} @ {self.baudrate} baud, mode={self.mode}")
            return True
        except serial.SerialException as e:
            print(f"error opening serial port: {e}")
            return False
    
    def disconnect(self):
        """close serial connection"""
        if self.ser:
            self.ser.close()
            self.connected = False
    
    def send_sample(self, ecg_value):
        """
        send 12-bit ecg sample to fpga
        format: [sync_byte, msb, lsb]
        """
        if not self.connected:
            return False
        
        # clamp to 12-bit range
        ecg_value = max(-2048, min(2047, ecg_value))
        # convert to unsigned
        if ecg_value < 0:
            ecg_value += 4096
        
        msb = (ecg_value >> 8) & 0xFF
        lsb = ecg_value & 0xFF
        
        try:
            self.ser.write(bytes([0xAA, msb, lsb]))
            self.sample_sent += 1
            return True
        except serial.SerialException:
            print("uart send error")
            return False
    
    def read_result(self):
        """
        read raw 12-bit result from fpga (2 bytes)
        parses based on current mode (snn or encoding)
        returns (mode_type, data_dict) or None if no frame available
        """
        if not self.connected:
            return None
        
        try:
            # read 2 bytes (12-bit value)
            b0 = self.ser.read(1)
            b1 = self.ser.read(1)
            if not b0 or not b1:
                return None
            
            raw_val = (b0[0] << 8) | b1[0]
            
            if self.mode == 'snn':
                # snn mode: [11:5]=reserved, [4:0]=fire, bottom 3 bits shifted
                # actually from fpga: snn_output = {7'b0, snn_winner, snn_fire}
                # so: [11:8]=unused, [7:5]=winner (3 bits), [4:0]=fire (5 bits)
                fire = raw_val & 0x1F  # lower 5 bits
                winner = (raw_val >> 5) & 0x07  # next 3 bits
                
                return ('snn', {
                    'fire': fire,
                    'winner': winner,
                    'timestamp': time.time()
                })
            
            else:  # encoding mode
                # encoding mode: [11:2]=ecg (for debug), [1]=spike_p, [0]=spike_n
                spike_n = bool(raw_val & 0x01)
                spike_p = bool(raw_val & 0x02)
                ecg_debug = (raw_val >> 2) & 0x3FF
                
                return ('encoding', {
                    'spike_p': spike_p,
                    'spike_n': spike_n,
                    'ecg_packed': ecg_debug,  # for debugging
                    'timestamp': time.time()
                })
        
        except serial.SerialException:
            return None
    
    def flush_buffers(self):
        """clear uart buffers"""
        if self.ser:
            self.ser.reset_input_buffer()
            self.ser.reset_output_buffer()


class RealtimeLogger:
    """logs ecg stream with snn/encoding results and annotations"""
    
    def __init__(self, output_file='fpga_results.csv'):
        self.output_file = output_file
        self.csv_writer = None
        self.csv_file = None
        self.lock = threading.Lock()
        self.results_queue = deque(maxlen=1000)
        
    def open(self):
        """create output csv file"""
        try:
            self.csv_file = open(self.output_file, 'w', newline='')
            self.csv_writer = csv.DictWriter(
                self.csv_file,
                fieldnames=[
                    'sample_idx', 'timestamp', 'ecg_value',
                    'mode', 'spike_p', 'spike_n', 'fire', 'winner',
                    'ground_truth', 'match'
                ]
            )
            self.csv_writer.writeheader()
            print(f"logging to {self.output_file}")
            return True
        except IOError as e:
            print(f"error opening log file: {e}")
            return False
    
    def log_sample(self, row_dict):
        """log a single sample result"""
        with self.lock:
            self.results_queue.append(row_dict)
            if self.csv_writer:
                try:
                    self.csv_writer.writerow(row_dict)
                    self.csv_file.flush()
                except IOError:
                    pass
    
    def close(self):
        """close log file"""
        if self.csv_file:
            self.csv_file.close()
    
    def get_stats(self):
        """compute real-time accuracy stats"""
        correct = 0
        total = 0
        with self.lock:
            for row in self.results_queue:
                if row.get('match'):
                    correct += 1
                total += 1
        
        if total == 0:
            return 0.0
        return correct / total * 100


class ECGStreamer:
    """main controller: streams ecg data and collects snn results"""
    
    def __init__(self, fpga_port='/dev/ttyUSB0', record_number=100, mode='snn'):
        self.fpga = FPGAController(port=fpga_port, baudrate=115200, mode=mode)
        self.loader = MITBIHDataLoader(record_number=record_number)
        self.logger = RealtimeLogger()
        self.mode = mode
        self.running = False
        self.stream_thread = None
        self.reader_thread = None
        
    def setup(self):
        """initialize all components"""
        print(f"[setup] loading mit-bih record {self.loader.record}...")
        if not self.loader.load_wfdb():
            print("failed to load mit-bih data")
            return False
        
        print(f"[setup] loaded {len(self.loader.get_signal())} samples, "
              f"{self.loader.duration_sec:.1f} seconds")
        
        print(f"[setup] connecting to fpga at {self.fpga.port}...")
        if not self.fpga.connect():
            return False
        
        if not self.logger.open():
            return False
        
        self.fpga.flush_buffers()
        return True
    
    def stream_worker(self):
        """background thread: send samples at 360 hz"""
        signal = self.loader.get_signal()
        fs = self.loader.fs
        sample_period = 1.0 / fs  # 2.778 ms
        
        print("[stream] starting ecg transmission...")
        self.running = True
        start_time = time.time()
        sample_idx = 0
        
        while self.running and sample_idx < len(signal):
            # maintain timing
            elapsed = time.time() - start_time
            expected_time = sample_idx * sample_period
            
            if elapsed < expected_time:
                time.sleep(expected_time - elapsed)
            
            ecg_val = int(signal[sample_idx])
            self.fpga.send_sample(ecg_val)
            sample_idx += 1
            
            if sample_idx % 360 == 0:
                print(f"[stream] sent {sample_idx} samples ({sample_idx/fs:.1f} sec)")
        
        print("[stream] transmission complete")
    
    def reader_worker(self):
        """background thread: receive snn/encoding results"""
        print("[reader] waiting for fpga results...")
        signal = self.loader.get_signal()
        fs = self.loader.fs
        
        self.running = True
        result_idx = 0
        
        while self.running and result_idx < len(signal):
            result = self.fpga.read_result()
            
            if result:
                mode, data = result
                ecg_val = signal[result_idx]
                ground_truth = self.loader.get_annotation_at(result_idx)
                
                row = {
                    'sample_idx': result_idx,
                    'timestamp': datetime.now().isoformat(),
                    'ecg_value': ecg_val,
                    'mode': mode,
                    'spike_p': data.get('spike_p', ''),
                    'spike_n': data.get('spike_n', ''),
                    'fire': data.get('fire', ''),
                    'winner': data.get('winner', ''),
                    'ground_truth': ground_truth,
                    'match': ''  # placeholder for later
                }
                
                self.logger.log_sample(row)
                result_idx += 1
                
                if result_idx % 100 == 0:
                    acc = self.logger.get_stats()
                    print(f"[reader] received {result_idx} results, "
                          f"accuracy: {acc:.1f}%")
            else:
                time.sleep(0.001)  # avoid busy-wait
    
    def run(self, duration_sec=None):
        """stream ecg data and read results in parallel"""
        if not self.setup():
            return False
        
        self.stream_thread = threading.Thread(target=self.stream_worker, daemon=True)
        self.reader_thread = threading.Thread(target=self.reader_worker, daemon=True)
        
        self.stream_thread.start()
        self.reader_thread.start()
        
        try:
            # wait for completion or user interrupt
            while self.stream_thread.is_alive() or self.reader_thread.is_alive():
                time.sleep(0.1)
        except KeyboardInterrupt:
            print("\n[main] interrupted by user")
        
        self.running = False
        self.stream_thread.join(timeout=2)
        self.reader_thread.join(timeout=2)
        
        self.fpga.disconnect()
        self.logger.close()
        
        final_acc = self.logger.get_stats()
        print(f"\n[main] test complete!")
        print(f"[main] final accuracy: {final_acc:.1f}%")
        print(f"[main] results logged to {self.logger.output_file}")
        
        return True


if __name__ == '__main__':
    import sys
    
    # example usage:
    #   python3 mitbih_controller.py 100         # record 100, snn mode (default)
    #   python3 mitbih_controller.py 101 /dev/ttyUSB1 encoding
    #   python3 mitbih_controller.py 102 /dev/ttyUSB0 snn
    
    record = int(sys.argv[1]) if len(sys.argv) > 1 else 100
    port = sys.argv[2] if len(sys.argv) > 2 else '/dev/ttyUSB0'
    mode = sys.argv[3] if len(sys.argv) > 3 else 'snn'  # 'snn' or 'encoding'
    
    if mode not in ['snn', 'encoding']:
        print(f"invalid mode: {mode}. use 'snn' or 'encoding'")
        sys.exit(1)
    
    streamer = ECGStreamer(fpga_port=port, record_number=record, mode=mode)
    success = streamer.run()
    
    sys.exit(0 if success else 1)