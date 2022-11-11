`timescale 1ns / 1ps

`include "my_header.vh"


// takes the input from UART and generates a sustained key value and pulsed wen on the PS/2 clk
module uart_arbiter(
    input wire clk_100,
    input wire clk_ps2,
    input wire rst,
    input wire [7:0] uart_dat,
    input wire uart_dv,
    output reg [7:0] key_uart,
    output reg wen_uart
);

// Two interconnected FSMs, on system clock and ps2 clock respectively
//  >0 IDLE, waits for UART signal in, uart signal sustained as previous value
//  >1 set off ps2 fsm, wait for it to enter state 1
//  >2 wait for valid to go low

// Latch UART inputs
reg [1:0] uart_cs, uart_ns;
reg [7:0] key_uart_n;

localparam [1:0] IDLE = 2'b00,
                 FLAG = 2'b01,
                 WAIT = 2'b10;

always @(posedge clk_100) begin
    if (rst) begin
        uart_cs <= 'b0;
        key_uart <= 'b0;
    end else begin
        uart_cs <= uart_ns;
        key_uart <= key_uart_n;
    end
end

always @(posedge clk_ps2) begin
    if (rst) begin
        wen_uart <= 1'b0;
    end else begin
        wen_uart <= (uart_cs == FLAG) ? 1'b1 : 1'b0; // will go high for the duration of a ps2 clock only once per input key
    end
end

always @(*) begin
    case (uart_cs)
        IDLE: begin // wait for uart valid, register value
            uart_ns = (uart_dv) ? FLAG : IDLE;
            key_uart_n = (uart_dv) ? uart_dat : key_uart;
        end
        FLAG: begin // wait for wen to be asserted, then move on
            uart_ns = (wen_uart) ? WAIT : FLAG;
            key_uart_n = key_uart;
        end
        WAIT: begin // wait for uart valid to go low
            uart_ns = (uart_dv) ? WAIT : IDLE;
            key_uart_n = key_uart;
        end
    endcase
end

endmodule