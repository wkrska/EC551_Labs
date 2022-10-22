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
    output reg ap_start,
    output reg [11:0] user_inst_addr,
    output reg [15:0] user_inst_write
    );
    
    reg [2:0] cs, ns;
    reg [11:0] cnt, cnt_next;
    reg [11:0] user_inst_addr_next;
    reg [15:0] user_inst_write_next;
    
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
    
    // give regs names
    localparam r0 = 6'b000000;
    localparam r1 = 6'b000001;
    localparam r2 = 6'b000010;
    localparam r3 = 6'b000011;
    localparam r4 = 6'b000100;
    localparam r5 = 6'b000101;
    localparam dc = 6'b000000;
    
    
    // sequential logic
    always @(posedge clk) begin
        cs <= (rst) ? 0 : ns;
        cnt <= (rst) ? 0 : cnt_next;
        jmp_addr <= jmp_addr_next;
        user_inst_addr <= user_inst_addr_next;
        user_inst_write <= user_inst_write_next;
    end
    
    reg [11:0] jmp_addr_next, jmp_addr;
    always @(*) begin
        case (cs)
            3'b000: begin
                ns = (rst)? 0 : 1;  // wait for rst to be 0
                cnt_next = 0;
                ap_start = 0;
                user_inst_addr_next = 0;
                user_inst_write_next = 0;
                jmp_addr_next = 0;
                end
            3'b001: begin 
                cnt_next = (cnt == 16) ? 0 : cnt+1;
                ns = (cnt == 16) ? 2 : cs;             // here for a bit to wait
                ap_start = 0;
                user_inst_addr_next = 0;
                user_inst_write_next = 0;
                jmp_addr_next = 0;
                end
            3'b010: begin // instructions
                cnt_next = cnt+1;
                ap_start = 0;
//                user_inst_addr_next = `inst_start + cnt; 
//                jmp_addr_next = `inst_start + cnt + 12'd5;
                case (cnt)
                    6'd0  : begin ns = cs; user_inst_addr_next = 12'd31; user_inst_write_next = {op_mov0, r0, 6'b000001};      end
                    6'd1  : begin ns = cs; user_inst_addr_next = 12'd32; user_inst_write_next = {op_mov0, r1, 6'b000010};      end
                    6'd2  : begin ns = cs; user_inst_addr_next = 12'd33; user_inst_write_next = {op_mov0, r2, 6'b000100};      end
                    6'd3  : begin ns = cs; user_inst_addr_next = 12'd34; user_inst_write_next = {op_mov0, r3, 6'b001000};      end
                    6'd4  : begin ns = cs; user_inst_addr_next = 12'd35; user_inst_write_next = {op_mov0, r4, 6'b010000};      end
                    6'd5  : begin ns = cs; user_inst_addr_next = 12'd36; user_inst_write_next = {op_mov0, r5, 6'b100000};      end
                                   
                    // Test ALU ops
                    6'd6  : begin ns = cs; user_inst_addr_next = 12'd37; user_inst_write_next = {op_add,  r0, r4};             end   // R0 = 1+32=33
                    6'd7  : begin ns = cs; user_inst_addr_next = 12'd38; user_inst_write_next = {op_sadd, r4, r5};             end   // R4 = 010000+1111111111100000 = 1111111111110000=0xfff0
                    6'd8  : begin ns = cs; user_inst_addr_next = 12'd39; user_inst_write_next = {op_sub,  r5, r1};             end   // R5 = 32-2=30
                    6'd9  : begin ns = cs; user_inst_addr_next = 12'd40; user_inst_write_next = {op_inc,  r2, dc};             end   // R2 = 4+1=5
                    6'd10 : begin ns = cs; user_inst_addr_next = 12'd41; user_inst_write_next = {op_xor,  r3, r5};             end   // R3 = R3^R5 = 001000^011110=010110=16+4+2=22
                                          
                    6'd11 : begin ns = cs;  user_inst_addr_next = 12'd42; user_inst_write_next = {op_halt, 6'b110000, 6'b110000};end   // halt
                    
                    // Test jumps and movs
                    6'd12 : begin ns = cs; user_inst_addr_next = 12'd43;  user_inst_write_next = {op_mov0, r0, 6'b000001};     end   // reset values
                    6'd13 : begin ns = cs; user_inst_addr_next = 12'd44;  user_inst_write_next = {op_mov0, r1, 6'b000010};     end
                    6'd14 : begin ns = cs; user_inst_addr_next = 12'd45;  user_inst_write_next = {op_mov0, r2, 6'b000100};     end
                    6'd15 : begin ns = cs; user_inst_addr_next = 12'd46;  user_inst_write_next = {op_mov0, r3, 6'b001000};     end
                    6'd16 : begin ns = cs; user_inst_addr_next = 12'd47;  user_inst_write_next = {op_mov0, r4, 6'b010000};     end
                    6'd17 : begin ns = cs; user_inst_addr_next = 12'd48;  user_inst_write_next = {op_mov0, r5, dc};            end
                    6'd18 : begin ns = cs; user_inst_addr_next = 12'd49;  user_inst_write_next = {op_jmp,  12'd51};            end   // jmp
                    6'd19 : begin ns = cs; user_inst_addr_next = 12'd50;  user_inst_write_next = {op_inc,  r5, dc};            end   // R5 = R5+1 (should be skipped)
                    6'd20 : begin ns = cs; user_inst_addr_next = 12'd51;  user_inst_write_next = {op_inc,  r5, dc};            end   // R5 = R5+1 (should be skipped)
                    6'd21 : begin ns = cs; user_inst_addr_next = 12'd52;  user_inst_write_next = {op_mov2, r1, r0};            end   // mov [R1] R0
                    6'd22 : begin ns = cs; user_inst_addr_next = 12'd53;  user_inst_write_next = {op_mov4, r2, r1};            end   // mov [R2] [R1]
                    6'd23 : begin ns = cs; user_inst_addr_next = 12'd54;  user_inst_write_next = {op_mov3, r1, r2};            end   // mov r1 [R2]
                    6'd24 : begin ns = cs; user_inst_addr_next = 12'd55;  user_inst_write_next = {op_mov1, r4, r0};            end   // mov r4 r0
                    6'd25 : begin ns = cs; user_inst_addr_next = 12'd56;  user_inst_write_next = {op_cmp,  r1, r4};            end   // cmp r1 r4
                    6'd26 : begin ns = cs; user_inst_addr_next = 12'd57;  user_inst_write_next = {op_je,   12'd59};            end   // je
                    6'd27 : begin ns = cs; user_inst_addr_next = 12'd58;  user_inst_write_next = {op_inc,  r5, dc};            end   // R5 = R5+1 (should be skipped)
                    6'd28 : begin ns = cs; user_inst_addr_next = 12'd59;  user_inst_write_next = {op_inc,  r5, dc};            end   // R5 = R5+1 (should be skipped)
                    6'd29 : begin ns = cs; user_inst_addr_next = 12'd60;  user_inst_write_next = {op_cmp,  r1, r2};            end   // cmp r1 r2
                    6'd30 : begin ns = cs; user_inst_addr_next = 12'd61;  user_inst_write_next = {op_jne,  12'd63};            end   // jne r1 r4
                    6'd31 : begin ns = cs; user_inst_addr_next = 12'd62;  user_inst_write_next = {op_inc,  r5, dc};            end   // R5 = R5+1 (should be skipped)
                    6'd32 : begin ns = cs; user_inst_addr_next = 12'd63;  user_inst_write_next = {op_inc,  r5, dc};            end   // R5 = R5+1 (should be skipped)
                    6'd33 : begin ns = 3;  user_inst_addr_next = 12'd64;  user_inst_write_next = {op_halt, 6'b110000, 6'b110000};end   // halt
                endcase
                end
            3'b011: begin
                ap_start = 1;
                user_inst_addr = 0;
                user_inst_write = 0;
                ns = 4;
                cnt_next = 0;
                end
            4'b100: ns=cs; // gets locked here until reset
        endcase
    end
endmodule
