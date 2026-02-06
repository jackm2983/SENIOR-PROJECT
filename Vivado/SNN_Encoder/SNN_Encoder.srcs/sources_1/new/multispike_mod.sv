`timescale 1ns / 1ps
module multispike_mod
    #(parameter WIDTH = 1,
      parameter LENGTH = 12,
      parameter MAX_SPIKES = 16)
(
    input logic clk,
    input logic rst,
    input logic [LENGTH-1:0] data_in [WIDTH],
    input logic [15:0] divider = 2081,
    output logic spikeP [WIDTH],
    output logic spikeN [WIDTH]
);
    assign spikeN = '{default: 0};
    
    // Generate sample clock
    logic [15:0] sample_cnt;
    logic sample_pulse;  // Single-cycle pulse at sample time
    
    always_ff @(posedge clk) begin
        if (rst) begin
            sample_cnt <= 0;
            sample_pulse <= 0;
        end else begin
            sample_pulse <= 0;  // Default to 0
            sample_cnt <= sample_cnt + 1;
            if (sample_cnt >= divider) begin
                sample_cnt <= 0;
                sample_pulse <= 1;  // Pulse for one cycle
            end
        end
    end
    
    // Multi-spike encoding logic
    logic [$clog2(MAX_SPIKES+1)-1:0] num_spikes [WIDTH];
    logic [$clog2(MAX_SPIKES+1)-1:0] spike_count [WIDTH];
    logic [15:0] spike_interval [WIDTH];
    logic [15:0] interval_counter [WIDTH];
    logic [$clog2(MAX_SPIKES+1)-1:0] temp_spikes [WIDTH];  // Moved outside always block
    
    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < WIDTH; i++) begin
                num_spikes[i] <= 0;
                spike_count[i] <= 0;
                spike_interval[i] <= '1;
                interval_counter[i] <= 0;
                spikeP[i] <= 0;
                temp_spikes[i] <= 0;
            end
        end else begin
            for (int i = 0; i < WIDTH; i++) begin
                // At start of new sample period, calculate parameters
                if (sample_pulse) begin
                    // Calculate number of spikes
                    temp_spikes[i] <= (data_in[i] * MAX_SPIKES) >> LENGTH;
                    num_spikes[i] <= (data_in[i] * MAX_SPIKES) >> LENGTH;
                    
                    // Calculate interval between spikes
                    if (((data_in[i] * MAX_SPIKES) >> LENGTH) == 0) begin
                        spike_interval[i] <= '1;  // Max value, no spikes
                    end else begin
                        // interval = (2*divider) / num_spikes
                        spike_interval[i] <= (divider << 1) / ((data_in[i] * MAX_SPIKES) >> LENGTH);
                    end
                    
                    // Reset counters for new period
                    spike_count[i] <= 0;
                    interval_counter[i] <= 0;
                    spikeP[i] <= 0;
                    
                end else begin
                    // Normal spike generation
                    interval_counter[i] <= interval_counter[i] + 1;
                    
                    // Check if it's time for next spike
                    if (spike_count[i] < num_spikes[i] && 
                        interval_counter[i] >= spike_interval[i]) begin
                        spikeP[i] <= 1;
                        spike_count[i] <= spike_count[i] + 1;
                        interval_counter[i] <= 0;
                    end else begin
                        spikeP[i] <= 0;
                    end
                end
            end
        end
    end
endmodule