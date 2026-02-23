`timescale 1ns / 1ps

module delta_mod #(
    parameter int WIDTH = 1,
    parameter int LENGTH = 12,
    parameter int JUMP = 5
)(
    input  logic clk,
    input  logic rst,
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

    logic [15:0] sample_cnt;
    logic sample_pulse;

    always_ff @(posedge clk) begin
        if (rst) begin
            sample_cnt   <= 16'd0;
            sample_pulse <= 1'b0;
        end else begin
            sample_pulse <= 1'b0;
            sample_cnt   <= sample_cnt + 16'd1;
            if (sample_cnt >= divider) begin
                sample_cnt   <= 16'd0;
                sample_pulse <= 1'b1;
            end
        end
    end

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
        end else begin
            spikeP <= '0;
            spikeN <= '0;

            if (sample_pulse) begin
                for (int i = 0; i < WIDTH; i++) begin
                    current[i] <= data_in_array[i];

                    if ( ($signed(previous[i]) - $signed(data_in_array[i])) > $signed(JUMP) )
                        spikeN[i] <= 1'b1;

                    if ( ($signed(data_in_array[i]) - $signed(previous[i])) > $signed(JUMP) )
                        spikeP[i] <= 1'b1;

                    previous[i] <= data_in_array[i];
                end
            end
        end
    end

endmodule