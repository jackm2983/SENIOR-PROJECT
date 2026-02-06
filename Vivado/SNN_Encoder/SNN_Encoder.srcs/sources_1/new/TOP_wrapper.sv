`timescale 1ns / 1ps

module TOP_wrapper
    #(parameter WIDTH = 1,
      parameter LENGTH = 12,
      parameter MAX_SPIKES = 16,
      parameter JUMP = 5)
(
    input logic clk,
    input logic rst,
    input logic [LENGTH-1:0] data_in [WIDTH],
    input logic [15:0] divider,
    input logic [1:0] encoding_select,  // 00=rate, 01=temporal, 10=delta, 11=multispike
    output logic spikeP [WIDTH],
    output logic spikeN [WIDTH]
);

    // intermediate signals
    logic spikeP_rate [WIDTH];
    logic spikeN_rate [WIDTH];
    logic spikeP_temporal [WIDTH];
    logic spikeN_temporal [WIDTH];
    logic spikeP_delta [WIDTH];
    logic spikeN_delta [WIDTH];
    logic spikeP_multispike [WIDTH];
    logic spikeN_multispike [WIDTH];

    // encoders
    rate_mod #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH)
    ) rate_encoder (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .divider(divider),
        .spikeP(spikeP_rate),
        .spikeN(spikeN_rate)
    );

    temporal_mod #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH)
    ) temporal_encoder (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .divider(divider),
        .spikeP(spikeP_temporal),
        .spikeN(spikeN_temporal)
    );

    delta_mod #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH),
        .JUMP(JUMP)
    ) delta_encoder (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .divider(divider),
        .spikeP(spikeP_delta),
        .spikeN(spikeN_delta)
    );

    multispike_mod #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH),
        .MAX_SPIKES(MAX_SPIKES)
    ) multispike_encoder (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .divider(divider),
        .spikeP(spikeP_multispike),
        .spikeN(spikeN_multispike)
    );

    // mux
    always_comb begin
        case (encoding_select)
            2'b00: begin  // Rate encoding
                spikeP = spikeP_rate;
                spikeN = spikeN_rate;
            end
            2'b01: begin  // Temporal encoding
                spikeP = spikeP_temporal;
                spikeN = spikeN_temporal;
            end
            2'b10: begin  // Delta encoding
                spikeP = spikeP_delta;
                spikeN = spikeN_delta;
            end
            2'b11: begin  // Multispike encoding
                spikeP = spikeP_multispike;
                spikeN = spikeN_multispike;
            end
        endcase
    end

endmodule