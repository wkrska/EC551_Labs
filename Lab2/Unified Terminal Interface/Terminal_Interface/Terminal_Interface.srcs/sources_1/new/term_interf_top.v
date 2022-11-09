`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2022 08:46:45 AM
// Design Name: 
// Module Name: term_interf_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module term_interf_top(
    input wire CLK100MHZ, rst,
    input wire [15:0] SW,
    input wire [4:0] BTN, 
    input PS2_DATA,
    input PS2_CLK,
    output wire [15:0] LED,
    output wire [7:0] SSEG_CA,
    output wire [7:0] SSEG_AN
    );
    
    wire UART_TXD_keyboard;
    wire [7:0] mode;
    reg [2:0] mode_select;
    
    
    GPIO_demo UART_interface(
    .SW(SW),
    .BTN(BTN),
    .CLK(CLK100MHZ),
    .LED(LED),
    .SSEG_CA(SSEG_CA),
    .SSEG_AN(SSEG_AN),
    .UART_TXD(UART_TXD),
    .RGB1_Red(RGB1_Red),
    .RGB1_Green(RGB1_Green),
    .RGB1_Blue(RGB1_Blue),
    .RGB2_Red(RGB2_Red),
    .RGB2_Green(RGB2_Green),
    .RGB2_Blue(RGB2_Blue),
    .micClk(micClk),
    .micLRSel(micLRSel),
    .micData(micData),
    .ampPWM(ampPWM),
    .ampSD(ampSD)   
    );
    
    top_keyboard keyboard_interface(
    .CLK100MHZ(CLK100MHZ),
    .PS2_CLK(PS2_CLK),
    .PS2_DATA(PS2_DATA),
    .UART_TXD(UART_TXD_keyboard),
    .mode(mode)
    );
    
    always @(mode)
    case(mode)
    'h43:mode_select = 3'b000;    //Mode I   Keyboard Instruction
    'h4B:mode_select = 3'b001;    //Mode L  UART
    'h1C:mode_select = 3'b010;    //Mode A   ALU
    'h32:mode_select = 3'b011;    //Mode B    Benchmark
    
    default:mode_select = 3'b100;
	
	endcase
    
    
    
endmodule
