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
//    output UART_TXD,
    output [7:0] mode,
    output [7:0] keystroke,
    output reg keyflagtop,
    output reg modeflagtop
    );
    
reg CLK50MHZ=0;
reg [1:0] keyflagstate='b00;
reg [1:0] keyflagstate_ns='b00;
reg [1:0] modeflagstate='b00;
reg [1:0] modeflagstate_ns='b00;

always @(posedge(CLK100MHZ))begin
    case(keyflagstate)
    'b00: begin
    keyflagtop=0;
    if (keyflag == 1) begin
    keyflagstate_ns='b01;
    end
    end
    'b01:begin
    keyflagstate_ns='b10;
    end
    'b10:begin
    keyflagstate_ns='b11;
    end
    'b11:  begin
    keyflagstate_ns='b00;
    keyflagtop=1;
    end
    endcase
end   

always @(posedge(CLK100MHZ))begin
    case(modeflagstate)
    'b00: begin
    modeflagtop=0;
    if (modeflag == 1) begin
    modeflagstate_ns='b01;
    end
    end
    'b01:begin
    modeflagstate_ns='b10;
    end
    'b10:begin
    modeflagstate_ns='b11;
    end
    'b11:begin
    modeflagstate_ns='b00;
    modeflagtop=1;
    end
    endcase
end   

 always @(posedge CLK100MHZ) begin
        keyflagstate <= keyflagstate_ns;
        modeflagstate <= modeflagstate_ns;
        end


always @(posedge(CLK100MHZ))begin
    CLK50MHZ<=~CLK50MHZ;
end

PS2Receiver keyboard (
.clk(CLK50MHZ),
.kclk(PS2_CLK),
.kdata(PS2_DATA),
.mode(mode),
.keystroke(keystroke),
.keyflag(keyflag),
.modeflag(modeflag)
);
 
endmodule
    