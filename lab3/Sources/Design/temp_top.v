`timescale 1ns / 1ps

`include "my_header.vh"

module temp_top(
    input wire CLK100MHZ, rst,
    input wire [15:0] SW,
    input wire [4:0] BTN, 
    
    // PS2
    input PS2_DATA,
    input PS2_CLK,
    output wire [15:0] LED,
    output wire [7:0] SSEG_CA,
    output wire [7:0] SSEG_AN,
    
    // UART
    output wire UART_TXD,
    input wire UART_RXD,
    
    // VGA
    output wire [3:0] VGA_R,
    output wire [3:0] VGA_G,
    output wire [3:0] VGA_B,
    output wire VGA_HS,
    output wire VGA_VS
    );
    
    //============= UART and PS/2 =============//
    wire [7:0] mode;
    reg [2:0] mode_select;
    wire [7:0] key_select_ps2, key_select_ascii;
    wire keyflag_temp;
    wire modeflagtop_temp;
    wire [103:0] disp_mat;
    wire [31:0] disp_alu;
    wire [7:0] uart_dat;
    wire uart_dv;
    
    GPIO_demo UART_interface(
    .SW(SW),
    .BTN(BTN),
    .CLK(CLK100MHZ),
    .RST(rst),
    .keyflag(keyflag_temp),
    .modeflag('b0),
    .alu_out('b0),
    .bench_out('b0),
    .SSEG_CA(SSEG_CA),
    .SSEG_AN(SSEG_AN),
    .mode_select('b0),
    .key_select(key_select_ascii),
    .UART_TXD(UART_TXD),
    .UART_RXD(UART_RXD),
    .uart_dat(uart_dat),
    .uart_dv(uart_dv)
    );

    ps2_to_ascii p2a(
        .ps2(key_select_ps2),
        .ascii(key_select_ascii)
    );
    
    top_keyboard keyboard_interface(
        .CLK100MHZ(CLK100MHZ),
        .rst(rst),
        .PS2_CLK(PS2_CLK),
        .PS2_DATA(PS2_DATA),
        .keystroke(key_select_ps2),
        .keyflagtop(keyflag_temp)
    );
    reg [15:0] cnt=0;
    
    always @(posedge keyflag_temp)
        cnt = cnt+1;
        
    assign LED = cnt;
    // other things that need to be defined
    assign VGA_R = 'b0;
    assign VGA_G = 'b0;
    assign VGA_B = 'b0;
    assign VGA_HS = 'b0;
    assign VGA_VS = 'b0;

endmodule
