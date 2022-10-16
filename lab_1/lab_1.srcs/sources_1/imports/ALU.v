`timescale 1ns / 1ps

module ALU(
    input wire [3:0] op,
    input wire [15:0] din0, // rf_out_1
    input wire [15:0] din1, // rf_out_2
    input wire [5:0] Rm_in, // rf_out_2
    input wire [15:0] mem_in, // rf_out_2
    input wire [12:0] imm_in, // 12 bit imm
    output wire [15:0] dout,
    output wire jump
    );

    reg cmp_flag, jump_t;
    reg [15:0] dout_t;
    
    always @(*) begin
        // Assign dout value
        case (op)
            4'b0101: dout_t = din0+din1;          // add
            4'b0110: dout_t = din0-din1;          // sub
            4'b0001: dout_t = din0+32'b1;         // inc
            4'b0111: dout_t = din0^din1;          // xor
            4'b1000: dout_t = 0;                  // cmp
            4'b1001: dout_t = {{10{1'b0}},Rm_in}; // mov Rn, num
            4'b1010: dout_t = din1;               // mov Rn, Rm
            4'b1011: dout_t = din1;               // mov [Rn], Rm
            4'b1100: dout_t = mem_in;             // mov Rn, [Rm]
            4'b1101: dout_t = mem_in;             // mov [Rn], [Rm]
            4'b1110: dout_t = din0^din1;          // sadd
            4'b0010: dout_t = {{4{1'b0}},imm_in}; // jmp
            4'b0011: dout_t = {{4{1'b0}},imm_in}; // jne
            4'b0100: dout_t = {{4{1'b0}},imm_in}; // je
            4'b1111: dout_t = 0;                  // nop
            4'b0000: dout_t = 0;                  // halt
            default: dout_t = 0;                  // nop
        endcase
        
        // assign cmp flag only if cmp instr
        cmp_flag = (op == 4'b1000) ? {16{(din0===din1)}} : cmp_flag;
        
        // assign jump flag
        case (op)
            4'b0010: jump_t = 1'b1;                 // jmp
            4'b0011: jump_t = !cmp_flag;            // jne
            4'b0100: jump_t = cmp_flag;             // je
            default: jump_t = 1'b0;                 // nop
        endcase
        
    end

    assign dout = dout_t;
    assign jump = jump_t;
    

endmodule
