`timescale 1ns / 1ps

module ALU(
    input wire [3:0] op,
    input wire [15:0] din0, // rf_out_1
    input wire [15:0] din1, // rf_out_2
    input wire [5:0] Rm_in, // rf_out_2
    input wire [15:0] mem_in, // rf_out_2
    input wire [12:0] imm_in, // 12 bit imm
    output wire [15:0] dout,
    output wire jump, halt
    );

    reg cmp_flag, jump_t, halt_t;
    reg [15:0] dout_t;
    
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

    always @(*) begin
        // Assign dout value
        case (op)
            op_add : dout_t = din0+din1;          // add
            op_sub : dout_t = din0-din1;          // sub
            op_inc : dout_t = din0+32'b1;         // inc
            op_xor : dout_t = din0^din1;          // xor
            op_cmp : dout_t = 0;                  // cmp
            op_mov0: dout_t = {{10{1'b0}},Rm_in}; // mov Rn, num
            op_mov1: dout_t = din1;               // mov Rn, Rm
            op_mov2: dout_t = din1;               // mov [Rn], Rm
            op_mov3: dout_t = mem_in;             // mov Rn, [Rm]
            op_mov4: dout_t = mem_in;             // mov [Rn], [Rm]
            op_sad : dout_t = din0^din1;          // sadd
            op_jmp : dout_t = {{4{1'b0}},imm_in}; // jmp
            op_jne : dout_t = {{4{1'b0}},imm_in}; // jne
            op_je  : dout_t = {{4{1'b0}},imm_in}; // je
            op_nop : dout_t = 0;                  // nop
            op_halt: dout_t = 0;                  // halt
            default: dout_t = 0;                  // nop
        endcase
        
        // assign cmp flag only if cmp instr
        cmp_flag = (op == op_cmp) ? {16{(din0===din1)}} : cmp_flag;
        
        // assign halt flag
        halt_t = (op == op_halt) ? 1'b1 : 1'b0;
        
        // assign jump flag
        case (op)
            op_jmp: jump_t = 1'b1;                 // jmp
            op_jne: jump_t = !cmp_flag;            // jne
            op_je : jump_t = cmp_flag;             // je
            default: jump_t = 1'b0;                 // nop
        endcase
        
    end

    assign dout = dout_t;
    assign jump = jump_t;
    assign halt = halt_t;
    

endmodule
