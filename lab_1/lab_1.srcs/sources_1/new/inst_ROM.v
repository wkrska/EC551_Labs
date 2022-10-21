`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2022 10:40:55 AM
// Design Name: 
// Module Name: inst_ROM
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


module inst_ROM(
    input clk,
    input rst,
    input ap_start,
    input [11:0] user_inst_addr,
    input [15:0] user_inst_write
    );
    
    reg [2:0] cs, ns;
    reg [5:0] cnt, cnt_next;
    
    // sequential logic
    always @(posedge clk) begin
        cs <= (rst) ? 0 : ns;
        cnt <= (rst) ? 0 : cnt_next;
    end
    
    always @(*) begin
        case (cs)
            3'b000: begin
                ns = (rst)? 0 : 1;  // wait for rst to be 0
                ap_start = 0;
                user_inst_addr = 0;
                user_inst_write = 0;
                end
            3'b001: begin 
                cnt_next = (cnt == 1000) ? 0 : cnt+1;
                ns = (cnt == 1000) ? 2 : cs;             // here for a bit to wait
                ap_start = 0;
                user_inst_addr = 0;
                user_inst_write = 0;
                end
            3'b010: begin // instructions
                cnt_next = (cnt == 1000) ? 0 : cnt+1;
                ap_start = 0;
                case (cnt)
                    #10;  user_inst_addr = `inst_start;        user_inst_write = {op_mov0, r0, 6'b000001};
                    #10;  user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov0, r1, 6'b000010};
                    #10;  user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov0, r2, 6'b000100};
                    #10;  user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov0, r3, 6'b001000};
                    #10;  user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov0, r4, 6'b010000};
                    #10;  user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov0, r5, 6'b100000};
            
                    // Test ALU ops
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_add,  r0, r4}; // R0 = 1+32=33
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_sadd, r4, r5}; // R4 = 0100000+1111111111100000 = 1111111111110000=0x44a0
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_sub,  r5, r1}; // R5 = 32-2=30
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r2, dc}; // R2 = 4+30=34
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_xor,  r3, r5}; // R3 = R3^R5 = 001000^011110=010110=16+4+2=22
                    
                    // Test jumps
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov0, r0, 6'b000001}; // reset values
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov0, r1, 6'b000010};
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov0, r2, 6'b000100};
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov0, r3, 6'b001000};
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov0, r4, 6'b010000};
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov0, r5, dc};
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_jmp,  (user_inst_addr+3)};   // jmp
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov2, r1, r0};               // mov [R1] R0
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov4, r2, r1};               // mov [R2] [R1]
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov3, r1, r2};               // mov r1 [R2]
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov1, r4, r0};               // mov r4 r0
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_cmp,  r1, r4};               // cmp r1 r4
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_je,   (user_inst_addr+3)};   // je
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_cmp,  r1, r2};               // cmp r1 r2
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_jne,  (user_inst_addr+3)};               // jne r1 r4
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
                    #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
                    
    end
    
    
endmodule
