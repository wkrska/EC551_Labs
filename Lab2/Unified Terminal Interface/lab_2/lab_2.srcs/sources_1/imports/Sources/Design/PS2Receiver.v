`timescale 1ns / 1ps
module PS2Receiver(
    input wire clk,
    input wire rst,
    input wire kclk,
    input wire kdata,
    output reg [7:0] keystroke,
    output reg keyflag
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


// keycode output FSM
reg [1:0] cs,ns;
localparam [1:0] IDLE = 2'b0, RELEASE = 2'b01, KEY = 2'b10;
always @(posedge flag) begin
    cs <= (rst) ? IDLE : ns;
end
always @(*) begin
    case(cs)
        IDLE: begin
            ns = (datacur == 8'hF0) ? RELEASE : IDLE;
            keystroke = 'b0;
            keyflag = 'b0;
        end
        RELEASE: begin
            ns = KEY;
            keystroke = 'b0;
            keyflag = 'b0;
        end
        KEY: begin
            ns = IDLE;
            keystroke = datacur;
            keyflag = 'b1;
        end
    endcase
end



    
endmodule