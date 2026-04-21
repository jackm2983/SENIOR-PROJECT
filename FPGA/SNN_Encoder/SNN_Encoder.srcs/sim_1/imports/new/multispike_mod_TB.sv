`timescale 1ns / 1ps
module multispike_mod_TB();
    parameter WIDTH = 1;
    parameter LENGTH = 12;
    
    logic clk = 0;
    logic rst;
    logic [15:0] divider = 2081;
    logic [WIDTH-1:0][LENGTH-1:0] data_in;
    logic [WIDTH-1:0] spikeP;
    logic [WIDTH-1:0] spikeN;

    multispike_mod #(
        .WIDTH(WIDTH),
        .LENGTH(LENGTH),
        .MAX_SPIKES(16)
    ) UUT (
        .clk(clk),
        .rst(rst),
        .divider(divider),
        .data_in(data_in),
        .spikeP(spikeP),
        .spikeN(spikeN)
    );

    // clock generation 1.5MHz
    always #333 clk = ~clk;

    initial begin
        rst = 1;
        data_in = '0;
        repeat (10) @(posedge clk);
        rst = 0;
        
        // test case 1: zero input (0 spikes)
        data_in = '0;
        repeat (3000) @(posedge clk); 
        
        // test case 2: mid-range values
        // (2048 * 16) / 4096 = 8 spikes
        // (1024 * 16) / 4096 = 4 spikes
        $display("Applying Mid-range values...");
        data_in[1] = 2048;
        data_in[0] = 1024;
        repeat (3000) @(posedge clk);
        
        // test case 3: high values
        // (4000 * 16) / 4096 = 15 spikes
        // (3500 * 16) / 4096 = 13 spikes
        $display("Applying High values...");
        data_in[1] = 4000;
        data_in[0] = 3500;
        repeat (3000) @(posedge clk);
        
        // test case 4: near-zero (0 spikes due to floor math)
        // (10 * 16) / 4096 = 0.039 -> 0
        $display("Applying Low values (expecting 0 spikes)...");
        data_in[1] = 10;
        data_in[0] = 20;
        repeat (3000) @(posedge clk);

        $display("Simulation Finished");
        $finish;
    end

    always_ff @(posedge clk) begin
        for (int i = 0; i < WIDTH; i++) begin
            if (spikeP[i]) 
                $display("[Time %0t] Spike detected on Channel %0d!", $time, i);
        end
    end
endmodule