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
    
    vga_fret active(.xoffset(activeOffset), .yoffset(180), .x(x), .y(y), .dispValOut(fa_wire));

    assign vga_r[3] = (frets & ~fa) | strings;
    assign vga_g[3] = frets | strings;
    assign vga_b[3] = (frets & ~fa) | strings;
    
endmodule