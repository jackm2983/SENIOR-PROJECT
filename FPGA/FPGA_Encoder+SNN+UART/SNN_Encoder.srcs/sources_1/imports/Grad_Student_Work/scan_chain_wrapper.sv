module scan_chain_wrapper#(
    parameter int N_inputs = 2,
    parameter int N_neurons = 5,
    parameter int b_weight = 4,
    parameter int b_accum = 8,
    parameter int b_thresh = 8,
    parameter int b_time = 3,
    parameter int LEARN = 3,
    parameter int DATA_WIDTH = 11,
    parameter int TOTAL_BITS = (N_inputs*N_neurons*(b_weight+2)) + (b_thresh) + 2*(b_time+1)
)(
    //neuron_array
    input logic clk,
    input logic reset,
    
    //scw signals
    input logic prog_clk,
    input logic prog_data,
    input logic load_config,
    
    //DM
    input logic dm_reset,
    input logic [DATA_WIDTH-1:0] ecg_in,
    
    //neuron_array
    output logic [N_neurons-1:0] fire,
    output logic [N_neurons-1:0] winner
);

    logic [TOTAL_BITS-1:0] shift_reg;
    logic [TOTAL_BITS-1:0] config_reg;

    // ---- bring-up bypass --------------------------------------------------
    // the scan chain (prog_clk/prog_data/load_config) is tied off in the top,
    // so config_reg never loaded and the array never enabled. instead of a
    // loader fsm we build the config from constants here and pulse load once
    // after reset. that latches the weights AND turns on sys_en downstream.
    //
    // field order matches the unpack below (MSB first):
    //   [synapse_weights : N*B_WEIGHT] [threshold : B_THRESH]
    //   [refractory : B_REFRAC] [leak_rate : B_LEAK]
    localparam logic [b_weight+1:0] BU_WEIGHT  = 6'sd6;   // per-synapse weight
    localparam logic [b_thresh-1:0] BU_THRESH  = 8'd12;   // fire level
    localparam logic [b_time:0]     BU_REFRAC  = 4'd1;    // short refractory
    localparam logic [b_time:0]     BU_LEAK    = 4'd8;    // slow leak

    // replicate the same weight across all N synapses
    logic [N_inputs*N_neurons*(b_weight+2)-1:0] bu_weights;
    always_comb begin
        for (int w = 0; w < N_inputs*N_neurons; w++)
            bu_weights[w*(b_weight+2) +: (b_weight+2)] = BU_WEIGHT;
    end

    logic [TOTAL_BITS-1:0] bu_config;
    assign bu_config = {bu_weights, BU_THRESH, BU_REFRAC, BU_LEAK};

    // one-shot sequence after reset releases:
    //   cnt==2 -> latch config_reg from constants (bu_cfg_load)
    //   cnt==3 -> pulse load to synapses/array, weights now valid (bu_load)
    logic [2:0] bu_cnt;
    logic       bu_load;
    logic       bu_cfg_load;
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            bu_cnt      <= '0;
            bu_load     <= 1'b0;
            bu_cfg_load <= 1'b0;
        end else begin
            bu_load     <= 1'b0;
            bu_cfg_load <= 1'b0;
            if (bu_cnt < 3'd5) bu_cnt <= bu_cnt + 1'b1;
            if (bu_cnt == 3'd2) bu_cfg_load <= 1'b1;   // config valid next cycle
            if (bu_cnt == 3'd3) bu_load     <= 1'b1;   // then load + enable
        end
    end

    logic load_config_eff;
    assign load_config_eff = load_config | bu_load;
    // -----------------------------------------------------------------------

    always_ff @(posedge prog_clk or posedge reset) begin
        if (reset)
            shift_reg <= '0;
        else
            shift_reg <= {shift_reg[TOTAL_BITS-2:0], prog_data};
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            config_reg <= '0;
        else if (bu_cfg_load)
            config_reg <= bu_config;       // bring-up constant
        else if (load_config)
            config_reg <= shift_reg;       // real scan chain (unused for now)
    end
    //when scanning go MSB to LSB 
    //start with weight[15][MSB->LSB]..weight[0][0]..config params MSB to LSB
    
    localparam B_WEIGHT = b_weight+2;
    localparam B_THRESH = b_thresh;
    localparam B_REFRAC = b_time+1;
    localparam B_LEAK = b_time+1;
    localparam N = N_inputs*N_neurons;
    
    //Scan chain inputs
    logic signed [N*(B_WEIGHT)-1:0] synapse_weights; 
    logic [b_thresh-1:0] threshold;
    logic [b_time:0] refractory;
    logic [b_time:0] leak_rate;
    int offset;

    always_comb begin
        offset = TOTAL_BITS-1;
        
        //MSB N*6 bits for syn_weights
//        for (int i = 0; i < N; i++) begin
//            synapse_weights[N-1-i] = config_reg[offset -: B_WEIGHT];
//            offset -= B_WEIGHT;
//        end
        synapse_weights = config_reg[offset -: (N*B_WEIGHT)];
        offset -= (N*B_WEIGHT);
        //rest is config
        threshold = config_reg[offset -: B_THRESH];
        offset -= B_THRESH;
        refractory = config_reg[offset -: B_REFRAC];
        offset -= B_REFRAC;
        leak_rate = config_reg[offset -: B_LEAK];
        offset -= B_LEAK;
    end
    
    //Instantiate 
    //DM DUT
    logic [DATA_WIDTH-1:0] signal;
    logic [1:0] dm_out;
    
    delta_mod_grad dm_dut(
        .clk(clk),
        .dm_reset(dm_reset),
        .ecg_in(ecg_in),
        .dm_spike_out(dm_out),
        .signal(signal)
    );
    //Neuron Array DUT
    neuron_array #(
        .N_inputs(N_inputs),
        .N_neurons(N_neurons),
        .b_weight(b_weight), //6
        .b_accum(b_accum),
        .b_thresh(b_thresh),
        .b_time(b_time),
        .LEARN(LEARN)
    ) dut (
        .clk(clk),
        .reset(reset),
        .load_config(load_config_eff),
        .spike_in(dm_out),
        .synapse_weights(synapse_weights),
        .threshold(threshold),
        .refractory(refractory),
        .leak_rate(leak_rate),
        .fire(fire),
        .winner(winner)
    );


endmodule