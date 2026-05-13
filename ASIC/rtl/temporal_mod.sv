module temporal_mod #(
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

    logic [15:0] spike_location [0:WIDTH-1];
    logic [15:0] spike_counter [0:WIDTH-1];
    logic [31:0] location_calc [0:WIDTH-1];

    generate
        for (genvar i = 0; i < WIDTH; i++) begin : g_loc
            // Calculate spike location: (data_in * divider) >> LENGTH
            assign location_calc[i] = (({28'h0, data_in_array[i]} * {16'h0, divider[15:0]}) >> LENGTH);
        end
    endgenerate

    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < WIDTH; i++) begin
                spike_counter[i] <= '0;
                spikeP[i]        <= 1'b0;
                spike_location[i] <= '0;
            end
        end else if (clk_en) begin
            for (int i = 0; i < WIDTH; i++) begin
                if (sample_pulse) begin
                    spike_counter[i] <= '0;
                    spike_location[i] <= location_calc[i][15:0];
                    spikeP[i]        <= (location_calc[i][15:0] == 16'h0000);
                end else begin
                    spike_counter[i] <= spike_counter[i] + 1'b1;
                    spikeP[i]        <= (spike_counter[i] + 1'b1 == spike_location[i]);
                end
            end
        end else begin
            spikeP <= '0;
        end
    end

endmodule