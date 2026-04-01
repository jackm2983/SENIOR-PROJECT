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
    output logic sample_pulse,
    output logic [WIDTH-1:0] spikeP,
    output logic [WIDTH-1:0] spikeN
);

    logic [WIDTH-1:0] spikeP_rate,      spikeN_rate;
    logic [WIDTH-1:0] spikeP_temporal,  spikeN_temporal;
    logic [WIDTH-1:0] spikeP_delta,     spikeN_delta;
    logic [WIDTH-1:0] spikeP_multispike,spikeN_multispike;


    //sample clk generation
    logic [15:0] sample_cnt;
    always_ff @(posedge clk) begin
        if (rst) begin
            sample_cnt <= 0;
            sample_pulse <= 0;
        end else begin
            sample_pulse <= 0;
            sample_cnt <= sample_cnt + 1;
            if (sample_cnt >= divider) begin
                sample_cnt <= 0;
                sample_pulse <= 1;
            end
        end
    end

    //clk gating
    logic [3:0] clk_gated;
    logic [3:0] clk_en;

    rate_mod #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH)
    ) rate_encoder (
        .clk(clk_gated[0]),
        .rst(rst),
        .sample_pulse(sample_pulse),
        .data_in(data_in),
        .divider(divider),
        .spikeP(spikeP_rate),
        .spikeN(spikeN_rate)
    );

    temporal_mod #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH)
    ) temporal_encoder (
        .clk(clk_gated[1]),
        .rst(rst),
        .sample_pulse(sample_pulse),
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
        .clk(clk_gated[2]),
        .rst(rst),
        .sample_pulse(sample_pulse),
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
        .clk(clk_gated[3]),
        .rst(rst),
        .sample_pulse(sample_pulse),
        .data_in(data_in),
        .divider(divider),
        .spikeP(spikeP_multispike),
        .spikeN(spikeN_multispike)
    );

    always_comb begin
        clk_en = 0;
        unique case (encoding_select)
            2'b00: begin spikeP = spikeP_rate;       spikeN = spikeN_rate;          clk_en[0] = 1;   end
            2'b01: begin spikeP = spikeP_temporal;   spikeN = spikeN_temporal;      clk_en[1] = 1;   end
            2'b10: begin spikeP = spikeP_delta;      spikeN = spikeN_delta;         clk_en[2] = 1;   end
            default: begin spikeP = spikeP_multispike; spikeN = spikeN_multispike;  clk_en[3] = 1;   end
        endcase
        clk_gated = {clk&clk_en[3] , clk&clk_en[2] , clk&clk_en[1] , clk&clk_en[0]}; 
    end

endmodule