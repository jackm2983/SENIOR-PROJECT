`timescale 1ns / 1ps

module rate_mod
    #(parameter WIDTH = 1,
      parameter LENGTH = 12)
(
    input  logic                     clk,
    input  logic                     rst,
    input  logic                     sample_pulse,
    input  logic [WIDTH*LENGTH-1:0]  data_in,
    input  logic [15:0]              divider,
    output logic [WIDTH-1:0]         spikeP,
    output logic [WIDTH-1:0]         spikeN
);
    assign spikeN = {WIDTH{1'b0}};
    
    
    // unpack input vector
    logic [LENGTH-1:0] data_in_array [0:WIDTH-1];
    generate
        for (genvar i = 0; i < WIDTH; i++) begin : g_data_in
            assign data_in_array[i] = data_in[i*LENGTH +: LENGTH];
        end
    endgenerate
    
    logic [LENGTH-1:0] data_in_q [0:WIDTH-1];
    always_ff @(posedge clk) begin
        for (int i = 0; i < WIDTH; i++) begin
            data_in_q[i] <= data_in_array[i];
        end
    end

    // local registered copy of sample_pulse. placed close to threshold/counter
    // regs so the CE net stays short. adds 1 cycle latency, fine at 360 Hz.
    logic sample_pulse_q;
    always_ff @(posedge clk) begin
        if (rst) sample_pulse_q <= 1'b0;
        else     sample_pulse_q <= sample_pulse;
    end

    // rate encoding
    logic [LENGTH-1:0] rate_counter [0:WIDTH-1];
    logic [LENGTH-1:0] threshold    [0:WIDTH-1];

    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < WIDTH; i++) begin
                rate_counter[i] <= '0;
                threshold[i]    <= '0;
                spikeP[i]       <= 1'b0;
            end
        end else begin
            for (int i = 0; i < WIDTH; i++) begin
                // explicit priority ordering to avoid multiple non-blocking
                // assignments stomping on rate_counter in the same cycle
                if (sample_pulse_q) begin
                    threshold[i]    <= data_in_q[i];
                    rate_counter[i] <= '0;
                    spikeP[i]       <= 1'b0;
                end else if (threshold[i] == '0) begin
                    spikeP[i]       <= 1'b0;
                    rate_counter[i] <= '0;
                end else if (rate_counter[i] >= ((2**LENGTH - 1) - threshold[i])) begin
                    spikeP[i]       <= 1'b1;
                    rate_counter[i] <= '0;
                end else begin
                    spikeP[i]       <= 1'b0;
                    rate_counter[i] <= rate_counter[i] + 1;
                end
            end
        end
    end

endmodule