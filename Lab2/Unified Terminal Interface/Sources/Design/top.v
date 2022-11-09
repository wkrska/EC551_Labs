`timescale 1ns / 1ps

module top(
    input wire CLK100MHZ, rst, resume_btn,
    input wire [5:0] switch_RS,
    output wire [3:0] VGA_R,
    output wire [3:0] VGA_G,
    output wire [3:0] VGA_B,
    output wire VGA_HS,
    output wire VGA_VS,
    output wire [15:0] LED
);

reg [26:0] counter=0;
reg slow_clk;
always @(posedge CLK100MHZ)
begin
    counter <= (counter>=((`clk_div*200)*2-1)) ? 0 : counter+1;
    slow_clk <= (counter < (`clk_div*200)) ? 1'b0 : 1'b1;
end

wire [`dwidth_dat*6-1:0] register_data;
wire ap_start_ROM;
wire [11:0] user_inst_addr_ROM;
wire [15:0] user_inst_write_ROM;
wire resume,halt;

btn_edge btn(
    .reset(rst),
    .btnIn(resume_btn),
    .CLK(CLK100MHZ),
    .btnOut(resume)
    );

datapath dp1(
//    .clk(CLK100MHZ),
    .clk(slow_clk),
    .rst(rst),
//    .resume(resume),
    .resume(resume_btn),
    .user_inst_write(user_inst_write_ROM),
    .user_inst_addr(user_inst_addr_ROM),
    // .disp_RS(switch_RS),
    .ap_start(ap_start_ROM),
    .rf_out(register_data),
    .disp_inst(LED),
    .halt(halt)
    );
    
inst_ROM  ROM1(
//    .clk(CLK100MHZ),
    .clk(slow_clk),
    .rst(rst),
    .ap_start(ap_start_ROM),
    .user_inst_addr(user_inst_addr_ROM),
    .user_inst_write(user_inst_write_ROM)
    );
    
// top_VGA  VGA1(
//     .reg_value(register_data),
//     .CLK100MHZ(CLK100MHZ),
//     .rst(rst),
//     .VGA_R(VGA_R),
//     .VGA_G(VGA_G),
//     .VGA_B(VGA_B),
//     .VGA_HS(VGA_HS),
//     .VGA_VS(VGA_VS)
//     );


endmodule
