`timescale 1ns / 1ps

// ============================================================================
// XADC Adapter Testbench
// ============================================================================
// Uses the behavioral xadc_wiz_0 stub (ramp samples) to verify:
//   - DRP read state machine captures samples correctly
//   - Decimation counter produces adc_valid at the expected rate
//   - adc_data is upper 12 bits of do_out
// ============================================================================

module tb_xadc_adapter;

    logic clk = 0;
    logic rst = 1;
    logic [11:0] adc_data;
    logic adc_valid;
    logic [15:0] dec_count = 16'd10;  // small for fast sim
    
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
    
    int valid_cnt = 0;
    logic [11:0] last_data;
    
    always_ff @(posedge clk) begin
        if (adc_valid) begin
            $display("[%0t] adc_valid: data=0x%03h (sample #%0d)",
                     $time, adc_data, valid_cnt);
            valid_cnt++;
            last_data <= adc_data;
        end
    end
    
    initial begin
        #100 rst = 0;
        
        $display("=== XADC Adapter Test ===");
        $display("decimation_count = %0d (every Nth xadc sample)", dec_count);
        $display("expect adc_valid every ~%0d clocks", 104 * (dec_count + 1));
        
        // run until we get 5 decimated samples
        wait (valid_cnt >= 5);
        
        $display("=== Captured %0d samples ===", valid_cnt);
        $display("Last sample: 0x%03h (ramp should be incrementing)", last_data);
        
        #1000 $finish;
    end
    
    initial begin
        #5_000_000;
        $display("TIMEOUT");
        $finish;
    end
    
    initial begin
        $dumpfile("tb_xadc_adapter.vcd");
        $dumpvars(0, tb_xadc_adapter);
    end

endmodule