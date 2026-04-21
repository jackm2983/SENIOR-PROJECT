`timescale 1ns / 1ps

// ============================================================================
// Behavioral XADC Stub for Simulation
// ============================================================================
// Pin-compatible with xadc_wiz_0 (DRP interface, single channel mode).
// Generates fake samples on a ramp so you can verify the adapter captures
// them correctly without needing Xilinx unisim libraries.
//
// Add this as a SIMULATION-ONLY source. Vivado picks this for sim and the
// real xadc_wiz_0 IP for synthesis.
// ============================================================================

module xadc_wiz_0 (
    input  logic [6:0]  daddr_in,
    input  logic        den_in,
    input  logic [15:0] di_in,
    input  logic        dwe_in,
    output logic [15:0] do_out,
    output logic        drdy_out,
    input  logic        dclk_in,
    input  logic        reset_in,
    input  logic        vauxp6,
    input  logic        vauxn6,
    output logic        busy_out,
    output logic [4:0]  channel_out,
    output logic        eoc_out,
    output logic        eos_out,
    output logic        alarm_out,
    input  logic        vp_in,
    input  logic        vn_in
);

    // simulate conversion rate. real xadc is 104 cycles at 100 MHz dclk
    // use a smaller number here for faster sim without losing coverage
    localparam int CONV_PERIOD = 20;
    
    logic [15:0] fake_sample = 16'h1000;
    int conv_cnt = 0;
    
    // ============ Conversion timing: eoc_out pulse every CONV_PERIOD cycles
    always_ff @(posedge dclk_in or posedge reset_in) begin
        if (reset_in) begin
            conv_cnt <= 0;
            eoc_out <= 0;
            busy_out <= 0;
            fake_sample <= 16'h1000;
        end else begin
            eoc_out <= 0;
            busy_out <= (conv_cnt < (CONV_PERIOD - 4));
            
            if (conv_cnt >= CONV_PERIOD - 1) begin
                conv_cnt <= 0;
                eoc_out <= 1;
                fake_sample <= fake_sample + 16'h0010;  // ramp
            end else begin
                conv_cnt <= conv_cnt + 1;
            end
        end
    end
    
    // ============ DRP read response
    // when den_in goes high, respond with drdy + data 2 cycles later
    // IMPORTANT: do_out must be valid on the SAME cycle as drdy_out
    // Also latch the sample value at read-start so the ramp doesn't advance
    // during the 2-cycle pipeline delay
    logic den_d1, den_d2;
    logic [15:0] latched_sample;
    
    always_ff @(posedge dclk_in or posedge reset_in) begin
        if (reset_in) begin
            den_d1 <= 0;
            den_d2 <= 0;
            drdy_out <= 0;
            do_out <= 16'h0000;
            latched_sample <= 16'h0000;
        end else begin
            // snapshot the current sample when den_in goes high
            if (den_in) begin
                latched_sample <= fake_sample;
            end
            den_d1 <= den_in;
            den_d2 <= den_d1;
            drdy_out <= den_d2;
            // present data on do_out the same cycle drdy_out goes high
            if (den_d2) begin
                do_out <= latched_sample;
            end
        end
    end
    
    assign eos_out = eoc_out;
    assign alarm_out = 0;
    assign channel_out = 5'h06;

endmodule