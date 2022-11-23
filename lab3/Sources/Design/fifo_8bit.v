`timescale 1ns / 1ps


module fifo_8bit #(parameter fifo_width=8,
                   parameter fifo_size=512) (
    input wire clk,
    input wire rst,
    input wire push,
    input wire pop,
    input wire [fifo_width-1:0] din,
    output reg [fifo_width-1:0] dout,
    output reg empty,
    output reg full
    );

    localparam dwidth_size = $clog2(fifo_size);
    reg [fifo_size-1:0] fifo_counter;
    
    reg [dwidth_size-1:0] rd_ptr, wr_ptr;
    // pointer to read and write addresses
    reg [fifo_width-1:0] buf_mem[fifo_size-1:0];
     //
    
    always @(*)
      begin
         empty = (fifo_counter==0);
            // Checking for whether buffer is empty or not
         full = (fifo_counter==fifo_size);
           //Checking for whether buffer is full or not
      end

   //Setting FIFO counter value for different situations of read and write operations.
   always @(posedge clk) begin
           if(rst)
             fifo_counter <= 0;
        // Reset the counter of FIFO
           else if((!full && push) && (!empty && pop))  //When doing read and write operation simultaneously
             fifo_counter <= fifo_counter;
        // At this state, counter value will remain same.
           else if(!full && push)// When doing only write operation
             fifo_counter <= fifo_counter + 1;
           else if(!empty && pop)//When doing only read operation
             fifo_counter <= fifo_counter - 1;
           else
             fifo_counter <= fifo_counter;
        // When doing nothing.
     end 

   always @(posedge clk) begin
           if(rst)
             dout <= 'b0;
           else
             begin
                 if(!empty)
                    dout <= buf_mem[rd_ptr];
                 else
                    dout <= 'b0;
             end 
     end

   always @(posedge clk)
     begin
           if(push && !full)
             buf_mem[wr_ptr] <= din;
           else
             buf_mem[wr_ptr] <= buf_mem[wr_ptr];
     end

   always @(posedge clk)
     begin
           if(rst)
             begin
                wr_ptr <= 0;
                rd_ptr <= 0;
             end
           else
             begin
                if(!full && push)
                   wr_ptr <= wr_ptr + 1;
                // On write operation, Write pointer points to next location
                else
                   wr_ptr <= wr_ptr;
                if(!empty && pop)
                   rd_ptr <= rd_ptr + 1;
                // On read operation, read pointer points to next location to be read
                else
                   rd_ptr <= rd_ptr;
             end 
     end
endmodule