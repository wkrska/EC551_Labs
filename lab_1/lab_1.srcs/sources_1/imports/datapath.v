`timescale 1ns / 1ps

module datapath(

);
    reg [31:0] RM_IFID, RN_IFID;
    reg [31:0] RM_IDEX, RN_IDEX;
    reg [31:0] RM_EXMEM, RN_EXMEM;
    reg [31:0] RM_MEMWB, RN_MEMRB;

    // IF stage

    // ID stage
    decoder decoder_0(

    );

    register_file rf_0(

    );

    // EX stage
    ALU alu_0(

    );

    // Mem stage
    memory mem_0(

    );
    

endmodule