module ADC_validpin (
    input  wire CLK,
    input  wire CLK_comp,
    input  wire RST_N,
    input  wire Vin,

    output wire ADC_OUT0,
    output wire ADC_OUT1,
    output wire ADC_OUT2,
    output wire ADC_OUT3,
    output wire VALID,

    inout  wire VSS,
    inout  wire VDD1v8,
    inout  wire VDD_5V
);
endmodule