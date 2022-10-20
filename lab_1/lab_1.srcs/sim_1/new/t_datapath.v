`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2022 01:50:25 PM
// Design Name: 
// Module Name: t_datapath
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


module t_datapath(

    );
    
    reg  clk;
    reg  rst;
    reg  [15:0] user_inst_write;
    reg  [11:0] user_inst_addr;
    reg  [3:0] disp_RS;
    reg  ap_start;
    wire [15:0] disp_RD;
    
    // Define ops
    localparam op_add  = 4'b0101; 
    localparam op_sub  = 4'b0110; 
    localparam op_inc  = 4'b0001; 
    localparam op_xor  = 4'b0111; 
    localparam op_cmp  = 4'b1000; 
    localparam op_mov0 = 4'b1001; // Rn, num
    localparam op_mov1 = 4'b1010; // Rn, Rm
    localparam op_mov2 = 4'b1011; // [Rn], Rm
    localparam op_mov3 = 4'b1100; // Rn, [Rm]
    localparam op_mov4 = 4'b1101; // [Rn], [Rm]
    localparam op_sadd = 4'b1110; 
    localparam op_jmp  = 4'b0010; 
    localparam op_jne  = 4'b0011; 
    localparam op_je   = 4'b0100;    
    localparam op_nop  = 4'b1111; 
    localparam op_halt = 4'b0000; 
    
    datapath datapath0 (
        .clk            (clk            ),
        .rst            (rst            ),
        .user_inst_write(user_inst_write),
        .user_inst_addr (user_inst_addr ),
        .disp_RS        (disp_RS        ),
        .ap_start       (ap_start       ),
        .disp_RD        (disp_RD        )
    );
    
    always
        #10 clk = ~clk;
        
    integer i;
    initial begin
        clk            = 'b0;
        rst            = 'b0;
        user_inst_write= 'b0;
        user_inst_addr = 'b0;
        disp_RS        = 'b0;
        ap_start       = 'b0;
        
        #10 rst = 1; #20 rst = 0;
        
        // Load instructions
        // Load data
        #10 user_inst_write <= {op_mov0, 6'b000000, 6'b000001}; user_inst_write <= user_inst_write + 1;
        #10 user_inst_write <= {op_mov0, 6'b000001, 6'b000010}; user_inst_write <= user_inst_write + 1;
        #10 user_inst_write <= {op_mov0, 6'b000010, 6'b000100}; user_inst_write <= user_inst_write + 1;
        #10 user_inst_write <= {op_mov0, 6'b000011, 6'b001000}; user_inst_write <= user_inst_write + 1;
        #10 user_inst_write <= {op_mov0, 6'b000100, 6'b010000}; user_inst_write <= user_inst_write + 1;
        #10 user_inst_write <= {op_mov0, 6'b000101, 6'b100000}; user_inst_write <= user_inst_write + 1;

        // Test ALU ops
        #10 user_inst_write <= {op_add,  6'b000000, 6'b100000}; user_inst_write <= user_inst_write + 1;
        #10 user_inst_write <= {op_sub,  6'b000001, 6'b100000}; user_inst_write <= user_inst_write + 1;
        #10 user_inst_write <= {op_inc,  6'b000010, 6'b100000}; user_inst_write <= user_inst_write + 1;
        #10 user_inst_write <= {op_xor,  6'b000011, 6'b100000}; user_inst_write <= user_inst_write + 1;
        #10 user_inst_write <= {op_cmp,  6'b000100, 6'b100000}; user_inst_write <= user_inst_write + 1;
        #10 user_inst_write <= {op_sadd, 6'b000101, 6'b100000}; user_inst_write <= user_inst_write + 1;

        // Halt
        #10 user_inst_write <= {op_halt, 6'b000000, 6'b000000}; user_inst_write <= user_inst_write + 1;
        
        // AP_start
        #10 ap_start = 1;
        
        // Let Run
        #150;
        
        // Read registers
        for (i=0; i<6; i=i+1) begin
            disp_RS = i; #10;
        end
        
        $finish;
    end
        
endmodule
