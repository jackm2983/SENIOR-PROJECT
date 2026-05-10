`timescale 1ns / 1ps

module TOP_wrapper #(
    parameter int WIDTH = 1,
    parameter int LENGTH = 4,
    parameter int MAX_SPIKES = 16,
    parameter int JUMP = 5,

    parameter int ADC_DIV = 62500,
    parameter int ADC_COMP_DELAY = 15625
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

    logic adc_clk;
    logic adc_clk_n;
    logic adc_clk_comp;

    logic [CNT_WIDTH-1:0] adc_cnt;

    logic adc_valid;
    logic adc_valid_d;

    logic sample_pulse;
    logic adc_rst;
    logic adc_rst_n;

    logic [3:0] adc_out;
    logic [3:0] adc_sample;

    assign adc_clk_n = ~adc_clk;
    assign adc_rst_n = ~rst & ~adc_rst; 

    // sample adc output first, then reset adc one clk later
    always_ff @(posedge clk) begin
        if (rst) begin
            adc_valid_d  <= 1'b0;
            sample_pulse <= 1'b0;
            adc_rst <= 1'b0;
            adc_sample   <= '0;
        end else begin
            adc_valid_d  <= adc_valid;

            sample_pulse <= 1'b0;
            adc_rst <= 1'b0;

            if (adc_valid & ~adc_valid_d) begin
                adc_sample   <= adc_out;
                sample_pulse <= 1'b1;
            end

            if (sample_pulse) begin
                adc_rst <= 1'b1;
            end
        end
    end

    // clock generation for ADC
    always_ff @(posedge clk) begin
        if (rst) begin
            adc_cnt      <= '0;
            adc_clk      <= 1'b0;
            adc_clk_comp <= 1'b0;
        end else begin
            if (adc_cnt == ADC_DIV - 1) begin
                adc_cnt <= '0;
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

    adc_macro u_adc (
        .CLK(adc_clk),
        .CLK_N(adc_clk_n),
        .CLK_comp(adc_clk_comp),
        .RST_N(adc_rst_n),
        .Vin(Vin),

        .ADC_OUT0(adc_out[0]),
        .ADC_OUT1(adc_out[1]),
        .ADC_OUT2(adc_out[2]),
        .ADC_OUT3(adc_out[3]),
        .VALID(adc_valid),

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
        .data_in(adc_sample),
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
        .data_in(adc_sample),
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
        .data_in(adc_sample),
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
        .data_in(adc_sample),
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