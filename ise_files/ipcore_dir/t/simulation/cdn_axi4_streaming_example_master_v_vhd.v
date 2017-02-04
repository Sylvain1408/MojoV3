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
// File name: cdn_axi4_streaming_master_bfm_wrapper.v
//
// Description: Verilog wrapper for Cadence's "cdn_axi4_streaming_master_bfm" module.
//  
//
//-----------------------------------------------------------------------------

`timescale 1ps/1ps

//-----------------------------------------------------------------------------
// The AXI4 Streaming Master BFM Top Level Wrapper
//-----------------------------------------------------------------------------

module cdn_axi4_streaming_master_bfm_wrap (M_AXIS_ACLK, M_AXIS_ARESETN,
                                           M_AXIS_TVALID, M_AXIS_TREADY, M_AXIS_TDATA, M_AXIS_TSTRB, 
                                           M_AXIS_TKEEP, M_AXIS_TLAST, M_AXIS_TID, M_AXIS_TDEST, M_AXIS_TUSER, 
                                           MTESTID, MTESTDEST,  MTESTDATA , MTESTSTRB,  MTESTKEEP, MTESTLAST, 
                                           MTESTUSER, MTESTDATASIZE, V_MTESTDATA, V_MTESTUSER,SET_PACKET_TRANSFER_GAP, GAP_DATA,
                                           SEND_TRANSFER ,SEND_PACKET ,SEND_TRANSFER_DONE, SEND_PACKET_DONE,
                                           REPORT_STATUS,REPORT_STATUS_DONE,NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING);
                                     
//-----------------------------------------------------------------------------

   parameter C_M_AXIS_NAME = "MASTER_0";
   parameter C_M_AXIS_TDATA_WIDTH = 32;
   parameter C_M_AXIS_TID_WIDTH   = 8;
   parameter C_M_AXIS_TDEST_WIDTH = 4;
   parameter C_M_AXIS_TUSER_WIDTH = 8;
   parameter C_M_AXIS_MAX_PACKET_SIZE = 10;
   parameter C_INTERCONNECT_M_AXIS_READ_ISSUING = 8;
   parameter C_INTERCONNECT_M_AXIS_WRITE_ISSUING = 8;
   parameter C_M_AXIS_STROBE_NOT_USED = 0;
   parameter C_M_AXIS_KEEP_NOT_USED = 0;
   parameter ID_BUS_WIDTH   = 8;
   parameter DEST_BUS_WIDTH = 4;
   parameter USER_BUS_WIDTH = 8;
   parameter MAX_PACKET_SIZE = 10;

//------------------------------------------------------------------------
// Signal Definitions
//------------------------------------------------------------------------

// Global Clock Input. All signals are sampled on the rising edge.
input wire M_AXIS_ACLK;

// Internal Clock created by delaying the input clock and used for sampling
// and driving input and output signals respectively to avoid race conditions.
//wire bfm_aclk;

// Global Reset Input. Active Low.
input wire M_AXIS_ARESETN;

// Transfer Channel Signals.
output wire                                M_AXIS_TVALID; // Master Transfer Valid.
input  wire                                M_AXIS_TREADY; // Slave Transfer Ready.
output wire [C_M_AXIS_TDATA_WIDTH-1:0]     M_AXIS_TDATA;  // Master Transfer Data. 
output wire [(C_M_AXIS_TDATA_WIDTH/8)-1:0] M_AXIS_TSTRB;  // Master Transfer Strobe. 
output wire [(C_M_AXIS_TDATA_WIDTH/8)-1:0] M_AXIS_TKEEP;  // Master Transfer Keep.
output wire                                M_AXIS_TLAST;  // Master Transfer Last Flag.
output wire [C_M_AXIS_TID_WIDTH-1:0]       M_AXIS_TID;    // Master Transfer ID Tag. 
output wire [C_M_AXIS_TDEST_WIDTH-1:0]     M_AXIS_TDEST;  // Master Transfer Destination. 
output wire [C_M_AXIS_TUSER_WIDTH-1:0]     M_AXIS_TUSER;  // Master Transfer User Defined. 

input wire  [ID_BUS_WIDTH-1:0]                                MTESTID;  
input wire  [DEST_BUS_WIDTH-1:0]                              MTESTDEST;
input wire  [C_M_AXIS_TDATA_WIDTH-1:0]                        MTESTDATA ;
input wire  [(C_M_AXIS_TDATA_WIDTH/8)-1:0]                    MTESTSTRB;
input wire  [(C_M_AXIS_TDATA_WIDTH/8)-1:0]                    MTESTKEEP;
input wire                                                    MTESTLAST;
input wire  [USER_BUS_WIDTH-1:0]                              MTESTUSER;
input wire  [C_M_AXIS_TUSER_WIDTH-1:0]                        MTESTDATASIZE;
input wire  [(C_M_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1:0]    V_MTESTDATA;
input wire  [(USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1:0]          V_MTESTUSER;
input wire                                                    SEND_TRANSFER;
input wire                                                    SEND_PACKET;
output reg                                                    SEND_TRANSFER_DONE;
output reg                                                    SEND_PACKET_DONE;
input wire                                                    SET_PACKET_TRANSFER_GAP;
input wire  [3:0]                                             GAP_DATA;
input                                         REPORT_STATUS;
output reg                                    REPORT_STATUS_DONE;
output reg                                    NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING;
reg reset_done;
 
cdn_axi4_streaming_master_bfm #(.NAME(C_M_AXIS_NAME),
                                .DATA_BUS_WIDTH(C_M_AXIS_TDATA_WIDTH),
                                .ID_BUS_WIDTH(C_M_AXIS_TID_WIDTH),
                                .DEST_BUS_WIDTH(C_M_AXIS_TDEST_WIDTH),
                                .USER_BUS_WIDTH(C_M_AXIS_TUSER_WIDTH),
                                .MAX_PACKET_SIZE(C_M_AXIS_MAX_PACKET_SIZE),
                                .MAX_OUTSTANDING_TRANSACTIONS(C_INTERCONNECT_M_AXIS_READ_ISSUING),
                                .STROBE_NOT_USED(C_M_AXIS_STROBE_NOT_USED),
                                .KEEP_NOT_USED(C_M_AXIS_KEEP_NOT_USED)
                        ) 
cdn_axi4_streaming_master_bfm_inst(.ACLK(M_AXIS_ACLK), 
                                   .ARESETn(M_AXIS_ARESETN), 
                                   .TVALID(M_AXIS_TVALID), 
                                   .TREADY(M_AXIS_TREADY), 
                                   .TDATA(M_AXIS_TDATA), 
                                   .TSTRB(M_AXIS_TSTRB),
                                   .TKEEP(M_AXIS_TKEEP), 
                                   .TLAST(M_AXIS_TLAST),
                                   .TID(M_AXIS_TID),
                                   .TDEST(M_AXIS_TDEST),
                                   .TUSER(M_AXIS_TUSER)
                              );   
                              
initial begin
      // Wait for end of reset
      cdn_axi4_streaming_master_bfm_inst.set_channel_level_info(1);

      wait(M_AXIS_ARESETN === 0) @(posedge M_AXIS_ACLK);
      wait(M_AXIS_ARESETN === 1) @(posedge M_AXIS_ACLK);
      reset_done = 1;
end

always @(posedge M_AXIS_ACLK) begin
        if(REPORT_STATUS == 1 && reset_done == 1)  begin
                NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING = cdn_axi4_streaming_master_bfm_inst.report_status(0);
                REPORT_STATUS_DONE = 1;
        end
end

always @(posedge M_AXIS_ACLK) begin
        if(SEND_TRANSFER == 1 && reset_done == 1)  begin
                SEND_TRANSFER_DONE = 0;
                $display("---------------------------------------------------------");
                $display("SEND_TRANSFER  for MASTER ID = %0d:",MTESTID);
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");      
                cdn_axi4_streaming_master_bfm_inst.SEND_TRANSFER(MTESTID,
                                                                 MTESTDEST,
                                                                 MTESTDATA,
                                                                 MTESTSTRB,
                                                                 MTESTKEEP,
                                                                 MTESTLAST,
                                                                 MTESTUSER);
                $display("EXAMPLE TEST : SEND_TRANSFER MASTER WRITE DATA = 0x%h",MTESTDATA);
                SEND_TRANSFER_DONE = 1;
          end
  end
always @(posedge M_AXIS_ACLK) begin
        if(SEND_PACKET == 1 && reset_done == 1)  begin
                SEND_PACKET_DONE = 0;
                $display("---------------------------------------------------------");
                $display("SEND_PACKET  for MASTER ID = %0d:",MTESTID);
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");      
                cdn_axi4_streaming_master_bfm_inst.SEND_PACKET(MTESTID,
                                                               MTESTDEST,
                                                               V_MTESTDATA,
                                                               MTESTDATASIZE,
                                                               V_MTESTUSER);
                $display("EXAMPLE TEST : SEND_PACKET MASTER WRITE DATA = 0x%h",V_MTESTDATA);
                SEND_PACKET_DONE = 1;
          end
  end
  
always @(posedge M_AXIS_ACLK) begin
        if(SET_PACKET_TRANSFER_GAP == 1 && reset_done == 1)  begin
                cdn_axi4_streaming_master_bfm_inst.set_packet_transfer_gap(GAP_DATA);
        end
end

endmodule			    
				    
				    
				    
				      
				    
				    

