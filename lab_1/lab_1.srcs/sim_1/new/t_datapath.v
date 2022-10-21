`timescale 1ns / 1ps
`include "my_header.vh"

module t_datapath(

    );
    
    reg  clk;
    reg  rst;
    reg  [15:0] user_inst_write;
    reg  [11:0] user_inst_addr;
    reg  [5:0] disp_RS;
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
    
    // give regs names
    localparam r0 = 6'b000000;
    localparam r1 = 6'b000001;
    localparam r2 = 6'b000010;
    localparam r3 = 6'b000011;
    localparam r4 = 6'b000100;
    localparam r5 = 6'b000101;
    localparam dc = 6'b000000;
    
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
        #5 clk = ~clk;
        
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
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_jmp,  (user_inst_addr+12'd3)};   // jmp
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov2, r1, r0};               // mov [R1] R0
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov4, r2, r1};               // mov [R2] [R1]
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov3, r1, r2};               // mov r1 [R2]
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_mov1, r4, r0};               // mov r4 r0
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_cmp,  r1, r4};               // cmp r1 r4
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_je,   (user_inst_addr+12'd3)};   // je
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_cmp,  r1, r2};               // cmp r1 r2
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_jne,  (user_inst_addr+12'd3)};               // jne r1 r4
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_inc,  r5, dc};               // R5 = R5+1 (should be skipped)
        
        // Halt
        #10; user_inst_addr = user_inst_addr + 1; user_inst_write = {op_halt, 6'b000000, 6'b000000}; 
        
        // AP_start
        #10; ap_start = 1; #10 ap_start = 0;
        
        // Let Run
        #500;
        
        // Read registers
        for (i='b0; i<6; i=i+1) begin
            disp_RS = i; #10;
        end
        
        $finish;
    end
        
endmodule
