`timescale 1ns / 1ps

// ============================================================================
// System Top Wrapper (BASYS3 MIT-BIH + Live ECG)
// ============================================================================
// Request/response pipeline: PC sends ECG samples in, FPGA sends processed
// results back. 
//
// Data flow:
//   [UART RX or XADC] -> input mux -> [our encoders or grad student's SNN {with delta encoding}] -> UART TX
//
// Input mux (SW[0]):
//   0 = UART RX from PC      (MIT-BIH playback at 115200 baud, 12-bit samples)
//   1 = XADC from JXADC J3/K3 (live ECG from AD8232, sampled at ~961 KSPS
//                              then decimated to 360 Hz)
//
// Processing mux (SW[2]):
//   0 = Encoder (4 types selectable via SW[4:5]: rate/temporal/delta/multi)
//       each sample runs a fixed spike-count window. TX packs:
//       {spikeP_count[5:0], spikeN_count[5:0]} (saturating 6-bit counts)
//       only delta produces spikeN, so spikeN_count is 0 for the others.
//   1 = SNN classification
//       TX packs: {7'b0, winner[N_neurons-1:0], fire[N_neurons-1:0]}
//       winner = index of firing neuron, fire = bitmask of all firings
//
// Status LEDs:
//   [0] uart rx valid   [4] encoding_select[0]
//   [1] adc valid       [5] in snn mode
//   [2] processing      [6] encoding_select[1]
//   [3] uart tx ready    [7] reset active
//
//   so leds [6:4] read: snn(bit5), enc_msb(bit6), enc_lsb(bit4).
//   in encoding mode (led5 off), {led6,led4} = which encoder is live:
//     00 rate   01 temporal   10 delta   11 multispike
// ============================================================================
 


module system_top_wrapper #(
    parameter int WIDTH = 1,
    parameter int LENGTH = 12,
    parameter int MAX_SPIKES = 16,
    parameter int JUMP = 5,
    parameter int N_inputs = 2,
    parameter int N_neurons = 5,
    parameter int b_weight = 4,
    parameter int b_accum = 8,
    parameter int b_thresh = 8,
    parameter int b_time = 3,
    parameter int LEARN = 3,
    parameter int DATA_WIDTH = 12,
    parameter int BAUD_RATE = 115200,
    parameter int CLK_FREQ = 100_000_000,
    parameter int ENC_DIVIDER = 100,
    parameter int XADC_DECIMATION = 2670,  // ~961 KSPS → 360 Hz
    // cycles to wait after a sample arrives before latching the result for tx.
    // used directly for snn mode: the sigma-delta tracker plus neuron
    // integration needs a few hundred cycles of held input to cross threshold
    // (verified ~50-150 cycles in sim). 512 is safe. on real hw the sample is
    // held ~278k cycles between samples at 360 Hz so this is comfortable.
    parameter int RESULT_LATENCY = 512,
    // encoder processing window. the time-based encoders (rate/temporal/
    // multispike) spread a sample's spikes across cycles between samples, so
    // each sample needs a fixed window to spike into. temporal places its
    // single spike at spike_location == sample value (up to 4095), so the
    // window must exceed 4095 to capture any sample. 4096 covers it. at 100 MHz
    // that is ~41 us per sample, well under the 2.78 ms real 360 Hz period.
    parameter int ENC_WINDOW = 4096
)(
    input logic clk,
    input logic rst,
    
    // uart over usb
    input logic uart_rx,
    output logic uart_tx,
    
    // live ecg on pmod jxadc column 1 (J3/K3)
    input logic vauxp6,
    input logic vauxn6,
    
    // basys3 switches
    input logic [1:0] input_select,        // 0=uart, 1=adc
    input logic [1:0] process_mode_select, // 0=encoding, 1=snn
    input logic [1:0] encoding_select,     // which of 4 encodings
    
    // status leds
    output logic [7:0] status_led
);
 
    // ============ XADC Adapter (Live ECG) ============
    logic [DATA_WIDTH-1:0] adc_data;
    logic adc_valid;
    
    xadc_adapter xadc_inst (
        .clk(clk),
        .rst(rst),
        .vauxp6(vauxp6),
        .vauxn6(vauxn6),
        .adc_data(adc_data),
        .adc_valid(adc_valid),
        .decimation_count(16'(XADC_DECIMATION))
    );
 
    // ============ UART Interface (8-bit byte level) ============
    // standard uart is 8 data bits per frame. samples and results are 12-bit,
    // so they are carried as two bytes each (hi nibble, then lo byte), matching
    // the host streamer. assembly/disassembly fsms below bridge byte<->sample.
    logic [7:0] uart_rx_byte;
    logic       uart_rx_byte_valid;
    logic       uart_rx_ready;

    logic [7:0] uart_tx_byte;
    logic       uart_tx_byte_valid;
    logic       uart_tx_ready;

    uart_wrapper #(
        .DATA_WIDTH(8),
        .BAUD_RATE(BAUD_RATE),
        .CLK_FREQ(CLK_FREQ)
    ) uart_inst (
        .clk(clk),
        .rst(rst),
        .uart_rx(uart_rx),
        .uart_tx(uart_tx),
        .rx_data(uart_rx_byte),
        .rx_valid(uart_rx_byte_valid),
        .rx_ready(uart_rx_ready),
        .tx_data(uart_tx_byte),
        .tx_valid(uart_tx_byte_valid),
        .tx_ready(uart_tx_ready)
    );

    // ---- RX byte assembly: 2 bytes -> 12-bit sample ----
    // host sends: byte0 = {4'b0, val[11:8]}, byte1 = val[7:0]
    logic [DATA_WIDTH-1:0] uart_rx_data;
    logic                  uart_rx_valid;
    logic                  rx_have_hi;
    logic [3:0]            rx_hi_nib;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            rx_have_hi    <= 1'b0;
            rx_hi_nib     <= '0;
            uart_rx_data  <= '0;
            uart_rx_valid <= 1'b0;
        end else begin
            uart_rx_valid <= 1'b0;                 // one-cycle pulse
            if (uart_rx_byte_valid) begin
                if (!rx_have_hi) begin
                    rx_hi_nib  <= uart_rx_byte[3:0];
                    rx_have_hi <= 1'b1;
                end else begin
                    uart_rx_data  <= {rx_hi_nib, uart_rx_byte};
                    uart_rx_valid <= 1'b1;         // full sample ready
                    rx_have_hi    <= 1'b0;
                end
            end
        end
    end

    
    // ============ Input Mux (UART vs ADC) ============
    logic [DATA_WIDTH-1:0] input_data;
    logic input_valid;
    logic input_from_uart;
    
    assign input_from_uart = (input_select == 2'b0);
    
    always_comb begin
        if (input_from_uart) begin
            input_data = uart_rx_data;
            input_valid = uart_rx_valid;
        end else begin
            input_data = adc_data;
            input_valid = adc_valid;
        end
    end
    
    logic [DATA_WIDTH-1:0] input_data_q;
    logic input_valid_q;
 
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            input_data_q  <= '0;
            input_valid_q <= 1'b0;
        end else begin
            input_data_q  <= input_data;
            input_valid_q <= input_valid;
        end
    end
    
    // ============ Encoding Wrapper ============
    logic [WIDTH-1:0] enc_spikeP, enc_spikeN;

    // one sample_pulse per arriving sample. input_valid_q is input_valid
    // delayed one cycle, which lines up with input_data_q at the encoders.
    logic enc_sample_pulse;
    assign enc_sample_pulse = input_valid_q;

    TOP_wrapper #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH),
        .MAX_SPIKES(MAX_SPIKES),
        .JUMP(JUMP)
    ) encoder_inst (
        .clk(clk),
        .rst(rst),
        .data_in(input_data_q),
        .divider(16'(ENC_DIVIDER)),
        .encoding_select(encoding_select),
        .sample_pulse(enc_sample_pulse),
        .spikeP(enc_spikeP),
        .spikeN(enc_spikeN)
    );

    // ---- windowed spike counting ----
    // the time-based encoders emit spikes spread over many cycles after a
    // sample. we run a fixed ENC_WINDOW window per sample, count spikeP and
    // spikeN over it, then report the counts. delta still works here too: its
    // spikes just land early in the window.
    //
    // packing for encoding mode (12 bits) depends on encoder type:
    //   rate / delta / multispike (count-coded):
    //     [11:6] spikeP count (saturating 0..63)  [5:0] spikeN count
    //   temporal (time-coded): value is the spike POSITION in the window, not
    //     the count (count is always 1). we capture the first-spike timestamp
    //     and report it scaled to 6 bits so it traces the ecg shape.
    //     [11:6] position>>6 (0..63)  [5:0] 0
    localparam int CNT_BITS = 6;
    localparam int CNT_MAX  = (1 << CNT_BITS) - 1;

    logic [$clog2(ENC_WINDOW+1)-1:0] win_cnt;
    logic                            win_busy;
    logic                            win_done;       // 1-cycle pulse at end
    logic [CNT_BITS-1:0]             pcount, ncount; // live counters
    logic [CNT_BITS-1:0]             pcount_q, ncount_q; // latched result

    // first-spike timestamp (for temporal position readout)
    logic [$clog2(ENC_WINDOW+1)-1:0] first_pos;     // win_cnt at first spikeP
    logic                            got_first;
    logic [$clog2(ENC_WINDOW+1)-1:0] first_pos_q;

    logic is_temporal;
    assign is_temporal = (encoding_select == 2'b01);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            win_cnt   <= '0;
            win_busy  <= 1'b0;
            win_done  <= 1'b0;
            pcount    <= '0;
            ncount    <= '0;
            pcount_q  <= '0;
            ncount_q  <= '0;
            first_pos <= '0;
            got_first <= 1'b0;
            first_pos_q <= '0;
        end else begin
            win_done <= 1'b0;
            if (enc_sample_pulse) begin
                // start a fresh window for this sample
                win_cnt   <= '0;
                win_busy  <= 1'b1;
                pcount    <= '0;
                ncount    <= '0;
                first_pos <= '0;
                got_first <= 1'b0;
            end else if (win_busy) begin
                // accumulate spikes, saturating
                if (enc_spikeP && pcount != CNT_MAX[CNT_BITS-1:0])
                    pcount <= pcount + 1'b1;
                if (enc_spikeN && ncount != CNT_MAX[CNT_BITS-1:0])
                    ncount <= ncount + 1'b1;

                // capture position of the first spikeP this window
                if (enc_spikeP && !got_first) begin
                    first_pos <= win_cnt;
                    got_first <= 1'b1;
                end

                if (win_cnt == ENC_WINDOW[$bits(win_cnt)-1:0]) begin
                    win_busy    <= 1'b0;
                    win_done    <= 1'b1;
                    pcount_q    <= pcount;
                    ncount_q    <= ncount;
                    first_pos_q <= first_pos;
                end else begin
                    win_cnt <= win_cnt + 1'b1;
                end
            end
        end
    end

    // scale position (0..ENC_WINDOW) down to 6 bits for the readout field
    logic [CNT_BITS-1:0] pos_scaled;
    assign pos_scaled = first_pos_q[$clog2(ENC_WINDOW+1)-1 -: CNT_BITS];

    logic [DATA_WIDTH-1:0] enc_output;
    assign enc_output = is_temporal ? {pos_scaled, 6'b0}
                                    : {pcount_q, ncount_q};
    
    // ============ SNN Wrapper ============
    logic [N_neurons-1:0] snn_fire;
    logic [N_neurons-1:0] snn_winner;

    // fire/winner are transient pulses. the result strobe samples one instant,
    // so we OR-capture any fire during the window and hold the winner from the
    // first firing. captures reset on each new sample.
    logic [N_neurons-1:0] snn_fire_sticky;
    logic [N_neurons-1:0] snn_winner_sticky;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            snn_fire_sticky   <= '0;
            snn_winner_sticky <= '0;
        end else if (input_valid) begin
            snn_fire_sticky   <= '0;     // new sample, clear
            snn_winner_sticky <= '0;
        end else begin
            if (snn_fire != 0) begin
                snn_fire_sticky <= snn_fire_sticky | snn_fire;
                if (snn_winner_sticky == 0)
                    snn_winner_sticky <= snn_winner;
            end
        end
    end

    // pack snn outputs for uart transmission
    // [11:8] = unused, [7:5] = winner, [4:0] = fire
    logic [DATA_WIDTH-1:0] snn_output;
    always_comb begin
        snn_output = {7'b0, snn_winner_sticky, snn_fire_sticky};
    end
    
    scan_chain_wrapper #(
        .N_inputs(N_inputs),
        .N_neurons(N_neurons),
        .b_weight(b_weight),
        .b_accum(b_accum),
        .b_thresh(b_thresh),
        .b_time(b_time),
        .LEARN(LEARN),
        .DATA_WIDTH(DATA_WIDTH)
    ) snn_inst (
        .clk(clk),
        .reset(rst),
        .prog_clk(1'b0),
        .prog_data(1'b0),
        .load_config(1'b0),
        .dm_reset(rst),
        .ecg_in(input_data_q),
        .fire(snn_fire),
        .winner(snn_winner)
    );
    
    // ============ Processing Mode Mux ============
    logic [DATA_WIDTH-1:0] process_output;
    logic process_mode_is_snn;
    
    assign process_mode_is_snn = (process_mode_select == 2'b1);
    
    // output mux only. the valid is generated separately below, delayed so the
    // selected pipeline has settled before tx latches it.
    always_comb begin
        if (process_mode_is_snn) process_output = snn_output;
        else                     process_output = enc_output;
    end

    // ============ Result Strobe ============
    // encoding mode: result is ready when the spike-count window finishes.
    // snn mode: snn fires within a few cycles, use the short latency countdown.
    logic process_valid;
    logic [$clog2(RESULT_LATENCY+1)-1:0] lat_cnt;
    logic lat_busy;
    logic snn_strobe;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            lat_cnt    <= '0;
            lat_busy   <= 1'b0;
            snn_strobe <= 1'b0;
        end else begin
            snn_strobe <= 1'b0;
            if (input_valid) begin
                lat_cnt  <= '0;
                lat_busy <= 1'b1;
            end else if (lat_busy) begin
                if (lat_cnt == RESULT_LATENCY[$bits(lat_cnt)-1:0]) begin
                    snn_strobe <= 1'b1;
                    lat_busy   <= 1'b0;
                end else begin
                    lat_cnt <= lat_cnt + 1;
                end
            end
        end
    end

    // pick the strobe for the active mode
    assign process_valid = process_mode_is_snn ? snn_strobe : win_done;
    
    // ============ UART TX Control (12-bit sample -> 2 bytes) ============
    // on process_valid, latch the 12-bit result and send it as two bytes:
    //   byte0 = {4'b0, result[11:8]}  (hi nibble)
    //   byte1 = result[7:0]           (lo byte)
    // this mirrors the host packing so parse_result reassembles correctly.
    typedef enum logic [2:0] {TX_IDLE, TX_HI, TX_HI_WAIT, TX_LO, TX_LO_WAIT} tx_seq_t;
    tx_seq_t              tx_seq;
    logic [DATA_WIDTH-1:0] tx_sample;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            tx_seq             <= TX_IDLE;
            tx_sample          <= '0;
            uart_tx_byte       <= '0;
            uart_tx_byte_valid <= 1'b0;
        end else begin
            uart_tx_byte_valid <= 1'b0;
            case (tx_seq)
                TX_IDLE: begin
                    if (process_valid) begin
                        tx_sample <= process_output;
                        tx_seq    <= TX_HI;
                    end
                end
                // present hi byte when tx is ready
                TX_HI: begin
                    if (uart_tx_ready) begin
                        uart_tx_byte       <= {4'b0, tx_sample[11:8]};
                        uart_tx_byte_valid <= 1'b1;
                        tx_seq             <= TX_HI_WAIT;
                    end
                end
                // wait for tx to accept (ready drops) then for it to finish
                TX_HI_WAIT: begin
                    if (!uart_tx_ready) tx_seq <= TX_LO;   // byte taken
                end
                // present lo byte when tx is ready again
                TX_LO: begin
                    if (uart_tx_ready) begin
                        uart_tx_byte       <= tx_sample[7:0];
                        uart_tx_byte_valid <= 1'b1;
                        tx_seq             <= TX_LO_WAIT;
                    end
                end
                TX_LO_WAIT: begin
                    if (!uart_tx_ready) tx_seq <= TX_IDLE;  // done
                end
                default: tx_seq <= TX_IDLE;
            endcase
        end
    end

    // ============ Status LEDs ============
    // [0] = uart rx valid
    // [1] = adc valid
    // [2] = result strobe (process_valid)
    // [3] = uart tx ready
    // [4] = encoding_select[0]
    // [5] = in snn mode
    // [6] = encoding_select[1]
    // [7] = reset state
    always_comb begin
        status_led[0] = uart_rx_valid;
        status_led[1] = adc_valid;
        status_led[2] = process_valid;
        status_led[3] = uart_tx_ready;
        status_led[4] = encoding_select[0];   // live encoder lsb
        status_led[5] = process_mode_is_snn;
        status_led[6] = encoding_select[1];   // live encoder msb
        status_led[7] = rst;
    end
 
endmodule