`timescale 1ns / 1ps

module delta_mod #(
    parameter int WIDTH  = 1,
    parameter int LENGTH = 12,
    parameter int JUMP   = 5
)(
    input  logic                     clk,
    input  logic                     rst,
    input  logic                     sample_pulse,
    input  logic [WIDTH*LENGTH-1:0]  data_in,
    input  logic [15:0]              divider,
    output logic [WIDTH-1:0]         spikeP,
    output logic [WIDTH-1:0]         spikeN
);
    // unpack input vector
    logic [LENGTH-1:0] data_in_array [0:WIDTH-1];
    generate
        for (genvar i = 0; i < WIDTH; i++) begin : g_di
            assign data_in_array[i] = data_in[i*LENGTH +: LENGTH];
        end
    endgenerate

    logic [LENGTH-1:0] data_in_q [0:WIDTH-1];
    always_ff @(posedge clk) begin
        for (int i = 0; i < WIDTH; i++) begin
            data_in_q[i] <= data_in_array[i];
        end
    end

    // local sample_pulse register for hold timing
    logic sample_pulse_q;
    always_ff @(posedge clk) begin
        if (rst) sample_pulse_q <= 1'b0;
        else     sample_pulse_q <= sample_pulse;
    end

    logic [LENGTH-1:0] previous [0:WIDTH-1];

    // 13-bit signed diff: zero-extend unsigned inputs to 13 bits, then
    // interpret as signed. range is [-4095, +4095] for LENGTH=12, no overflow.
    logic signed [LENGTH:0] diff [0:WIDTH-1];
    always_comb begin
        for (int i = 0; i < WIDTH; i++) begin
            diff[i] = signed'({1'b0, data_in_q[i]}) - signed'({1'b0, previous[i]});
        end
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            spikeP <= '0;
            spikeN <= '0;
            for (int i = 0; i < WIDTH; i++) previous[i] <= '0;
        end else begin
            spikeP <= '0;
            spikeN <= '0;
            if (sample_pulse_q) begin
                for (int i = 0; i < WIDTH; i++) begin
                    if (diff[i] >  $signed(JUMP)) spikeP[i] <= 1'b1;
                    if (diff[i] < -$signed(JUMP)) spikeN[i] <= 1'b1;
                    previous[i] <= data_in_q[i];
                end
            end
        end
    end

endmodule