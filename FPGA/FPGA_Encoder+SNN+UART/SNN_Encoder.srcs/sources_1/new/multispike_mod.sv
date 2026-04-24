`timescale 1ns / 1ps

// multispike encoder, pipelined
// stage 1: compute num_spikes (now just a bit slice, no multiplier)
// stage 2: look up reciprocal + multiply to get spike_interval (no divide)
// stage 3: output counter logic runs as before
//
// divide replaced with a reciprocal LUT since num_spikes in [0, MAX_SPIKES]
// has a tiny domain. approximation error is < 1 lsb for divider=100.

module multispike_mod
    #(parameter WIDTH      = 1,
      parameter LENGTH     = 12,
      parameter MAX_SPIKES = 16)  // must be power of 2
(
    input  logic                             clk,
    input  logic                             rst,
    input  logic                             sample_pulse,
    input  logic [WIDTH*LENGTH-1:0]          data_in,
    input  logic [15:0]                      divider,
    output logic [WIDTH-1:0]                 spikeP,
    output logic [WIDTH-1:0]                 spikeN
);
    assign spikeN = '0;
    
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

    localparam int SPIKE_BITS  = $clog2(MAX_SPIKES+1);
    localparam int NSPIKE_SHFT = LENGTH - $clog2(MAX_SPIKES);  // 12-4=8

    // reciprocal lut: recip[n] = round(256 / n)  for n in 1..16
    // using: spike_interval = (divider * recip[n]) >> 7
    // which approximates (divider << 1) / n
    function automatic logic [8:0] recip_lut(input logic [SPIKE_BITS-1:0] n);
        case (n)
            5'd1:    recip_lut = 9'd256;
            5'd2:    recip_lut = 9'd128;
            5'd3:    recip_lut = 9'd85;
            5'd4:    recip_lut = 9'd64;
            5'd5:    recip_lut = 9'd51;
            5'd6:    recip_lut = 9'd43;
            5'd7:    recip_lut = 9'd37;
            5'd8:    recip_lut = 9'd32;
            5'd9:    recip_lut = 9'd28;
            5'd10:   recip_lut = 9'd26;
            5'd11:   recip_lut = 9'd23;
            5'd12:   recip_lut = 9'd21;
            5'd13:   recip_lut = 9'd20;
            5'd14:   recip_lut = 9'd18;
            5'd15:   recip_lut = 9'd17;
            5'd16:   recip_lut = 9'd16;
            default: recip_lut = 9'd0;  // n=0 handled as "no spikes"
        endcase
    endfunction

    // ----------------- stage 1: compute num_spikes -----------------
    logic                              s1_valid;
    logic [WIDTH-1:0][SPIKE_BITS-1:0]  s1_num_spikes;
    logic [15:0]                       s1_divider;

    always_ff @(posedge clk) begin
        if (rst) begin
            s1_valid      <= 1'b0;
            s1_divider    <= '0;
            for (int i = 0; i < WIDTH; i++) s1_num_spikes[i] <= '0;
        end else begin
            s1_valid   <= sample_pulse;
            s1_divider <= divider;
            for (int i = 0; i < WIDTH; i++) begin
                // (data_in * 16) >> 12 == data_in >> 8, zero-extended
                s1_num_spikes[i] <= {{(SPIKE_BITS-$clog2(MAX_SPIKES)){1'b0}},
                                     data_in_q[i][LENGTH-1 -: $clog2(MAX_SPIKES)]};
            end
        end
    end

    // ----------------- stage 2: multiply by reciprocal -----------------
    logic                              s2_valid;
    logic [WIDTH-1:0][SPIKE_BITS-1:0]  s2_num_spikes;
    logic [WIDTH-1:0][15:0]            s2_spike_interval;

    always_ff @(posedge clk) begin
        if (rst) begin
            s2_valid <= 1'b0;
            for (int i = 0; i < WIDTH; i++) begin
                s2_num_spikes[i]     <= '0;
                s2_spike_interval[i] <= '1;
            end
        end else begin
            s2_valid <= s1_valid;
            for (int i = 0; i < WIDTH; i++) begin
                s2_num_spikes[i] <= s1_num_spikes[i];
                if (s1_num_spikes[i] == 0) begin
                    s2_spike_interval[i] <= '1;
                end else begin
                    // (divider * recip) >> 7 ≈ (divider << 1) / n
                    s2_spike_interval[i] <= (s1_divider * recip_lut(s1_num_spikes[i])) >> 7;
                end
            end
        end
    end

    // ----------------- stage 3: spike generation -----------------
    logic [WIDTH-1:0][SPIKE_BITS-1:0]  num_spikes;
    logic [WIDTH-1:0][SPIKE_BITS-1:0]  spike_count;
    logic [WIDTH-1:0][15:0]            spike_interval;
    logic [WIDTH-1:0][15:0]            interval_counter;

    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < WIDTH; i++) begin
                num_spikes[i]       <= '0;
                spike_count[i]      <= '0;
                spike_interval[i]   <= '1;
                interval_counter[i] <= '0;
                spikeP[i]           <= 1'b0;
            end
        end else begin
            for (int i = 0; i < WIDTH; i++) begin
                if (s2_valid) begin
                    // new sample arrived (2 cycles after sample_pulse)
                    num_spikes[i]       <= s2_num_spikes[i];
                    spike_interval[i]   <= s2_spike_interval[i];
                    spike_count[i]      <= '0;
                    interval_counter[i] <= '0;
                    spikeP[i]           <= 1'b0;
                end else begin
                    interval_counter[i] <= interval_counter[i] + 1;
                    if (spike_count[i] < num_spikes[i] &&
                        interval_counter[i] >= spike_interval[i]) begin
                        spikeP[i]           <= 1'b1;
                        spike_count[i]      <= spike_count[i] + 1;
                        interval_counter[i] <= '0;
                    end else begin
                        spikeP[i] <= 1'b0;
                    end
                end
            end
        end
    end

endmodule