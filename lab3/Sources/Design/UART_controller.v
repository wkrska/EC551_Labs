`timescale 1ns / 1ps

`include "my_header.vh"

module UART_controller (
    input wire          CLK,
    input wire          RST,
    input wire [7:0]    UART_TX_DAT,
    input wire          UART_TX_SEND,
    input wire          UART_RXD,
    output reg          UART_TXD,
    output wire         UART_TX_READY,
    output reg [7:0]    UART_RX_DAT,
    output reg          UART_RX_VALID
);

    UART_TX_CTRL TX(
        .SEND(UART_TX_SEND),
        .DATA(UART_TX_DAT),
        .CLK(CLK),
        .READY(UART_TX_READY),
        .UART_TX(UART_TXD) 
    );

    UART_RX_CTRL RX(
        .i_Rst_L(RST),
		.i_Clock(CLK),
		.i_RX_Serial(UART_RXD),
		.o_RX_DV(UART_RX_VALID),
		.o_RX_Byte(UART_RX_DAT) 
    );

endmodule