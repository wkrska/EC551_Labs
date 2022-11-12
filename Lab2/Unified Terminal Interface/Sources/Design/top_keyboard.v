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
    input rst,
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

// FSM for key flag
always @(*)begin
    case(keyflagstate)
        'b00: begin
            keyflagtop=0; // On idle, output flag is 0
            if (keyflag == 1) begin // if input flag is 1
                keyflagstate_ns='b01; // next state
            end
        end
        'b01:begin
            keyflagtop=0;
            keyflagstate_ns='b10; //... next state?
        end
        'b10:begin
            keyflagtop=0;
            keyflagstate_ns='b11; //... next state?
        end
        'b11:  begin
            keyflagstate_ns='b00; //... next state, and finally assert output?
            keyflagtop=1;
        end
    endcase
end   

always @(*)begin
    case(modeflagstate)
        'b00: begin
            modeflagtop=0;
            if (modeflag == 1) begin
                modeflagstate_ns='b01;
            end
        end
        'b01:begin
            modeflagtop=0;
            modeflagstate_ns='b10; //... next state?
        end
        'b10:begin
            modeflagtop=0;
            modeflagstate_ns='b11; //... next state?
        end
        'b11:begin
            modeflagstate_ns='b00; //... next state, and finally assert output?
            modeflagtop=1;
        end
    endcase
end   

 always @(posedge CLK100MHZ) begin
    if (rst) begin
        keyflagstate <= 'b0;
        modeflagstate <= 'b0;
    end else begin
        keyflagstate <= keyflagstate_ns;
        modeflagstate <= modeflagstate_ns;
    end
end


always @(posedge(CLK100MHZ))begin
    CLK50MHZ<=~CLK50MHZ;
end

PS2Receiver keyboard (
    .clk(CLK50MHZ),
    .rst(rst),
    .kclk(PS2_CLK),
    .kdata(PS2_DATA),
    .mode(mode),
    .keystroke(keystroke),
    .keyflag(keyflag),
    .modeflag(modeflag)
);
 
endmodule
    