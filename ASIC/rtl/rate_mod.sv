module rate_mod #(
    parameter WIDTH = 1,
    parameter LENGTH = 12
)(
    input  logic clk,
    input  logic rst,
    input  logic clk_en,
    input  logic sample_pulse,
    input  logic [WIDTH*LENGTH-1:0] data_in,
    input  logic [15:0] divider,
    output logic [WIDTH-1:0] spikeP,
    output logic [WIDTH-1:0] spikeN
);

    assign spikeN = {WIDTH{1'b0}};

    logic [LENGTH-1:0] data_in_array [0:WIDTH-1];

    generate
        for (genvar i = 0; i < WIDTH; i++) begin : g_data_in
            assign data_in_array[i] = data_in[i*LENGTH +: LENGTH];
        end
    endgenerate

    logic [LENGTH-1:0] rate_counter [0:WIDTH-1];
    logic [LENGTH-1:0] threshold [0:WIDTH-1];

    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < WIDTH; i++) begin
                rate_counter[i] <= '0;
                threshold[i]    <= '0;
                spikeP[i]       <= 1'b0;
            end
        end else if (clk_en) begin
            for (int i = 0; i < WIDTH; i++) begin
                spikeP[i] <= 1'b0;

                if (sample_pulse) begin
                    threshold[i]    <= data_in_array[i];
                    rate_counter[i] <= '0;
                end else begin
                    rate_counter[i] <= rate_counter[i] + 1'b1;

                    if (threshold[i] != '0 &&
                        rate_counter[i] >= ((2**LENGTH - 1) - threshold[i])) begin
                        spikeP[i]       <= 1'b1;
                        rate_counter[i] <= '0;
                    end
                end
            end
        end else begin
            spikeP <= '0;
        end
    end

endmodule