/////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Ryken Thompson
//
// Create Date: 01/28/2026 10:30:00 PM
// Module Name: temporal_mod
// Target Devices: Basys3
// Description: temporal modulation for spiked nueron encoder
//
// Revision:
// Revision 0.01 - File Created
/////////////////////////////////////////////////////////////////////////////

module temporal_mod
      #(parameter WIDTH = 1,
        parameter LENGTH = 12)
(
    input clk, rst,                     //hopefully at least 1.5MHz
    input sample_pulse,
    input [WIDTH*LENGTH-1:0] data_in,   //Data in must be vector for yosys
    input [15:0] divider,               //data frame size divider
    output logic [WIDTH-1:0] spikeP,    //spikeP must be vector for yosys
    output logic [WIDTH-1:0] spikeN     //spikeN must be vector for yosys
);

assign spikeN = {WIDTH{1'b0}}; //unused in temporal modulation


//To deal with the vector data input
logic [LENGTH-1:0] data_in_array [0:WIDTH-1];
generate
    for (genvar i = 0; i < WIDTH; i++) begin : g_data_in
        assign data_in_array[i] = data_in[i*LENGTH +: LENGTH];
    end
endgenerate

//logic sample_clk;
////logic for reference frame
////sample_clk (Hz) = clk (Hz)/(2+2*divider)
//logic [15:0] sample_cnt;
//always_ff @(posedge clk) begin
//    sample_cnt <= sample_cnt + 1;
//    if (sample_cnt >= divider) begin
//        sample_cnt <= 0;
//        sample_clk <= sample_clk ^ 1;
//    end
//    if (rst) begin
//        sample_cnt <=0;
//        sample_clk <=0;
//    end
//end    
    
//-------------------temporal modulation logic--------------------

//Spike location calculator
//location = (data_in/datainmax)*4096, 0-4095 clks in each sampleframe
logic [11:0] spike_location [0:WIDTH-1];

//Generate logic in case of LENGTH != clkfreq/divider
generate
  for (genvar i = 0; i < WIDTH; i++) begin : g_loc
    if (LENGTH == 12) begin : gen_eq12
      assign spike_location[i] = data_in_array[i];
    end
    else if (LENGTH < 12) begin : gen_lt12
      assign spike_location[i] = data_in_array[i] << (12 - LENGTH);
    end
    else begin : gen_gt12
      assign spike_location[i] = data_in_array[i] >> (LENGTH - 12);
    end
  end
endgenerate


//Reset the spike counter at the beginning of each sample frame
logic [12:0] spike_counter [0:WIDTH-1];

//Count clocks until spike location is reached; assert spikeP for 1 cycle on match
always_ff @(posedge clk) begin
    for (int i = 0; i < WIDTH; i++) begin
        if (sample_pulse == 1 || rst) begin
            spike_counter[i] <= 0;
            spikeP[i] <= 0;
        end 
        else begin
            spike_counter[i] <= spike_counter[i] + 1;
            spikeP[i] <= (spike_counter[i] == {1'b0, spike_location[i]});  // 1-cycle pulse when match
        end
    end
end     
    
    
endmodule