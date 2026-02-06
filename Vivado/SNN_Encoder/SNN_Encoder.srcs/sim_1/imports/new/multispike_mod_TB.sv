`timescale 1ns / 1ps

module multispike_mod_TB();
    parameter WIDTH = 2;
    parameter LENGTH = 12;
    
    logic clk = 0;
    logic rst;
    logic [15:0] divider = 2081;
    logic [LENGTH-1:0] data_in [WIDTH];
    logic spikeP [WIDTH];
    logic spikeN [WIDTH];

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

    // Clock Generation 1.5MHz
    always #333 clk = ~clk;

    initial begin
        rst = 1;
        data_in = '{default: 0};
        repeat (10) @(posedge clk);
        rst = 0;
        
        // Test Case 1: Zero input (Should result in 0 spikes)
        data_in = '{0, 0};
        repeat (3000) @(posedge clk); 
        
        // Test Case 2: Mid-range values
        // (2048 * 16) / 4096 = 8 spikes
        // (1024 * 16) / 4096 = 4 spikes
        $display("Applying Mid-range values...");
        data_in = '{2048, 1024};
        repeat (3000) @(posedge clk);
        
        // Test Case 3: High values
        // (4000 * 16) / 4096 = 15 spikes
        // (3500 * 16) / 4096 = 13 spikes
        $display("Applying High values...");
        data_in = '{4000, 3500};
        repeat (3000) @(posedge clk);
        
        // Test Case 4: Near-zero (Still results in 0 spikes due to floor math)
        // (10 * 16) / 4096 = 0.039 -> 0
        $display("Applying Low values (expecting 0 spikes)...");
        data_in = '{10, 20};
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