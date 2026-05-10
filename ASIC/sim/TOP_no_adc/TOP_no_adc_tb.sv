`timescale 1ns / 1ps

module TOP_no_adc_tb;

    localparam int WIDTH = 1;
    localparam int LENGTH = 4;
    localparam int MAX_SPIKES = 16;
    localparam int JUMP = 5;

    localparam int ADC_DIV = 32;
    localparam int ADC_COMP_DELAY = 8;

    logic clk;
    logic rst;
    logic adc_valid;
    logic [1:0] encoding_select;
    logic [WIDTH*LENGTH-1:0] adc_data_in;
    logic [WIDTH-1:0] spikeP;
    logic [WIDTH-1:0] spikeN;

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

        repeat (5) @(posedge clk);
        rst = 1'b0;

        encoding_select = 2'b00;
        run_adc_ramp();

        encoding_select = 2'b01;
        run_adc_ramp();

        encoding_select = 2'b10;
        run_adc_ramp();

        encoding_select = 2'b11;
        run_adc_ramp();

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

    task automatic run_adc_ramp;
        begin
            for (int value = 0; value < 16; value++) begin
                adc_data_in = value[3:0];

                // adc result becomes valid once per conversion frame
                repeat (ADC_DIV - 1) @(posedge clk);
                pulse_adc_valid();
            end
        end
    endtask

    initial begin
        $dumpfile("TOP_no_adc_tb.vcd");
        $dumpvars(0, TOP_no_adc_tb);
    end

endmodule