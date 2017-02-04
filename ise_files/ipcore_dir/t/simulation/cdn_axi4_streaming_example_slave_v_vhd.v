// (c) Copyright 2011 - 2012 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.

//
// File name: cdn_axi4_streaming_slave_bfm_wrapper.v
//
// Description: Verilog wrapper for Cadence's "cdn_axi4_streaming_master_bfm" module.
//  
//
//-----------------------------------------------------------------------------

`timescale 1ps/1ps

//-----------------------------------------------------------------------------
// The AXI4 Streaming Slave BFM Top Level Wrapper
//-----------------------------------------------------------------------------

module cdn_axi4_streaming_slave_bfm_wrap (S_AXIS_ACLK, S_AXIS_ARESETN,
                                           S_AXIS_TVALID, S_AXIS_TREADY, S_AXIS_TDATA, S_AXIS_TSTRB, 
                                           S_AXIS_TKEEP, S_AXIS_TLAST, S_AXIS_TID, S_AXIS_TDEST, S_AXIS_TUSER,
                                           STESTID, PID, STESTDEST, PDEST, STESTDATA , STESTSTRB, STESTKEEP,
                                           STESTLAST, STESTUSER, STESTDATASIZE,  V_STESTDATA, V_STESTUSER,IDVALID,DESTVALID,
                                           RECEIVE_TRANSFER,  RECEIVE_TRANSFER_DONE,  RECEIVE_PACKET,  RECEIVE_PACKET_DONE,
                                           REPORT_STATUS,REPORT_STATUS_DONE,NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING);
                                      
//-----------------------------------------------------------------------------

   parameter C_S_AXIS_NAME = "MASTER_0";
   parameter C_S_AXIS_TDATA_WIDTH = 32;
   parameter C_S_AXIS_TID_WIDTH   = 8;
   parameter C_S_AXIS_TDEST_WIDTH = 4;
   parameter C_S_AXIS_TUSER_WIDTH = 8;
   parameter C_S_AXIS_MAX_PACKET_SIZE = 10;
   parameter C_INTERCONNECT_S_AXIS_READ_ACCEPTANCE = 8;
   parameter C_INTERCONNECT_S_AXIS_WRITE_ACCEPTANCE = 8;
   parameter C_S_AXIS_STROBE_NOT_USED = 0;
   parameter C_S_AXIS_KEEP_NOT_USED = 0;
   parameter ID_BUS_WIDTH   = 8;
   parameter DEST_BUS_WIDTH = 4;
   parameter USER_BUS_WIDTH = 8;
   parameter MAX_PACKET_SIZE = 10;

//------------------------------------------------------------------------
// Signal Definitions
//------------------------------------------------------------------------

// Global Clock Input. All signals are sampled on the rising edge.
input wire S_AXIS_ACLK;

// Internal Clock created by delaying the input clock and used for sampling
// and driving input and output signals respectively to avoid race conditions.
//wire bfm_aclk;

// Global Reset Input. Active Low.
input wire S_AXIS_ARESETN;

// Transfer Channel Signals.
input  wire                                    S_AXIS_TVALID; // Master Transfer Valid.
output wire                                    S_AXIS_TREADY; // Slave  Transfer Ready.
input  wire [C_S_AXIS_TDATA_WIDTH-1:0]     S_AXIS_TDATA;  // Master Transfer Data. 
input  wire [(C_S_AXIS_TDATA_WIDTH/8)-1:0] S_AXIS_TSTRB;  // Master Transfer Strobe. 
input  wire [(C_S_AXIS_TDATA_WIDTH/8)-1:0] S_AXIS_TKEEP;  // Master Transfer Keep.
input  wire                                    S_AXIS_TLAST;  // Master Transfer Last Flag.
input  wire [C_S_AXIS_TID_WIDTH-1:0]       S_AXIS_TID;    // Master Transfer ID Tag. 
input  wire [C_S_AXIS_TDEST_WIDTH-1:0]     S_AXIS_TDEST;  // Master Transfer Destination. 
input  wire [C_S_AXIS_TUSER_WIDTH-1:0]     S_AXIS_TUSER;  // Master Transfer User Defined. 

input wire [ID_BUS_WIDTH-1:0]                               STESTID;  
input wire [DEST_BUS_WIDTH-1:0]                             STESTDEST;

output reg [ID_BUS_WIDTH-1:0]                               PID;  
output reg [DEST_BUS_WIDTH-1:0]                             PDEST;
output reg [C_S_AXIS_TDATA_WIDTH-1:0]                       STESTDATA ;
output reg [(C_S_AXIS_TDATA_WIDTH/8)-1:0]                   STESTSTRB;
output reg [(C_S_AXIS_TDATA_WIDTH/8)-1:0]                   STESTKEEP;
output reg                                                  STESTLAST;
output reg [USER_BUS_WIDTH-1:0]                             STESTUSER;
output reg [C_S_AXIS_TUSER_WIDTH-1:0]                       STESTDATASIZE;
output reg [(C_S_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1:0]   V_STESTDATA;
output reg [(USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1:0]         V_STESTUSER;
input wire                                                  RECEIVE_TRANSFER;
output reg                                                  RECEIVE_TRANSFER_DONE;
input wire                                                  RECEIVE_PACKET;
output reg                                                  RECEIVE_PACKET_DONE;
input wire                                                  IDVALID;
input wire                                                  DESTVALID;
input                                         REPORT_STATUS;
output reg                                    REPORT_STATUS_DONE;
output reg                                    NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING;
reg                                                         reset_done;
 
cdn_axi4_streaming_slave_bfm #(.NAME(C_S_AXIS_NAME),
                               .DATA_BUS_WIDTH(C_S_AXIS_TDATA_WIDTH),
                               .ID_BUS_WIDTH(C_S_AXIS_TID_WIDTH),
                               .DEST_BUS_WIDTH(C_S_AXIS_TDEST_WIDTH),
                               .USER_BUS_WIDTH(C_S_AXIS_TUSER_WIDTH),
                               .MAX_PACKET_SIZE(C_S_AXIS_MAX_PACKET_SIZE),
                               .MAX_OUTSTANDING_TRANSACTIONS(C_INTERCONNECT_S_AXIS_READ_ACCEPTANCE),
                               .STROBE_NOT_USED(C_S_AXIS_STROBE_NOT_USED),
                               .KEEP_NOT_USED(C_S_AXIS_KEEP_NOT_USED)
                              ) 
cdn_axi4_streaming_slave_bfm_inst(.ACLK(S_AXIS_ACLK), 
                                  .ARESETn(S_AXIS_ARESETN), 
                                  .TVALID(S_AXIS_TVALID), 
                                  .TREADY(S_AXIS_TREADY), 
                                  .TDATA(S_AXIS_TDATA), 
                                  .TSTRB(S_AXIS_TSTRB),
                                  .TKEEP(S_AXIS_TKEEP), 
                                  .TLAST(S_AXIS_TLAST),
                                  .TID(S_AXIS_TID),
                                  .TDEST(S_AXIS_TDEST),
                                  .TUSER(S_AXIS_TUSER)
                                 );   
initial begin
      // Wait for end of reset
      cdn_axi4_streaming_slave_bfm_inst.set_channel_level_info(1);

      wait(S_AXIS_ARESETN === 0) @(posedge S_AXIS_ACLK);
      wait(S_AXIS_ARESETN === 1) @(posedge S_AXIS_ACLK);
      reset_done = 1;
end

always @(posedge S_AXIS_ACLK) begin
        if(REPORT_STATUS == 1 && reset_done == 1)  begin
                NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING = cdn_axi4_streaming_slave_bfm_inst.report_status(0);
                REPORT_STATUS_DONE = 1;
        end
end
always @(posedge S_AXIS_ACLK) begin
        if(RECEIVE_TRANSFER == 1 && reset_done == 1)  begin
                RECEIVE_TRANSFER_DONE = 0;
                $display("---------------------------------------------------------");
                $display("RECEIVE_TRANSFER  for SLAVE = %0d:",STESTID);
                $display("---------------------------------------------------------");      
                cdn_axi4_streaming_slave_bfm_inst.RECEIVE_TRANSFER(STESTID,
                                                                   IDVALID,
                                                                   STESTDEST,
                                                                   DESTVALID,
                                                                   PID,
                                                                   PDEST,
                                                                   STESTDATA,
                                                                   STESTSTRB,
                                                                   STESTKEEP,
                                                                   STESTLAST,
                                                                   STESTUSER);
                
                $display("EXAMPLE TEST : SEND_TRANSFER SLAVE WRITE DATA = 0x%h",STESTDATA);
                RECEIVE_TRANSFER_DONE = 1;
          end
  end
always @(posedge S_AXIS_ACLK) begin
        if(RECEIVE_PACKET == 1 && reset_done == 1)  begin
                RECEIVE_PACKET_DONE = 0;
                $display("---------------------------------------------------------");
                $display("RECEIVE_PACKET  for SLAVE ID = %0d:",STESTID);
                $display("---------------------------------------------------------");      
                cdn_axi4_streaming_slave_bfm_inst.RECEIVE_PACKET(STESTID,
                                                                 IDVALID,
                                                                 STESTDEST,
                                                                 DESTVALID,
                                                                 PID,
                                                                 PDEST,
                                                                 V_STESTDATA,
                                                                 STESTDATASIZE,
                                                                 V_STESTUSER);
                $display("EXAMPLE TEST : RECEIVE_PACKET SLAVE WRITE DATA = 0x%h",V_STESTDATA);
                RECEIVE_PACKET_DONE = 1;
          end
  end
                                 
endmodule			    
				    
				    
				    
				      
				    
				    

