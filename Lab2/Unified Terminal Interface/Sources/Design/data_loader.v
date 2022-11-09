`timescale 1ns / 1ps

`include "my_header.vh"

module data_loader(
    input wire clk,
    inpur wire rst,
    input wire [2:0] mode, // 0=I, 1=L, 2=A, 3=B
    input wire wen_mode,
    input wire [7:0] key,
    input wire wen_key,
    input wire run, // pulsed when 'r' is hit in mode 1,2
    output reg [11:0] user_inst_addr,
    output reg [15:0] user_inst_write
)

wire [3:0] trans_key;
// abridged LUT from key to hex
always @(key) begin
    case(key) // 0X is number, 1X is char
        8'h45 : assign trans_key = 5'h00;
        8'h16 : assign trans_key = 5'h01;
        8'h1e : assign trans_key = 5'h02;
        8'h26 : assign trans_key = 5'h03;
        8'h25 : assign trans_key = 5'h04;
        8'h2e : assign trans_key = 5'h05;
        8'h36 : assign trans_key = 5'h06;
        8'h3d : assign trans_key = 5'h07;
        8'h3e : assign trans_key = 5'h08;
        8'h46 : assign trans_key = 5'h09;
        8'h1c : assign trans_key = 5'h0a;
        8'h32 : assign trans_key = 5'h0b;
        8'h21 : assign trans_key = 5'h0c;
        8'h23 : assign trans_key = 5'h0d;
        8'h24 : assign trans_key = 5'h0e;
        8'h2b : assign trans_key = 5'h0f;
        8'h29 : assign trans_key = 5'h10; // [space]
        8'h5a : assign trans_key = 5'h11; // [newline]
        8'h12 : assign trans_key = 5'h12; // [L shift]
        8'h59 : assign trans_key = 5'h13; // [R shift]
        8'h36 : assign trans_key = 5'h14; // ^ (6)
        8'h55 : assign trans_key = 5'h15; // +
        8'h4e : assign trans_key = 5'h16; // -
        8'h3e : assign trans_key = 5'h17; // * (8) custom function
        default: assign trans_key = 5'h18; // D/C
    endcase
end

//----------- control FSM ----------//
reg [2:0] curr_state, next_state;

reg [3:0] count_c,count_n;
// Inst write
reg [`dwidth_dat-1:0] inst_in;
reg [`awidth_mem-1:0] inst_addr;
reg ap_start_c,ap_start_n;
// ALU
reg [1:0] ALU_mode_c,ALU_mode_n;
reg [`dwidth_dat_user-1:0] alu_a,alu_b;
reg result_ready_c,result_ready_n;
// Benchmark
reg [`dwidth_mat*3*3-1:0] mat_a, mat_b;
//states
localparam [7:0]    IDLE=8'h00,
                    I_c0=8'h10, // first char entered, or run
                    I_c1=8'h11, // second char
                    I_c2=8'h12, // third char
                    I_c3=8'h13, // fourth char
                    I_wb=8'h14, // write inst on enter
                    A_c0=8'h30, // First operand
                    A_c1=8'h31, // Operator
                    A_c2=8'h32, // Seond operand
                    A_wb=8'h33, // wb result
                    B_ma=8'h40, // loop until count, writing to first mat
                    B_mb=8'h41, // loop until connt, writing to second mat
                    B_wb=8'h42; // wb result
                    
always @(posedge clk) begin
    if (rst) begin
        curr_state <= 0;
        count_c <= 0;
        ap_start_c <= 0;
        ALU_mode_c <= 0;
        result_ready_c <= 0;
    end else begin
        curr_state <= next_state;
        count_c <= count_n;
        ap_start_c <= ap_start_n;
        ALU_mode_c <= ALU_mode_n;
        result_ready_c <= result_ready_n;
    end
end

always @(*) begin
    case(curr_state)
        IDLE: begin
            case(mode)
                3'd0 : next_state = IDLE;
                3'd1 : next_state = I_c0;
                // 3'd2 : next_state = I_c0;
                3'd3 : next_state = A_c0;
                3'd4 : next_state = B_ma;
                default: next_state = IDLE;
            endcase
            count_n = 'b0;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            result_ready_n = 'b0;
        end
        I_c0: begin
            
        end
        I_c1: begin

        end
        I_c2: begin

        end
        I_c3: begin

        end
        I_wb: begin

        end
        A_c0: begin

        end
        A_c1: begin

        end
        A_c2: begin

        end
        A_wb: begin

        end
        B_ma: begin

        end
        B_mb: begin

        end
        B_wb: begin

        end

endmodule