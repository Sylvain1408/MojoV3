`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:56 05/13/2016 
// Design Name: 
// Module Name:    bitrate_converter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bitrate_converter(
    input clk,
    input rst,
    input rx,  // from mb_tx
    output [7:0] rx_data, // to avr
    output rx_new_data, // to avr
    input rx_block, // avr serial interface is busy
    output tx, // to mb_rx
    input tx_new_data, // from avr
    input [7:0] tx_data // from avr side
    );
   
wire from_mb_new_data;   
wire [7:0] from_mb_data;
reg rx_new_data;
reg [7:0] rx_data;
wire mb_tx_busy;
reg [7:0] mb_tx_data;
reg new_mb_tx_data;
   
// reads from MB at 9600, writes to avr interface
serial_rx  #(.CLK_PER_BIT(5208), .CTR_SIZE(16)) sc_rx (
   .clk(clk),
   .rst(rst),
   .rx(rx),
   .data(from_mb_data),
   .new_data(from_mb_new_data)
);

// reads from avr serial interface and sends it to the MB at 9600 bd
serial_tx #(.CLK_PER_BIT(5208), .CTR_SIZE(16)) sc_tx (
   .clk(clk),
   .rst(rst),
   .tx(tx),         // Serial transmitter -> mb_rx input
   .tx_block(1'b0), // never
   .busy(mb_tx_busy), // busy sending a char to mb
   .data(mb_tx_data),   // data to send (came from avr)
   .new_data(new_mb_tx_data)    // start sending to mb
);



// Serial mb->avr converter state machine

localparam SC_IDLE = 2'b00, SC_READ = 2'b01, SC_WRITE = 2'b10;

reg [1:0] scr_state = SC_IDLE;
reg [1:0] sct_state = SC_IDLE;

always @(posedge clk) begin
   if (rst || rx_block) begin
      scr_state <= SC_IDLE;
      rx_new_data <= 0;
      end else
      case (scr_state)
      
      SC_IDLE: begin
      if (from_mb_new_data) begin
         scr_state <= SC_READ;
         end
      end
      
      SC_READ: begin
         rx_data = from_mb_data;
         scr_state <= SC_WRITE;
      end
      
      SC_WRITE: begin
         rx_new_data <= 1;
         scr_state <= SC_IDLE;
         end
      endcase
end // scr state mc

// serial avr to mb uart state machine
// really needs buffering because there is no blocking of fast data from avr

always @(posedge clk) begin
   if (rst) begin
      sct_state <= SC_IDLE;
      new_mb_tx_data <= 0;
   end else

   case (sct_state)
      
      SC_IDLE: begin
      new_mb_tx_data <= 0;
      if (tx_new_data & ~mb_tx_busy) begin // new data from avr arrived
         sct_state <= SC_READ;
         end
      end
      
      SC_READ: begin
         mb_tx_data = tx_data;
         sct_state <= SC_WRITE;
      end
      
      SC_WRITE: begin
         new_mb_tx_data <= 1; // send it to mb
         sct_state <= SC_IDLE;
         end
   endcase
end // scr state mc

endmodule
