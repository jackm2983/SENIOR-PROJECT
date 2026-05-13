`timescale 1ns / 1ps

module TOP_no_adc_tb;

    localparam int WIDTH = 1;
    localparam int LENGTH = 4;
    localparam int MAX_SPIKES = 16;
    localparam int JUMP = 5;

    localparam int ADC_DIV = 500;  // Match 500-cycle sample period
    localparam int ADC_COMP_DELAY = 8;

    logic clk;
    logic rst;
    logic adc_valid;
    logic [1:0] encoding_select;
    logic [WIDTH*LENGTH-1:0] adc_data_in;
    logic [WIDTH-1:0] spikeP;
    logic [WIDTH-1:0] spikeN;

    int spike_count_p;
    int spike_count_n;

    TOP_no_adc #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH),
        .MAX_SPIKES(MAX_SPIKES),
        .JUMP(JUMP),
        .ADC_DIV(ADC_DIV),
        .ADC_COMP_DELAY(ADC_COMP_DELAY)
    ) dut (
        .clk(clk),
        .rst(rst),
        .encoding_select(encoding_select),
        .adc_data_in(adc_data_in),
        .adc_valid(adc_valid),
        .spikeP(spikeP),
        .spikeN(spikeN)
    );

    always #5 clk = ~clk; // 100 mhz

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        adc_valid = 1'b0;
        encoding_select = 2'b00;
        adc_data_in = 4'd0;
        spike_count_p = 0;
        spike_count_n = 0;

        repeat (5) @(posedge clk);
        rst = 1'b0;

        // Test 1: Rate encoding - ramp 0-15
        $display("[%t] Test 1: Rate Encoding", $time);
        encoding_select = 2'b00;
        spike_count_p = 0;
        spike_count_n = 0;
        run_adc_ramp(0, 15, 1);
        $display("[%t] Rate Encoding: Generated %0d spikeP, %0d spikeN", $time, spike_count_p, spike_count_n);

        // Test 2: Temporal encoding - ramp 0-15
        $display("[%t] Test 2: Temporal Encoding", $time);
        encoding_select = 2'b01;
        spike_count_p = 0;
        spike_count_n = 0;
        run_adc_ramp(0, 15, 1);
        $display("[%t] Temporal Encoding: Generated %0d spikeP, %0d spikeN", $time, spike_count_p, spike_count_n);

        // Test 3: Delta encoding - step changes > JUMP threshold
        $display("[%t] Test 3: Delta Encoding (with jumps > %0d)", $time, JUMP);
        encoding_select = 2'b10;
        spike_count_p = 0;
        spike_count_n = 0;
        run_delta_test();
        $display("[%t] Delta Encoding: Generated %0d spikeP, %0d spikeN", $time, spike_count_p, spike_count_n);

        // Test 4: Multispike encoding - ramp 0-15
        $display("[%t] Test 4: Multispike Encoding", $time);
        encoding_select = 2'b11;
        spike_count_p = 0;
        spike_count_n = 0;
        run_adc_ramp(0, 15, 1);
        $display("[%t] Multispike Encoding: Generated %0d spikeP, %0d spikeN", $time, spike_count_p, spike_count_n);

        repeat (100) @(posedge clk);
        $finish;
    end

    task automatic pulse_adc_valid;
        begin
            adc_valid = 1'b1;
            @(posedge clk);
            adc_valid = 1'b0;
        end
    endtask

    task automatic run_adc_ramp(int start_val, int end_val, int step);
        begin
            for (int value = start_val; value <= end_val; value = value + step) begin
                adc_data_in = value[3:0];

                // adc result becomes valid once per conversion frame
                repeat (499) @(posedge clk);
                pulse_adc_valid();
                
                // Wait for next sample period to start
                repeat (1) @(posedge clk);
            end
        end
    endtask

    task automatic run_delta_test;
        begin
            // Test sequence designed to trigger delta encoding
            // JUMP threshold = 5, so we need changes > 5
            
            // Start at 0
            adc_data_in = 4'd0;
            repeat (499) @(posedge clk);
            pulse_adc_valid();
            repeat (1) @(posedge clk);
            
            // Jump to 7 (change of +7 > JUMP)
            adc_data_in = 4'd7;
            repeat (499) @(posedge clk);
            pulse_adc_valid();
            repeat (1) @(posedge clk);
            
            // Jump to 1 (change of -6 > JUMP)
            adc_data_in = 4'd1;
            repeat (499) @(posedge clk);
            pulse_adc_valid();
            repeat (1) @(posedge clk);
            
            // Jump to 12 (change of +11 > JUMP)
            adc_data_in = 4'd12;
            repeat (499) @(posedge clk);
            pulse_adc_valid();
            repeat (1) @(posedge clk);
            
            // Jump to 4 (change of -8 > JUMP)
            adc_data_in = 4'd4;
            repeat (499) @(posedge clk);
            pulse_adc_valid();
            repeat (1) @(posedge clk);
            
            // Jump to 15 (change of +11 > JUMP)
            adc_data_in = 4'd15;
            repeat (499) @(posedge clk);
            pulse_adc_valid();
            repeat (1) @(posedge clk);
        end
    endtask

    // Monitor spikes
    always @(posedge clk) begin
        if (spikeP) spike_count_p = spike_count_p + 1;
        if (spikeN) spike_count_n = spike_count_n + 1;
    end

    initial begin
        $dumpfile("TOP_no_adc_tb.vcd");
        $dumpvars(0, TOP_no_adc_tb);
    end

endmodule