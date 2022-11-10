`timescale 1ns / 1ps

`include "my_header.vh"


// takes the input from UART and generates a sustained key value and pulsed wen on the PS/2 clk
module uart_arbiter(
    input wire clk_100,
    input wire clk_ps2,
    input wire rst,
    input wire [7:0] uart_dat,
    input wire uart_dv,
    output reg key_uart,
    output reg wen_uart
);

// Two interconnected FSMs, on system clock and ps2 clock respectively
//  >0 IDLE, waits for UART signal in, uart signal sustained as previous value
//  >1 set off ps2 fsm, wait for it to enter state 1
//  >2 wait for valid to go low

// Latch UART inputs
reg [1:0] uart_cs, uart_ns;
reg wen_uart_n;
reg [7:0] key_uart_n;

localparam [1:0] IDLE = 2'b00,
                 FLAG = 2'b01,
                 WAIT = 2'b10;

always @(posedge clk_100) begin
    if (rst) begin
        uart_cs <= 'b0;
        wen_uart <= 'b0;
        key_uart <= 'b0;
    end else begin
        uart_cs <= uart_ns;
        wen_uart <= wen_uart_n;
        key_uart <= key_uart_n;
    end
end

always @(posedge clk_ps2) begin
    if (rst) begin
        uart_wen <= 1'b0;
    end else begin
        uart_wen <= (uart_cs == FLAG) ? 1'b1 : 1'b0; // will go high for the duration of a ps2 clock only once per input key
    end
end

always @(*) begin
    case (uart_cs)
        IDLE: begin
            uart_ns = (uart_dv) ? FLAG : IDLE;
            wen_uart_n = 1'b0;
            key_uart_n = key_uart;
        end
        FLAG: begin
            uart_ns = (uart_dv) ? FLAG : IDLE;
        end
        WAIT: begin
            
        end
    endcase
end

endmodule