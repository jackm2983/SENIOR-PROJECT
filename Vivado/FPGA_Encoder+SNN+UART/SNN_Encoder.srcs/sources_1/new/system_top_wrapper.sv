`timescale 1ns / 1ps

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
    parameter int XADC_DECIMATION = 2670  // ~961 KSPS → 360 Hz
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
 
    // ============ UART Interface ============
    logic [DATA_WIDTH-1:0] uart_rx_data;
    logic uart_rx_valid;
    logic uart_rx_ready;
    
    logic [DATA_WIDTH-1:0] uart_tx_data;
    logic uart_tx_valid;
    logic uart_tx_ready;
    
    uart_wrapper #(
        .DATA_WIDTH(DATA_WIDTH),
        .BAUD_RATE(BAUD_RATE),
        .CLK_FREQ(CLK_FREQ)
    ) uart_inst (
        .clk(clk),
        .rst(rst),
        .uart_rx(uart_rx),
        .uart_tx(uart_tx),
        .rx_data(uart_rx_data),
        .rx_valid(uart_rx_valid),
        .rx_ready(uart_rx_ready),
        .tx_data(uart_tx_data),
        .tx_valid(uart_tx_valid),
        .tx_ready(uart_tx_ready)
    );
    
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
    
    // ============ Encoding Wrapper ============
    logic [WIDTH-1:0] enc_spikeP, enc_spikeN;
    logic enc_sample_pulse;
    
    // pack spike outputs for transmission
    // [11:2] = ecg value (for context/debugging)
    // [1] = spikeP, [0] = spikeN
    logic [DATA_WIDTH-1:0] enc_output;
    always_comb begin
        enc_output = {input_data[9:0], enc_spikeP, enc_spikeN};
    end
    
    TOP_wrapper #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH),
        .MAX_SPIKES(MAX_SPIKES),
        .JUMP(JUMP)
    ) encoder_inst (
        .clk(clk),
        .rst(rst),
        .data_in(input_data),
        .divider(16'(ENC_DIVIDER)),
        .encoding_select(encoding_select),
        .sample_pulse(enc_sample_pulse),
        .spikeP(enc_spikeP),
        .spikeN(enc_spikeN)
    );
    
    // ============ SNN Wrapper ============
    logic [N_neurons-1:0] snn_fire;
    logic [N_neurons-1:0] snn_winner;
    
    // pack snn outputs for uart transmission
    // [11:8] = unused, [7:5] = winner, [4:0] = fire
    logic [DATA_WIDTH-1:0] snn_output;
    always_comb begin
        snn_output = {7'b0, snn_winner, snn_fire};
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
        .ecg_in(input_data),
        .fire(snn_fire),
        .winner(snn_winner)
    );
    
    // ============ Processing Mode Mux ============
    logic [DATA_WIDTH-1:0] process_output;
    logic process_valid;
    logic process_mode_is_snn;
    
    assign process_mode_is_snn = (process_mode_select == 2'b1);
    
    always_comb begin
        if (process_mode_is_snn) begin
            process_output = snn_output;
            process_valid = input_valid;
        end else begin
            process_output = enc_output;
            process_valid = input_valid;
        end
    end
    
    // ============ UART TX Control ============
    assign uart_tx_data = process_output;
    assign uart_tx_valid = process_valid;
    
    // ============ Status LEDs ============
    // [0] = uart rx valid
    // [1] = adc valid
    // [2] = processing active
    // [3] = uart tx ready
    // [4] = in encoding mode
    // [5] = in snn mode
    // [6] = input is uart
    // [7] = reset state
    always_comb begin
        status_led[0] = uart_rx_valid;
        status_led[1] = adc_valid;
        status_led[2] = process_valid;
        status_led[3] = uart_tx_ready;
        status_led[4] = ~process_mode_is_snn;
        status_led[5] = process_mode_is_snn;
        status_led[6] = input_from_uart;
        status_led[7] = rst;
    end
 
endmodule