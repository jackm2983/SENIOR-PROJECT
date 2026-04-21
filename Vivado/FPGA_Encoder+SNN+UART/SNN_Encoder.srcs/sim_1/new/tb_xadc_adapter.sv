`timescale 1ns / 1ps

// ============================================================================
// XADC Adapter DIAGNOSTIC Testbench
// ============================================================================
// Probes internal signals of both the stub and the adapter to pinpoint
// exactly where data is getting lost. Suspicions to confirm:
//   (A) stub is producing eoc_out pulses
//   (B) adapter FSM transitions WAIT_EOC -> WAIT_DRDY and asserts den_in
//   (C) stub sees den_in and responds with drdy_out
//   (D) do_out carries a valid non-zero sample when drdy_out is high
//   (E) adapter captures sample_raw correctly
//   (F) decimation counter fires adc_valid at the expected rate
// ============================================================================

module tb_xadc_adapter;
    logic clk = 0;
    logic rst = 1;
    logic [11:0] adc_data;
    logic adc_valid;
    logic [15:0] dec_count = 16'd3;  // very small to get quick results
    
    always #5 clk = ~clk;  // 100 MHz
    
    xadc_adapter dut (
        .clk(clk),
        .rst(rst),
        .vauxp6(1'b0),
        .vauxn6(1'b0),
        .adc_data(adc_data),
        .adc_valid(adc_valid),
        .decimation_count(dec_count)
    );
    
    // ============ Counters for all the key events ============
    int eoc_pulses = 0;
    int den_asserts = 0;
    int drdy_pulses = 0;
    int sample_ready_pulses = 0;
    int adc_valid_pulses = 0;
    
    // probe A: count eoc_out pulses from the stub
    always_ff @(posedge clk) begin
        if (dut.eoc_out) begin
            eoc_pulses++;
            $display("[%0t] (A) eoc_out pulse #%0d", $time, eoc_pulses);
        end
    end
    
    // probe B: adapter FSM state + den_in
    // print state transitions and when den_in goes high
    logic prev_den = 0;
    // can't directly reference state_t easily; we print on den_in rising edge
    always_ff @(posedge clk) begin
        if (dut.den_in && !prev_den) begin
            den_asserts++;
            $display("[%0t] (B) adapter asserted den_in #%0d (daddr=0x%02h)",
                     $time, den_asserts, dut.daddr_in);
        end
        prev_den <= dut.den_in;
    end
    
    // probe C+D: drdy_out pulses from stub + do_out value at that moment
    always_ff @(posedge clk) begin
        if (dut.drdy_out) begin
            drdy_pulses++;
            $display("[%0t] (C,D) drdy_out pulse #%0d  |  do_out = 0x%04h  %s",
                     $time, drdy_pulses, dut.do_out,
                     (dut.do_out == 16'h0000) ? "*** do_out IS ZERO ***" : "");
        end
    end
    
    // probe E: adapter's internal sample_raw after capture
    always_ff @(posedge clk) begin
        if (dut.sample_ready) begin
            sample_ready_pulses++;
            $display("[%0t] (E) sample_ready pulse #%0d  |  sample_raw = 0x%04h  (upper 12 = 0x%03h)",
                     $time, sample_ready_pulses, dut.sample_raw, dut.sample_raw[15:4]);
        end
    end
    
    // probe F: final decimated output
    always_ff @(posedge clk) begin
        if (adc_valid) begin
            adc_valid_pulses++;
            $display("[%0t] (F) adc_valid pulse #%0d  |  adc_data = 0x%03h",
                     $time, adc_valid_pulses, adc_data);
        end
    end
    
    // ============ Stimulus / reporting ============
    initial begin
        $display("================================================");
        $display("  XADC ADAPTER DIAGNOSTIC                       ");
        $display("================================================");
        $display("dec_count = %0d", dec_count);
        $display("Will run for 50 us and then report event counts.");
        $display("Tracking:");
        $display("  (A) stub eoc_out pulses");
        $display("  (B) adapter den_in assertions");
        $display("  (C) stub drdy_out pulses");
        $display("  (D) do_out value when drdy_out high");
        $display("  (E) adapter sample_raw captures");
        $display("  (F) final adc_valid pulses");
        $display("================================================");
        
        #100 rst = 0;
        
        // run for a fixed time then report, rather than waiting for events
        #50_000;
        
        $display("");
        $display("================================================");
        $display("  DIAGNOSTIC REPORT @ %0t ns", $time);
        $display("================================================");
        $display("  (A) eoc_out pulses        : %0d", eoc_pulses);
        $display("  (B) den_in assertions     : %0d", den_asserts);
        $display("  (C) drdy_out pulses       : %0d", drdy_pulses);
        $display("  (E) sample_ready pulses   : %0d", sample_ready_pulses);
        $display("  (F) adc_valid pulses      : %0d", adc_valid_pulses);
        $display("================================================");
        $display("  INTERPRETATION:");
        if (eoc_pulses == 0)
            $display("  -> stub never fired eoc_out (check stub)");
        else if (den_asserts == 0)
            $display("  -> adapter FSM never asserted den_in (check FSM)");
        else if (drdy_pulses == 0)
            $display("  -> stub never returned drdy (check stub DRP logic)");
        else if (sample_ready_pulses == 0)
            $display("  -> adapter never captured sample (drdy_out timing?)");
        else if (adc_valid_pulses == 0)
            $display("  -> captured samples but decimation never fires");
        else
            $display("  -> signals flowing, check data values above");
        $display("================================================");
        
        $finish;
    end
    
    initial begin
        $dumpfile("tb_xadc_adapter.vcd");
        $dumpvars(0, tb_xadc_adapter);
    end
endmodule