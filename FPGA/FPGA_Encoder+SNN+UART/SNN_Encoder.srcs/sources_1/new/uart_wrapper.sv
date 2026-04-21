`timescale 1ns / 1ps

module uart_wrapper #(
    parameter int DATA_WIDTH = 12,
    parameter int BAUD_RATE = 9600,
    parameter int CLK_FREQ = 100_000_000
)(
    input logic clk,
    input logic rst,
    
    // uart lines
    input logic uart_rx,
    output logic uart_tx,
    
    // data interface
    output logic [DATA_WIDTH-1:0] rx_data,
    output logic rx_valid,
    input logic rx_ready,
    
    input logic [DATA_WIDTH-1:0] tx_data,
    input logic tx_valid,
    output logic tx_ready
);

    localparam int BAUD_CLOCKS = CLK_FREQ / BAUD_RATE;
    localparam int HALF_BAUD = BAUD_CLOCKS / 2;
    
    // ============ RX Path ============
    typedef enum logic [2:0] {
        RX_IDLE,
        RX_START,
        RX_DATA,
        RX_STOP
    } rx_state_t;
    
    rx_state_t rx_state;
    logic [3:0] rx_bit_cnt;
    logic [15:0] rx_clk_cnt;
    logic [11:0] rx_shift;
    logic rx_busy;
    
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            rx_state <= RX_IDLE;
            rx_bit_cnt <= 0;
            rx_clk_cnt <= 0;
            rx_shift <= 0;
            rx_valid <= 0;
        end else begin
            rx_valid <= 0;
            
            case (rx_state)
                RX_IDLE: begin
                    rx_clk_cnt <= 0;
                    rx_bit_cnt <= 0;
                    if (~uart_rx) begin
                        rx_state <= RX_START;
                    end
                end
                
                RX_START: begin
                    if (rx_clk_cnt == HALF_BAUD - 1) begin
                        rx_state <= RX_DATA;
                        rx_clk_cnt <= 0;
                    end else begin
                        rx_clk_cnt <= rx_clk_cnt + 1;
                    end
                end
                
                RX_DATA: begin
                    if (rx_clk_cnt == BAUD_CLOCKS - 1) begin
                        rx_shift <= {uart_rx, rx_shift[11:1]};
                        rx_clk_cnt <= 0;
                        if (rx_bit_cnt == DATA_WIDTH - 1) begin
                            rx_state <= RX_STOP;
                            rx_bit_cnt <= 0;
                        end else begin
                            rx_bit_cnt <= rx_bit_cnt + 1;
                        end
                    end else begin
                        rx_clk_cnt <= rx_clk_cnt + 1;
                    end
                end
                
                RX_STOP: begin
                    if (rx_clk_cnt == BAUD_CLOCKS - 1) begin
                        rx_state <= RX_IDLE;
                        rx_clk_cnt <= 0;
                        rx_valid <= 1;
                    end else begin
                        rx_clk_cnt <= rx_clk_cnt + 1;
                    end
                end
            endcase
        end
    end
    
    assign rx_data = rx_shift[DATA_WIDTH-1:0];
    assign rx_busy = (rx_state != RX_IDLE);
    
    // ============ TX Path ============
    typedef enum logic [2:0] {
        TX_IDLE,
        TX_START,
        TX_DATA,
        TX_STOP
    } tx_state_t;
    
    tx_state_t tx_state;
    logic [3:0] tx_bit_cnt;
    logic [15:0] tx_clk_cnt;
    logic [11:0] tx_shift;
    logic tx_out;
    
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            tx_state <= TX_IDLE;
            tx_bit_cnt <= 0;
            tx_clk_cnt <= 0;
            tx_shift <= 0;
            tx_out <= 1;
        end else begin
            case (tx_state)
                TX_IDLE: begin
                    tx_out <= 1;
                    tx_clk_cnt <= 0;
                    tx_bit_cnt <= 0;
                    if (tx_valid) begin
                        tx_shift <= tx_data;
                        tx_state <= TX_START;
                    end
                end
                
                TX_START: begin
                    tx_out <= 0;
                    if (tx_clk_cnt == BAUD_CLOCKS - 1) begin
                        tx_state <= TX_DATA;
                        tx_clk_cnt <= 0;
                        tx_bit_cnt <= 0;
                    end else begin
                        tx_clk_cnt <= tx_clk_cnt + 1;
                    end
                end
                
                TX_DATA: begin
                    tx_out <= tx_shift[0];
                    if (tx_clk_cnt == BAUD_CLOCKS - 1) begin
                        tx_shift <= {1'b0, tx_shift[11:1]};
                        tx_clk_cnt <= 0;
                        if (tx_bit_cnt == DATA_WIDTH - 1) begin
                            tx_state <= TX_STOP;
                            tx_bit_cnt <= 0;
                        end else begin
                            tx_bit_cnt <= tx_bit_cnt + 1;
                        end
                    end else begin
                        tx_clk_cnt <= tx_clk_cnt + 1;
                    end
                end
                
                TX_STOP: begin
                    tx_out <= 1;
                    if (tx_clk_cnt == BAUD_CLOCKS - 1) begin
                        tx_state <= TX_IDLE;
                        tx_clk_cnt <= 0;
                    end else begin
                        tx_clk_cnt <= tx_clk_cnt + 1;
                    end
                end
            endcase
        end
    end
    
    assign uart_tx = tx_out;
    assign tx_ready = (tx_state == TX_IDLE);

endmodule