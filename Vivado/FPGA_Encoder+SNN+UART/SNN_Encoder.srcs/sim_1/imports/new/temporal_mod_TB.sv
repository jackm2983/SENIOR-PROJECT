`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Ryken Thompson
//
// Create Date: 01/29/2026 10:30:00 AM
// Module Name: temporal_mod_TB
// Target Devices: Basys3
// Description: temporal modulation for spiked nueron encoder - Test Bench
//
// Revision:
// Revision 0.01 - File Created
/////////////////////////////////////////////////////////////////////////////

module temporal_mod_TB
      #(parameter WIDTH = 2,
        parameter LENGTH = 12);
logic clk = 0;                      //hopefully at least 1.5MHz
logic rst;
logic [15:0] divider = 2081;        //data frame size divider                   
logic [WIDTH*LENGTH-1:0] data_in;   
logic [WIDTH-1:0] spikeP;
logic [WIDTH-1:0] spikeN;

temporal_mod #(WIDTH, LENGTH) UUT(.clk(clk), .rst(rst), .divider(divider), 
                            .data_in(data_in), .spikeP(spikeP), .spikeN(spikeN));

//1.5MHz clk
always begin
#333
clk = clk ^ 1;
end

always begin
rst = 1;
#1000;
rst = 0;


#2777778    //360Hz
data_in = {12'd0, 12'd0};
#2777778    //360Hz
data_in = {12'd2, 12'd4};
#2777778    //360Hz
data_in = {12'd10, 12'd0};
#2777778    //360Hz
data_in = {12'd11, 12'd6};
#2777778    //360Hz
data_in = {12'd3, 12'd7};
#2777778    //360Hz
data_in = {12'd2, 12'd1};
#2777778    //360Hz
data_in = {12'd7, 12'd12};
end
endmodule