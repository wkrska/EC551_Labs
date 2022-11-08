`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2022 09:17:16 AM
// Design Name: 
// Module Name: top_keyboard
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


module top_keyboard(
    input CLK100MHZ,
    input PS2_CLK,
    input PS2_DATA,
    output UART_TXD,
    output [7:0] mode
    );
    
reg CLK50MHZ=0;    


always @(posedge(CLK100MHZ))begin
    CLK50MHZ<=~CLK50MHZ;
end

PS2Receiver keyboard (
.clk(CLK50MHZ),
.kclk(PS2_CLK),
.kdata(PS2_DATA),
.mode(mode)
);
 
endmodule
    