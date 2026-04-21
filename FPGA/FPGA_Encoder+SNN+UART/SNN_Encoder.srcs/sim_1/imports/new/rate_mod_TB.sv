`timescale 1ns / 1ps

module rate_mod_TB();
    parameter WIDTH = 1;
    parameter LENGTH = 12;

    logic clk = 0;
    logic rst;
    logic [15:0] divider = 2081; 
    logic [WIDTH*LENGTH-1:0] data_in;   
    logic [WIDTH-1:0] spikeP;
    logic [WIDTH-1:0] spikeN;

    rate_mod #(WIDTH, LENGTH) UUT (
        .clk(clk), 
        .rst(rst), 
        .divider(divider), 
        .data_in(data_in), 
        .spikeP(spikeP), 
        .spikeN(spikeN)
    );


    always #333 clk = ~clk;

    initial begin
        rst = 1;
        data_in = {12'd0, 12'd0};
        #1000;
        rst = 0;
        
        //  Test Case: High Rate (Frequent Spikes)
        // Threshold becomes (4095 - 3800) = 295. 
        // 2081 / 295 = ~7 spikes per window.
        $display("Applying High Values...");
        data_in = {12'd3800, 12'd3500};
        repeat (5000) @(posedge clk);

        //  Test Case: Medium Rate
        // Threshold becomes (4095 - 2500) = 1595.
        // 2081 / 1595 = ~1 spike per window.
        $display("Applying Medium Values...");
        data_in = {12'd2500, 12'd2000};
        repeat (5000) @(posedge clk);

        //  Test Case: Low Rate (Likely 0 spikes)
        // Threshold is (4095 - 10) = 4085.
        // Counter is reset every 2081 cycles, so it never hits 4085.
        $display("Applying Low Values (Expected 0 spikes)...");
        data_in = {12'd10, 12'd5};
        repeat (5000) @(posedge clk);

        $display("Simulation Finished");
        $finish;
    end

    always_ff @(posedge clk) begin
        if (spikeP[0]) $display("[Ch 0] Spike at %0t", $time);
        if (spikeP[1]) $display("[Ch 1] Spike at %0t", $time);
    end

endmodule