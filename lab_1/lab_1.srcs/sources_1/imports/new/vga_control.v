`timescale 1ns / 1ps

module vga_control(
    input wire clk, reset, 
    input wire [15:0] switches,
    input wire [3:0] buttons,
    output wire hsync, vsync,
    output wire [3:0] vga_r, vga_g, vga_b
);
wire [9:0] x, y;
// register for Basys 2 8-bit RGB DAC

// video status output from vga_sync to tell when to route out rgb signal to DAC
wire video_on;

    // instantiate vga_sync
    vga_sync vga_sync_unit (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
                            .video_on(video_on), .p_tick(), .x(x), .y(y));
   
    
    // Create active fret
    reg [9:0] activeOffset;
    
    // Postion active fret based on input
    always @ (clk) begin
        case (switches)
            16'b0000000000000000 : activeOffset = 10'd0;
            16'b0000000000000001 : activeOffset = 10'd45;
            16'b0000000000000010 : activeOffset = 10'd88;
            16'b0000000000000100 : activeOffset = 10'd131;
            16'b0000000000001000 : activeOffset = 10'd169;
            16'b0000000000010000 : activeOffset = 10'd206;
            16'b0000000000100000 : activeOffset = 10'd242;
            16'b0000000001000000 : activeOffset = 10'd275;
            16'b0000000010000000 : activeOffset = 10'd306;
            16'b0000000100000000 : activeOffset = 10'd335;
            16'b0000001000000000 : activeOffset = 10'd364;
            16'b0000010000000000 : activeOffset = 10'd390;
            16'b0000100000000000 : activeOffset = 10'd415;
            16'b0001000000000000 : activeOffset = 10'd439;
            16'b0010000000000000 : activeOffset = 10'd460;
            16'b0100000000000000 : activeOffset = 10'd481;
            16'b1000000000000000 : activeOffset = 10'd500;
            default : activeOffset = 10'd0;
        endcase
    end
    
    vga_fret active(.xoffset(activeOffset), .yoffset(180), .x(x), .y(y), .dispValOut(fa_wire));
    
        
    // Continuously capture value from frets
    reg f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, fa;
    always @ (clk) begin
        f0 = f0_wire;
        f1 = f1_wire;
        f2 = f2_wire;
        f3 = f3_wire;
        f4 = f4_wire;
        f5 = f5_wire;
        f6 = f6_wire;
        f7 = f7_wire;
        f8 = f8_wire;
        f9 = f9_wire;
        f10 = f10_wire;
        f11 = f11_wire;
        f12 = f12_wire;
        f13 = f13_wire;
        f14 = f14_wire;
        f15 = f15_wire;
        fa = fa_wire;
    end
    
    // Create string modules;
    wire s0_wire, s1_wire, s2_wire, s3_wire;
    vga_string vs0(.yoffset(195), .x(x), .y(y), .reset(reset), .clk(clk), .vibrate(buttons[0]), .dispValOut(s0_wire));
    vga_string vs1(.yoffset(235), .x(x), .y(y), .reset(reset), .clk(clk), .vibrate(buttons[1]), .dispValOut(s1_wire));
    vga_string vs2(.yoffset(275), .x(x), .y(y), .reset(reset), .clk(clk), .vibrate(buttons[2]), .dispValOut(s2_wire));
    vga_string vs3(.yoffset(315), .x(x), .y(y), .reset(reset), .clk(clk), .vibrate(buttons[3]), .dispValOut(s3_wire));

    // Continuously capture string value
    reg s0, s1, s2, s3;
    always @ (clk) begin
       s0 = s0_wire;
       s1 = s1_wire;
       s2 = s2_wire;
       s3 = s3_wire;
    end
        
    wire frets = f0 | f1 | f2 | f3 | f4 | f5 | f6 | f7 | f8 | f9 | f10 | f11 | f12 | f13 | f14 | f15;
    wire strings = s0 | s1 | s2 | s3;
    
    assign vga_r[3] = (frets & ~fa) | strings;
    assign vga_g[3] = frets | strings;
    assign vga_b[3] = (frets & ~fa) | strings;
    assign vga_g[2] = fa;
    assign vga_g[1] = fa;
    assign vga_g[0] = fa;
    
endmodule