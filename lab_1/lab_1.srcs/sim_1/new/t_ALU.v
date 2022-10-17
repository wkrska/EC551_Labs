`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2022 01:50:25 PM
// Design Name: 
// Module Name: t_ALU
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


module t_ALU(

    );
    
    reg [3:0] op;
    reg [15:0] din0; // rf_out_1
    reg [15:0] din1; // rf_out_2
    reg [5:0] Rm_in; // rf_out_2
    reg [15:0] mem_in; // rf_out_2
    reg [12:0] imm_in; // 12 bit imm
    wire [15:0] dout;
    wire jump;
    
    ALU alu0(
        .op     (op    ),
        .din0   (din0  ),
        .din1   (din1  ),
        .Rm_in  (Rm_in ),
        .mem_in (mem_in),
        .imm_in (imm_in),
        .dout   (dout  ),
        .jump   (jump  )
    );
    
    integer i;
    initial begin
        op = 'b0;
        din0 = 16'hff00;
        din1 = 16'h00ff;
        Rm_in = 6'h3f;
        mem_in = 16'hf0f0;
        imm_in = 12'hf0f;
        
        for (i=0; i<16; i=i+1)
           #10; op = op+1;
        #10;
        
        $finish;
    end
endmodule
