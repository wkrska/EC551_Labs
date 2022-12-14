`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2022 09:20:13 AM
// Design Name: 
// Module Name: PS2Receiver
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


module PS2Receiver(
    input wire clk,
    input wire rst,
    input wire kclk,
    input wire kdata,
    output reg [7:0] mode,
    output reg [7:0] keystroke,
    output reg keyflag,
    output reg modeflag
    );
    
    wire kclkf, kdataf;
    reg [7:0]datacur;
    reg [7:0]dataprev;
    reg [3:0]cnt;
    reg [31:0]keycode;
    reg flag;
    
    initial begin
        keycode[31:0]<=8'h00000000;
        cnt<=4'b0000;
        flag<=1'b0;
    end
    
keyboard_debouncer debouncer1(
    .clk(clk),
    .I0(kclk),
    .I1(kdata),
    .O0(kclkf),
    .O1(kdataf)
);
    
always@(negedge(kclkf)) begin // on negedge of ps2 clk (per protocol)
    case(cnt) // assign data in
        0:;//Start bit
        1:datacur[0]<=kdataf;
        2:datacur[1]<=kdataf;
        3:datacur[2]<=kdataf;
        4:datacur[3]<=kdataf;
        5:datacur[4]<=kdataf;
        6:datacur[5]<=kdataf;
        7:datacur[6]<=kdataf;
        8:datacur[7]<=kdataf;
        9:flag<=1'b1;
        10:flag<=1'b0;
    endcase
    // it works so dont touch it
    if(cnt<=9) cnt<=cnt+1;
    else cnt<=0;    
end

// keycode = [ k0  k1  k2  k4 ] s.t [ mode  wtf  release  enter]
always @(posedge flag)begin // when full byte is recieved
    if (dataprev!=datacur) begin
        keycode[31:24]<=keycode[23:16];
        keycode[23:16]<=keycode[15:8];
        keycode[15:8]<=dataprev;
        keycode[7:0]<=datacur;
        dataprev<=datacur;
    end
end

// general description:
//      when full byte recieved
//      proceed only if new byte recieved
//      
//
//
always @(posedge flag) begin
    if (dataprev!=datacur)begin
        if (keycode[15:8] == 'hF0)begin
            keyflag<=1;
            keystroke<=keycode[7:0];
            if (keycode[7:0] == 'h5A) begin
                mode <= keycode[31:24];
                modeflag<= 1;
            end
        end
    end
    else begin
        keyflag<=0;
        modeflag<=0;
    end
end

    
endmodule