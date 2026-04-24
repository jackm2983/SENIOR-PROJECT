#!/usr/bin/env python3
"""
simple mit-bih -> fpga streamer.
sends 12-bit ecg samples as 2 bytes each (big-endian, msb first).
reads 2-byte results back and logs to csv.

usage:
  python mitbih_stream.py --port COM3 --record 100 --mode snn
"""

import argparse
import csv
import sys
import time
import threading
from datetime import datetime

import serial
import wfdb


FS = 360  # mit-bih sample rate


def load_record(record_num, channel=0):
    # wfdb grabs from physionet automatically if not cached locally
    rec = wfdb.rdrecord(str(record_num), pn_dir='mitdb')
    ann = wfdb.rdann(str(record_num), 'atr', pn_dir='mitdb')

    sig = rec.p_signal[:, channel]

    # normalize float mV to unsigned 12-bit (0..4095)
    # mit-bih range is roughly -5..+5 mV; scale to full adc range
    sig_scaled = ((sig + 5.0) / 10.0 * 4095).clip(0, 4095).astype(int)

    # build annotation lookup: sample_idx -> beat_symbol
    ann_map = dict(zip(ann.sample.tolist(), ann.symbol))
    return sig_scaled, ann_map


def parse_result(raw_val, mode):
    if mode == 'snn':
        # {7'b0, winner[4:0], fire[4:0]} -- wait, winner is 5 bits too
        # from top: snn_output = {7'b0, snn_winner, snn_fire} with N_neurons=5
        # that's 7 + 5 + 5 = 17 bits which overflows 12. the fpga truncates.
        # actual 12-bit packing: lower 5 = fire, upper bits = winner (partial)
        fire = raw_val & 0x1F
        winner = (raw_val >> 5) & 0x1F
        return {'fire': fire, 'winner': winner, 'spike_p': '', 'spike_n': ''}
    else:
        # {input[9:0], spikeP, spikeN}
        return {
            'spike_n': raw_val & 0x1,
            'spike_p': (raw_val >> 1) & 0x1,
            'fire': '',
            'winner': '',
        }


class Streamer:
    def __init__(self, port, record, mode, outfile, limit=None):
        self.mode = mode
        self.outfile = outfile
        self.limit = limit

        print(f"[load] fetching mit-bih record {record}...")
        self.signal, self.ann_map = load_record(record)
        if limit:
            self.signal = self.signal[:limit]
        print(f"[load] {len(self.signal)} samples ({len(self.signal)/FS:.1f}s)")

        print(f"[uart] opening {port} @ 115200...")
        self.ser = serial.Serial(port, 115200, timeout=0.1)
        time.sleep(0.3)
        self.ser.reset_input_buffer()
        self.ser.reset_output_buffer()

        self.stop = False
        self.results = []
        self.lock = threading.Lock()

    def sender(self):
        period = 1.0 / FS
        t0 = time.time()
        for i, val in enumerate(self.signal):
            if self.stop:
                break
            # pace to 360 hz
            target = t0 + i * period
            now = time.time()
            if target > now:
                time.sleep(target - now)

            # 12-bit value as 2 bytes, big-endian
            hi = (val >> 8) & 0x0F
            lo = val & 0xFF
            self.ser.write(bytes([hi, lo]))

            if (i + 1) % 360 == 0:
                print(f"[tx] {i+1} samples ({(i+1)/FS:.1f}s)")

        print("[tx] done")

    def receiver(self):
        expected = len(self.signal)
        got = 0
        while not self.stop and got < expected:
            data = self.ser.read(2)
            if len(data) < 2:
                continue
            raw = ((data[0] & 0x0F) << 8) | data[1]
            parsed = parse_result(raw, self.mode)
            parsed['sample_idx'] = got
            parsed['timestamp'] = datetime.now().isoformat(timespec='milliseconds')
            parsed['ecg_value'] = int(self.signal[got]) if got < len(self.signal) else ''
            parsed['ground_truth'] = self.ann_map.get(got, '')
            with self.lock:
                self.results.append(parsed)
            got += 1
            if got % 360 == 0:
                print(f"[rx] {got} results")
        print(f"[rx] done ({got} results)")

    def run(self):
        tx = threading.Thread(target=self.sender, daemon=True)
        rx = threading.Thread(target=self.receiver, daemon=True)
        tx.start()
        rx.start()
        try:
            while tx.is_alive() or rx.is_alive():
                time.sleep(0.2)
        except KeyboardInterrupt:
            print("\n[main] stopping...")
            self.stop = True
            tx.join(timeout=2)
            rx.join(timeout=2)

        self.ser.close()
        self.write_csv()

    def write_csv(self):
        fields = ['sample_idx', 'timestamp', 'ecg_value',
                  'spike_p', 'spike_n', 'fire', 'winner', 'ground_truth']
        with open(self.outfile, 'w', newline='') as f:
            w = csv.DictWriter(f, fieldnames=fields)
            w.writeheader()
            with self.lock:
                w.writerows(self.results)
        print(f"[csv] wrote {len(self.results)} rows to {self.outfile}")


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--port', required=True, help='COM3 on windows, /dev/ttyUSB0 on linux')
    p.add_argument('--record', type=int, default=100, help='mit-bih record number')
    p.add_argument('--mode', choices=['snn', 'encoding'], default='snn')
    p.add_argument('--out', default='fpga_results.csv')
    p.add_argument('--limit', type=int, default=None, help='cap samples for short tests')
    args = p.parse_args()

    s = Streamer(args.port, args.record, args.mode, args.out, args.limit)
    s.run()


if __name__ == '__main__':
    main()