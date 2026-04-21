`timescale 1ns / 1ps

// ============================================================================
// UART Loopback Testbench
// ============================================================================
// Ties uart_tx → uart_rx and pushes bytes through to verify bit timing,
// ordering, and start/stop framing. Uses a fast baud (reduced CLK_FREQ)
// to keep sim time short - the baud divider logic is identical regardless.
// ============================================================================

module tb_uart_loopback;

    // scaled-down timing for faster sim
    // real: 100 MHz / 115200 = 868 clocks per bit
    // sim:  10 MHz / 115200  = 87 clocks per bit (100x faster wallclock)
    localparam int CLK_FREQ = 10_000_000;
    localparam int BAUD = 115200;
    localparam int DATA_W = 12;
    localparam int BIT_PERIOD = CLK_FREQ / BAUD;
    
    logic clk = 0;
    logic rst = 1;
    logic uart_line;  // shared tx→rx wire
    
    logic [DATA_W-1:0] tx_data;
    logic tx_valid;
    logic tx_ready;
    logic [DATA_W-1:0] rx_data;
    logic rx_valid;
    logic rx_ready;
    
    always #50 clk = ~clk;  // 10 MHz
    
    uart_wrapper #(
        .DATA_WIDTH(DATA_W),
        .BAUD_RATE(BAUD),
        .CLK_FREQ(CLK_FREQ)
    ) dut (
        .clk(clk),
        .rst(rst),
        .uart_rx(uart_line),
        .uart_tx(uart_line),
        .rx_data(rx_data),
        .rx_valid(rx_valid),
        .rx_ready(rx_ready),
        .tx_data(tx_data),
        .tx_valid(tx_valid),
        .tx_ready(tx_ready)
    );
    
    // ============ Test sequence ============
    logic [DATA_W-1:0] test_values [] = '{
        12'h000, 12'hFFF, 12'hAAA, 12'h555, 12'h123, 12'hABC, 12'h4D2
    };
    
    int pass_cnt = 0;
    int fail_cnt = 0;
    
    task automatic send_byte(input logic [DATA_W-1:0] val);
        @(posedge clk);
        wait (tx_ready);
        @(posedge clk);
        tx_data = val;
        tx_valid = 1'b1;
        @(posedge clk);
        tx_valid = 1'b0;
    endtask
    
    task automatic wait_for_rx(output logic [DATA_W-1:0] val, input int timeout_cycles);
        int cnt = 0;
        while (!rx_valid && cnt < timeout_cycles) begin
            @(posedge clk);
            cnt++;
        end
        val = rx_data;
        if (cnt >= timeout_cycles)
            $display("  [TIMEOUT] no rx_valid after %0d cycles", cnt);
    endtask
    
    initial begin
        tx_data = 0;
        tx_valid = 0;
        rx_ready = 1;
        
        #200 rst = 0;
        #200;
        
        $display("=== UART Loopback Test ===");
        $display("CLK_FREQ=%0d, BAUD=%0d, bit period=%0d cycles", 
                 CLK_FREQ, BAUD, BIT_PERIOD);
        
        foreach (test_values[i]) begin
            logic [DATA_W-1:0] got;
            $display("[%0d] sending 0x%03h ...", i, test_values[i]);
            send_byte(test_values[i]);
            wait_for_rx(got, BIT_PERIOD * (DATA_W + 4));
            
            if (got === test_values[i]) begin
                $display("  PASS: got 0x%03h", got);
                pass_cnt++;
            end else begin
                $display("  FAIL: expected 0x%03h, got 0x%03h", test_values[i], got);
                fail_cnt++;
            end
        end
        
        $display("=== Results: %0d passed, %0d failed ===", pass_cnt, fail_cnt);
        if (fail_cnt == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TESTS FAILED");
        
        $finish;
    end
    
    initial begin
        #50_000_000;  // hard timeout
        $display("HARD TIMEOUT");
        $finish;
    end
    
    initial begin
        $dumpfile("tb_uart_loopback.vcd");
        $dumpvars(0, tb_uart_loopback);
    end

endmodule