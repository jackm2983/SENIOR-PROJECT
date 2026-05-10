`timescale 1ns / 1ps

module TOP_wrapper #(
    parameter int WIDTH = 1,
    parameter int LENGTH = 4,
    parameter int MAX_SPIKES = 16,
    parameter int JUMP = 5,

    parameter int ADC_DIV = 62500, // 625 us period
    parameter int ADC_COMP_DELAY = 15625 // 156.25 us delay
)(
    input  logic clk,
    input  logic rst,
    input  logic [1:0] encoding_select,

    input  wire Vin,

    inout  wire VSS,
    inout  wire VDD1v8,
    inout  wire VDD_5V,

    output logic [WIDTH-1:0] spikeP,
    output logic [WIDTH-1:0] spikeN
);

    localparam int CNT_WIDTH = $clog2(ADC_DIV);

    logic rst_n;
    assign rst_n = ~rst;

    logic adc_clk;
    logic adc_clk_n;
    logic adc_clk_comp;
    logic sample_pulse;

    logic [CNT_WIDTH-1:0] adc_cnt;
    
    // adc needs a valid pin for this to work
    /*
    logic adc_valid;
    logic adc_valid_d;

    always_ff @(posedge clk) begin
        if (rst) begin
            adc_valid_d  <= 1'b0;
            sample_pulse <= 1'b0;
        end else begin
            adc_valid_d  <= adc_valid;
            sample_pulse <= adc_valid & ~adc_valid_d;
        end
    end
    */

    // clock generation for ADC
    always_ff @(posedge clk) begin
        if (rst) begin
            adc_cnt <= '0;
            adc_clk <= 1'b0;
            adc_clk_comp <= 1'b0;
            sample_pulse <= 1'b0;
        end else begin
            sample_pulse <= 1'b0;
            if (adc_cnt == ADC_DIV - 1) begin
                adc_cnt <= '0;
                // for now it will just sample every cycle even though the 
                // adc is only right every 4rth cycle.
                sample_pulse <= 1'b1;
            end else begin
                adc_cnt <= adc_cnt + 1'b1;
            end

            adc_clk <= adc_cnt < (ADC_DIV / 2);

            if (adc_cnt >= ADC_COMP_DELAY) begin
                adc_clk_comp <= (adc_cnt - ADC_COMP_DELAY) < (ADC_DIV / 2);
            end else begin
                adc_clk_comp <= (adc_cnt + ADC_DIV - ADC_COMP_DELAY) < (ADC_DIV / 2);
            end
        end
    end

    assign adc_clk_n = ~adc_clk;

    logic [3:0] adc_out;

    adc_macro u_adc (
        .CLK(adc_clk),
        .CLK_N(adc_clk_n),
        .CLK_comp(adc_clk_comp),
        .RST_N(rst_n),
        .Vin(Vin),

        .ADC_OUT0(adc_out[0]),
        .ADC_OUT1(adc_out[1]),
        .ADC_OUT2(adc_out[2]),
        .ADC_OUT3(adc_out[3]),

        .VSS(VSS),
        .VDD1v8(VDD1v8),
        .VDD_5V(VDD_5V)
    );

    logic [WIDTH-1:0] spikeP_rate;
    logic [WIDTH-1:0] spikeN_rate;
    logic [WIDTH-1:0] spikeP_temporal;
    logic [WIDTH-1:0] spikeN_temporal;
    logic [WIDTH-1:0] spikeP_delta;
    logic [WIDTH-1:0] spikeN_delta;
    logic [WIDTH-1:0] spikeP_multispike;
    logic [WIDTH-1:0] spikeN_multispike;

    logic [3:0] clk_en;

    rate_mod #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH)
    ) rate_encoder (
        .clk(clk),
        .rst(rst),
        .clk_en(clk_en[0]),
        .sample_pulse(sample_pulse),
        .data_in(adc_out),
        .divider(ADC_DIV),
        .spikeP(spikeP_rate),
        .spikeN(spikeN_rate)
    );

    temporal_mod #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH)
    ) temporal_encoder (
        .clk(clk),
        .rst(rst),
        .clk_en(clk_en[1]),
        .sample_pulse(sample_pulse),
        .data_in(adc_out),
        .divider(ADC_DIV),
        .spikeP(spikeP_temporal),
        .spikeN(spikeN_temporal)
    );

    delta_mod #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH),
        .JUMP(JUMP)
    ) delta_encoder (
        .clk(clk),
        .rst(rst),
        .clk_en(clk_en[2]),
        .sample_pulse(sample_pulse),
        .data_in(adc_out),
        .divider(ADC_DIV),
        .spikeP(spikeP_delta),
        .spikeN(spikeN_delta)
    );

    multispike_mod #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH),
        .MAX_SPIKES(MAX_SPIKES)
    ) multispike_encoder (
        .clk(clk),
        .rst(rst),
        .clk_en(clk_en[3]),
        .sample_pulse(sample_pulse),
        .data_in(adc_out),
        .divider(ADC_DIV),
        .spikeP(spikeP_multispike),
        .spikeN(spikeN_multispike)
    );

    always_comb begin
        clk_en = 4'b0000;

        spikeP = '0;
        spikeN = '0;

        unique case (encoding_select)
            2'b00: begin
                spikeP = spikeP_rate;
                spikeN = spikeN_rate;
                clk_en[0] = 1'b1;
            end

            2'b01: begin
                spikeP = spikeP_temporal;
                spikeN = spikeN_temporal;
                clk_en[1] = 1'b1;
            end

            2'b10: begin
                spikeP = spikeP_delta;
                spikeN = spikeN_delta;
                clk_en[2] = 1'b1;
            end

            default: begin
                spikeP = spikeP_multispike;
                spikeN = spikeN_multispike;
                clk_en[3] = 1'b1;
            end
        endcase
    end

endmodule