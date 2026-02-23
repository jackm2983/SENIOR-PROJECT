`timescale 1ns / 1ps

module TOP_wrapper #(
    parameter int WIDTH = 1,
    parameter int LENGTH = 12,
    parameter int MAX_SPIKES = 16,
    parameter int JUMP = 5
)(
    input  logic clk,
    input  logic rst,
    input  logic [WIDTH*LENGTH-1:0] data_in,
    input  logic [15:0] divider,
    input  logic [1:0] encoding_select,
    output logic [WIDTH-1:0] spikeP,
    output logic [WIDTH-1:0] spikeN
);

    logic [WIDTH-1:0] spikeP_rate,      spikeN_rate;
    logic [WIDTH-1:0] spikeP_temporal,  spikeN_temporal;
    logic [WIDTH-1:0] spikeP_delta,     spikeN_delta;
    logic [WIDTH-1:0] spikeP_multispike,spikeN_multispike;

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

    always_comb begin
        unique case (encoding_select)
            2'b00: begin spikeP = spikeP_rate;       spikeN = spikeN_rate;       end
            2'b01: begin spikeP = spikeP_temporal;   spikeN = spikeN_temporal;   end
            2'b10: begin spikeP = spikeP_delta;      spikeN = spikeN_delta;      end
            default: begin spikeP = spikeP_multispike; spikeN = spikeN_multispike; end
        endcase
    end

endmodule