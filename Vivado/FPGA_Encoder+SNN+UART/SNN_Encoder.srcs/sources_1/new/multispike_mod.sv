`timescale 1ns / 1ps
module multispike_mod
    #(parameter WIDTH = 1,
      parameter LENGTH = 12,
      parameter MAX_SPIKES = 16)
(
    input logic clk,
    input logic rst,
    input sample_pulse,
    input logic [WIDTH-1:0][LENGTH-1:0] data_in,
    input logic [15:0] divider,
    output logic [WIDTH-1:0] spikeP,
    output logic [WIDTH-1:0] spikeN
);
    assign spikeN = '0;
    
//    // generate sample clock
//    logic [15:0] sample_cnt;
//    logic sample_pulse;
    
//    always_ff @(posedge clk) begin
//        if (rst) begin
//            sample_cnt <= 0;
//            sample_pulse <= 0;
//        end else begin
//            sample_pulse <= 0;
//            sample_cnt <= sample_cnt + 1;
//            if (sample_cnt >= divider) begin
//                sample_cnt <= 0;
//                sample_pulse <= 1;
//            end
//        end
//    end
    
    // multi-spike encoding logic
    localparam SPIKE_BITS = $clog2(MAX_SPIKES+1);

    logic [WIDTH-1:0][SPIKE_BITS-1:0] num_spikes;
    logic [WIDTH-1:0][SPIKE_BITS-1:0] spike_count;
    logic [WIDTH-1:0][15:0]           spike_interval;
    logic [WIDTH-1:0][15:0]           interval_counter;
    logic [WIDTH-1:0][SPIKE_BITS-1:0] temp_spikes;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < WIDTH; i++) begin
                num_spikes[i]       <= 0;
                spike_count[i]      <= 0;
                spike_interval[i]   <= '1;
                interval_counter[i] <= 0;
                spikeP[i]           <= 0;
                temp_spikes[i]      <= 0;
            end
        end else begin
            for (int i = 0; i < WIDTH; i++) begin
                if (sample_pulse) begin
                    temp_spikes[i] <= (data_in[i] * MAX_SPIKES) >> LENGTH;
                    num_spikes[i]  <= (data_in[i] * MAX_SPIKES) >> LENGTH;
                    
                    if (((data_in[i] * MAX_SPIKES) >> LENGTH) == 0) begin
                        spike_interval[i] <= '1;
                    end else begin
                        spike_interval[i] <= (divider << 1) / ((data_in[i] * MAX_SPIKES) >> LENGTH);
                    end
                    
                    spike_count[i]      <= 0;
                    interval_counter[i] <= 0;
                    spikeP[i]           <= 0;
                    
                end else begin
                    interval_counter[i] <= interval_counter[i] + 1;
                    
                    if (spike_count[i] < num_spikes[i] && 
                        interval_counter[i] >= spike_interval[i]) begin
                        spikeP[i]      <= 1;
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