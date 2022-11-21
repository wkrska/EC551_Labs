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
    input wire CLK100MHZ,
    input wire rst,
    input wire PS2_CLK,
    input wire PS2_DATA,
    output wire [7:0] keystroke,
    output wire keyflagtop
    );
    
reg CLK50MHZ=0;
wire keyflag;
reg [1:0] cs, ns;
always @(posedge CLK100MHZ)begin
    CLK50MHZ<=~CLK50MHZ;
    cs <= ns;
end

assign keyflagtop = cs[0];

always @(*) begin  
    case(cs)
        2'b00: ns = (keyflag) ? 2'b01 : 2'b00;
        2'b01: ns = 2'b10;
        2'b10: ns = (keyflag) ? 2'b10 : 2'b00;
    endcase
end


PS2Receiver keyboard (
    .clk(CLK50MHZ),
    .rst(rst),
    .kclk(PS2_CLK),
    .kdata(PS2_DATA),
    .keystroke(keystroke),
    .keyflag(keyflag)
);
 
endmodule
    