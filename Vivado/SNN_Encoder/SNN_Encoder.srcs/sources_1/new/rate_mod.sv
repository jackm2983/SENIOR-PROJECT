`timescale 1ns / 1ps
module rate_mod
    #(parameter WIDTH = 1,
      parameter LENGTH = 12)
(
    input logic clk,
    input logic rst,
    input logic [LENGTH-1:0] data_in [WIDTH],
    input logic [15:0] divider,
    output logic spikeP [WIDTH],
    output logic spikeN [WIDTH]
);
    assign spikeN = '{default: 0};  // Not used in rate encoding
    
    // Generate sample pulse
    logic [15:0] sample_cnt;
    logic sample_pulse;
    
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
    
    // Rate encoding logic - all on main clock
    logic [LENGTH-1:0] rate_counter [WIDTH];
    logic [LENGTH-1:0] threshold [WIDTH];
    
    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < WIDTH; i++) begin
                rate_counter[i] <= 0;
                threshold[i] <= 0;
                spikeP[i] <= 0;
            end
        end else begin
            for (int i = 0; i < WIDTH; i++) begin
                // Update threshold at sample time
                if (sample_pulse) begin
                    threshold[i] <= data_in[i];
                    rate_counter[i] <= 0;  // Reset counter at new sample
                end
                
                // Increment counter every clock
                rate_counter[i] <= rate_counter[i] + 1;
                
                // Fire spike when counter exceeds inverse of input
                // higher input = lower threshold = more frequent spikes
                if (threshold[i] == 0) begin
                    spikeP[i] <= 0;  // No spikes if input is 0
                end else if (rate_counter[i] >= ((2**LENGTH - 1) - threshold[i])) begin
                    spikeP[i] <= 1;
                    rate_counter[i] <= 0;
                end else begin
                    spikeP[i] <= 0;
                end
            end
        end
    end
endmodule