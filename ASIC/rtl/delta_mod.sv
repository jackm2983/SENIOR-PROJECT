module delta_mod #(
    parameter int WIDTH = 1,
    parameter int LENGTH = 12,
    parameter int JUMP = 5
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

    logic [LENGTH-1:0] data_in_array [0:WIDTH-1];

    generate
        for (genvar i = 0; i < WIDTH; i++) begin : g_di
            assign data_in_array[i] = data_in[i*LENGTH +: LENGTH];
        end
    endgenerate

    logic [LENGTH-1:0] previous [0:WIDTH-1];
    logic [LENGTH-1:0] current  [0:WIDTH-1];

    always_ff @(posedge clk) begin
        if (rst) begin
            spikeP <= '0;
            spikeN <= '0;

            for (int i = 0; i < WIDTH; i++) begin
                previous[i] <= '0;
                current[i]  <= '0;
            end
        end else if (clk_en) begin
            spikeP <= '0;
            spikeN <= '0;

            if (sample_pulse) begin
                for (int i = 0; i < WIDTH; i++) begin
                    current[i] <= data_in_array[i];

                    if (($signed({{28{previous[i][LENGTH-1]}}, previous[i]}) - $signed({{28{data_in_array[i][LENGTH-1]}}, data_in_array[i]})) > $signed(JUMP)) begin
                        spikeN[i] <= 1'b1;
                    end

                    if (($signed({{28{data_in_array[i][LENGTH-1]}}, data_in_array[i]}) - $signed({{28{previous[i][LENGTH-1]}}, previous[i]})) > $signed(JUMP)) begin
                        spikeP[i] <= 1'b1;
                    end

                    previous[i] <= data_in_array[i];
                end
            end
        end else begin
            spikeP <= '0;
            spikeN <= '0;
        end
    end

endmodule