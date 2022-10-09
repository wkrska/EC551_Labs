`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 12:38:14 PM
// Design Name: 
// Module Name: t_vga_control
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


module t_vga_control(
    input CLK, RST_BTN,
    output wire VGA_HS, VGA_VS,
    output wire [3:0] VGA_R, VGA_G, VGA_B
    );
    
    wire [3:0] switches = 4'd5;
    wire [3:0] buttons = 4'b1010;
    
    vga_control vc(.clk(CLK), .reset(RST_BTN), .switches(switches), .buttons(buttons), 
        .hsync(VGA_HS), .vsync(VGA_VS), .vga_r(VGA_R), .vga_g(VGA_G), .vga_b(VGA_B));
        
endmodule
