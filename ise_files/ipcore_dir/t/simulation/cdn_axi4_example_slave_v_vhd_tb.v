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
// File name: cdn_axi4_slave_bfm_top.v
//
// Description: Verilog wrapper for Cadence's "cdn_axi4_slave_bfm" module.
//
//
//-----------------------------------------------------------------------------

`timescale 1ps/1ps
// AMBA AXI 4 Range Constants
`define MAX_BURST_LENGTH 8'b1111_1111
`define MAX_DATA_SIZE (DATA_BUS_WIDTH*(`MAX_BURST_LENGTH+1))/8
// Burst Type Defines
`define BURST_TYPE_FIXED 2'b00
`define BURST_TYPE_INCR  2'b01
`define BURST_TYPE_WRAP  2'b10

// Burst Size Defines
`define BURST_SIZE_1_BYTE    3'b000
`define BURST_SIZE_2_BYTES   3'b001
`define BURST_SIZE_4_BYTES   3'b010
`define BURST_SIZE_8_BYTES   3'b011
`define BURST_SIZE_16_BYTES  3'b100
`define BURST_SIZE_32_BYTES  3'b101
`define BURST_SIZE_64_BYTES  3'b110
`define BURST_SIZE_128_BYTES 3'b111

// Lock Type Defines
`define LOCK_TYPE_NORMAL    1'b0
`define LOCK_TYPE_EXCLUSIVE 1'b1

// Response Type Defines
`define RESPONSE_OKAY 2'b00
`define RESPONSE_EXOKAY 2'b01
`define RESPONSE_SLVERR 2'b10
`define RESPONSE_DECERR 2'b11

// AMBA AXI 4 Bus Size Constants
`define LENGTH_BUS_WIDTH 8
`define SIZE_BUS_WIDTH 3
`define BURST_BUS_WIDTH 2
`define LOCK_BUS_WIDTH 1
`define CACHE_BUS_WIDTH 4
`define PROT_BUS_WIDTH 3
`define RESP_BUS_WIDTH 2
`define QOS_BUS_WIDTH 4
`define REGION_BUS_WIDTH 4
  
// Required for test of WRAP and FIXED max bursts lengths
`define AXI3_MAX_BURST_LENGTH 8'b0000_1111

// Message defines
`define MSG_WARNING WARNING
`define MSG_INFO    INFO
`define MSG_ERROR   ERROR

// Define for intenal control value
`define ANY_ID_NEXT 100
`define IDVALID_TRUE  1'b1
`define IDVALID_FALSE 1'b0

//-----------------------------------------------------------------------------
// The AXI 4 Slave BFM Top Level Wrapper
//-----------------------------------------------------------------------------

module cdn_axi4_slave_bfm_wrap(S_AXI_ACLK, S_AXI_ARESETN, 
                               S_AXI_AWID, S_AXI_AWADDR, S_AXI_AWLEN, S_AXI_AWSIZE, S_AXI_AWBURST, S_AXI_AWLOCK, 
                               S_AXI_AWCACHE, S_AXI_AWPROT, S_AXI_AWREGION, S_AXI_AWQOS, S_AXI_AWUSER, 
                               S_AXI_AWVALID, S_AXI_AWREADY,
                               S_AXI_WDATA, S_AXI_WSTRB, S_AXI_WLAST, S_AXI_WUSER, S_AXI_WVALID, S_AXI_WREADY,
                               S_AXI_BID, S_AXI_BRESP, S_AXI_BVALID, S_AXI_BUSER, S_AXI_BREADY,
                               S_AXI_ARID, S_AXI_ARADDR, S_AXI_ARLEN, S_AXI_ARSIZE, S_AXI_ARBURST, S_AXI_ARLOCK,
                               S_AXI_ARCACHE, S_AXI_ARPROT, S_AXI_ARREGION, S_AXI_ARQOS, S_AXI_ARUSER, 
                               S_AXI_ARVALID, S_AXI_ARREADY,
                               S_AXI_RID, S_AXI_RDATA, S_AXI_RRESP, S_AXI_RLAST, S_AXI_RUSER, S_AXI_RVALID, S_AXI_RREADY,
                               WRITE_ID_TAG, WR_DATA,  READ_ID_TAG, RESP_DATA, WRITE_BURST_RES, READ_BURST_RES,
                               WRITE_BURST_RESP_CTRL, WRITE_BURST_RESP_CTRL_DONE,RESPONSE_TYPE,ERROR_VRESPONSE,
                               READ_BURST_RESP_CTRL, READ_BURST_RESP_CTRL_DONE,
                               WRITE_BURST_RES_DONE, READ_BURST_RES_DONE,SET_READ_BURST_DATA_TRANSFER_GAP, SET_READ_BURST_DATA_TRANSFER_GAP_DONE,
                               STESTBUSER, STESTDATASIZE, S_V_WUSER,S_V_RUSER,PENDING_TRANSACTIONS_COUNT,
                               SET_WRITE_RESPONSE_GAP, SET_READ_RESPONSE_GAP,GAP_DATA,READ_DATA_TRANSFER_COMPLETE,REPORT_STATUS,REPORT_STATUS_DONE,NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
                       );
//-----------------------------------------------------------------------------
parameter C_S_AXI_NAME = "SLAVE_0";
parameter C_S_AXI_DATA_WIDTH = 32;
parameter C_S_AXI_ADDR_WIDTH = 32;
parameter C_S_AXI_ID_WIDTH = 4;
parameter C_S_AXI_AWUSER_WIDTH = 1;
parameter C_S_AXI_ARUSER_WIDTH = 1;
parameter C_S_AXI_RUSER_WIDTH  = 1;
parameter C_S_AXI_WUSER_WIDTH  = 1;
parameter C_S_AXI_BUSER_WIDTH  = 1;
parameter C_INTERCONNECT_S_AXI_READ_ACCEPTANCE = 8;
parameter C_INTERCONNECT_S_AXI_WRITE_ACCEPTANCE = 8;
parameter C_S_AXI_MEMORY_MODEL_MODE = 0;
parameter C_S_AXI_EXCLUSIVE_ACCESS_SUPPORTED = 1;
parameter C_BASEADDR = 32'h00000000;
parameter C_HIGHADDR = 32'h00000000;
parameter C_S_AXI_SLAVE_MEM_SIZE = 4096 ; 

// Global Clock Input. All signals are sampled on the rising edge.
input wire S_AXI_ACLK;
// Global Reset Input. Active Low.
input wire S_AXI_ARESETN;

// Write Address Channel Signals.
input  wire [C_S_AXI_ID_WIDTH-1:0]	     S_AXI_AWID;    // Master Write address ID. 
input  wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_AWADDR;  // Master Write address. 
input  wire [7:0]	                       S_AXI_AWLEN;   // Master Burst length.
input  wire [2:0]	                       S_AXI_AWSIZE;  // Master Burst size.
input  wire [1:0]	                       S_AXI_AWBURST; // Master Burst type.
input  wire 	                           S_AXI_AWLOCK;  // Master Lock type.
input  wire [3:0]	                       S_AXI_AWCACHE; // Master Cache type.
input  wire [2:0]	                       S_AXI_AWPROT;  // Master Protection type.
input  wire [3:0]	                       S_AXI_AWREGION;// Master Region signals.
input  wire [3:0] 	                     S_AXI_AWQOS;   // Master QoS signals.
input  wire [C_S_AXI_AWUSER_WIDTH-1:0]   S_AXI_AWUSER;  // Master User defined signals.
input  wire				                       S_AXI_AWVALID; // Master Write address valid.
output wire				                       S_AXI_AWREADY; // Slave Write address ready.

// Write Data Channel Signals.
input  wire [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_WDATA;   // Master Write data.
input  wire [(C_S_AXI_DATA_WIDTH/8)-1:0] S_AXI_WSTRB;   // Master Write strobes.
input  wire				                       S_AXI_WLAST;   // Master Write last.
input  wire [C_S_AXI_WUSER_WIDTH-1:0]    S_AXI_WUSER;   // Master Write User defined signals.
input  wire				                       S_AXI_WVALID;  // Master Write valid.
output wire				                       S_AXI_WREADY;  // Slave Write ready.

// Write Response Channel Signals.
output wire [C_S_AXI_ID_WIDTH-1:0]	     S_AXI_BID;	   // Slave Response ID.
output wire [1:0]	                       S_AXI_BRESP;   // Slave Write response.
output wire				                       S_AXI_BVALID;  // Slave Write response valid. 
output wire [C_S_AXI_BUSER_WIDTH-1:0]    S_AXI_BUSER;   // Slave Write user defined signals.
input  wire				                       S_AXI_BREADY;  // Master Response ready.

// Read Address Channel Signals.
input  wire [C_S_AXI_ID_WIDTH-1:0]	     S_AXI_ARID;    // Master Read address ID.
input  wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_ARADDR;  // Master Read address.
input  wire [7:0]	                       S_AXI_ARLEN;   // Master Burst length.
input  wire [2:0]	                       S_AXI_ARSIZE;  // Master Burst size.
input  wire [1:0]	                       S_AXI_ARBURST; // Master Burst type.
input  wire 	                           S_AXI_ARLOCK;  // Master Lock type.
input  wire [3:0]	                       S_AXI_ARCACHE; // Master Cache type.
input  wire [2:0]	                       S_AXI_ARPROT;  // Master Protection type.
input  wire [3:0]	                       S_AXI_ARREGION;// Master Region signals.
input  wire [3:0] 	                     S_AXI_ARQOS;   // Master QoS signals.
input  wire [C_S_AXI_ARUSER_WIDTH-1:0]   S_AXI_ARUSER;  // Master User defined signals.
input  wire				                       S_AXI_ARVALID; // Master Read address valid.
output wire				                       S_AXI_ARREADY; // Slave Read address ready.
  
// Read Data Channel Signals.
output wire [C_S_AXI_ID_WIDTH-1:0]	     S_AXI_RID;	   // Slave Read ID tag. 
output wire [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_RDATA;   // Slave Read data.
output wire [1:0]	                       S_AXI_RRESP;   // Slave Read response.
output wire				                       S_AXI_RLAST;   // Slave Read last.
output wire [C_S_AXI_RUSER_WIDTH-1:0]    S_AXI_RUSER;   // Slave Read user defined signals.
output wire				                       S_AXI_RVALID;  // Slave Read valid.
input  wire 				                     S_AXI_RREADY;  // Master Read ready.

input  wire                                                        STESTBUSER;
output reg [(C_S_AXI_WUSER_WIDTH*(`MAX_BURST_LENGTH+1))-1:0]       S_V_WUSER ;
output reg                                                         STESTDATASIZE;
output reg [(C_S_AXI_DATA_WIDTH*(`MAX_BURST_LENGTH+1))-1:0]        WR_DATA ;
input  wire [3:0]                                                  WRITE_ID_TAG;
input  wire [3:0]                                                  READ_ID_TAG;
input  wire [1:0]                                                  RESPONSE_TYPE;
input  wire [(`RESP_BUS_WIDTH*(`MAX_BURST_LENGTH+1))-1:0]          ERROR_VRESPONSE;

input  wire [(C_S_AXI_DATA_WIDTH*(`MAX_BURST_LENGTH+1))-1:0]       RESP_DATA ;
input  wire                                                        WRITE_BURST_RES;
input  wire                                                        WRITE_BURST_RESP_CTRL;
output reg                                                         WRITE_BURST_RESP_CTRL_DONE;
input  wire                                                        READ_BURST_RESP_CTRL;
output reg                                                         READ_BURST_RESP_CTRL_DONE;
input  wire                                                        READ_BURST_RES;
input  wire                                                        SET_READ_BURST_DATA_TRANSFER_GAP;
output reg                                                         SET_READ_BURST_DATA_TRANSFER_GAP_DONE;
input  wire                                                        SET_WRITE_RESPONSE_GAP;
input  wire                                                        SET_READ_RESPONSE_GAP;
output reg                                                         WRITE_BURST_RES_DONE;
output reg                                                         READ_BURST_RES_DONE;
input  wire [7:0]                                                  GAP_DATA;
input  wire [(C_S_AXI_RUSER_WIDTH*(`MAX_BURST_LENGTH+1))-1:0]      S_V_RUSER;
output reg                                                         READ_DATA_TRANSFER_COMPLETE ;
reg reset_done;
output reg [3:0]  PENDING_TRANSACTIONS_COUNT;
input                                                       REPORT_STATUS;
output reg                                                  REPORT_STATUS_DONE;
output reg                                                  NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING;

cdn_axi4_slave_bfm #(.NAME(C_S_AXI_NAME),
   		               .DATA_BUS_WIDTH(C_S_AXI_DATA_WIDTH),
                     .ADDRESS_BUS_WIDTH(C_S_AXI_ADDR_WIDTH),
                     .ID_BUS_WIDTH(C_S_AXI_ID_WIDTH),
                     .AWUSER_BUS_WIDTH(C_S_AXI_AWUSER_WIDTH),
                     .ARUSER_BUS_WIDTH(C_S_AXI_ARUSER_WIDTH),
                     .RUSER_BUS_WIDTH(C_S_AXI_RUSER_WIDTH), 
                     .WUSER_BUS_WIDTH(C_S_AXI_WUSER_WIDTH), 
                     .BUSER_BUS_WIDTH(C_S_AXI_BUSER_WIDTH), 
                     .SLAVE_ADDRESS(C_BASEADDR),
                     .SLAVE_MEM_SIZE(C_S_AXI_SLAVE_MEM_SIZE),
                     .MAX_OUTSTANDING_TRANSACTIONS(C_INTERCONNECT_S_AXI_READ_ACCEPTANCE),
                     .MEMORY_MODEL_MODE(C_S_AXI_MEMORY_MODEL_MODE),
                     .EXCLUSIVE_ACCESS_SUPPORTED(C_S_AXI_EXCLUSIVE_ACCESS_SUPPORTED)			  
                     ) 
cdn_axi4_slave_bfm_inst(.ACLK(S_AXI_ACLK), 
                        .ARESETn(S_AXI_ARESETN),
                        .AWID(S_AXI_AWID), 
                        .AWADDR(S_AXI_AWADDR), 
                        .AWLEN(S_AXI_AWLEN), 
                        .AWSIZE(S_AXI_AWSIZE), 
                        .AWBURST(S_AXI_AWBURST), 
                        .AWLOCK(S_AXI_AWLOCK), 
                        .AWCACHE(S_AXI_AWCACHE), 
                        .AWPROT(S_AXI_AWPROT), 
                        .AWREGION(S_AXI_AWREGION), 
                        .AWQOS(S_AXI_AWQOS), 
                        .AWUSER(S_AXI_AWUSER), 
                        .AWVALID(S_AXI_AWVALID), 
                        .AWREADY(S_AXI_AWREADY),
                        .WDATA(S_AXI_WDATA), 
                        .WSTRB(S_AXI_WSTRB), 
                        .WLAST(S_AXI_WLAST), 
                        .WUSER(S_AXI_WUSER), 
                        .WVALID(S_AXI_WVALID), 
                        .WREADY(S_AXI_WREADY),
                        .BID(S_AXI_BID), 
                        .BRESP(S_AXI_BRESP), 
                        .BVALID(S_AXI_BVALID), 
                        .BUSER(S_AXI_BUSER), 
                        .BREADY(S_AXI_BREADY),
                        .ARID(S_AXI_ARID), 
                        .ARADDR(S_AXI_ARADDR), 
                        .ARLEN(S_AXI_ARLEN), 
                        .ARSIZE(S_AXI_ARSIZE), 
                        .ARBURST(S_AXI_ARBURST), 
                        .ARLOCK(S_AXI_ARLOCK),
                        .ARCACHE(S_AXI_ARCACHE), 
                        .ARPROT(S_AXI_ARPROT), 
                        .ARREGION(S_AXI_ARREGION), 
                        .ARQOS(S_AXI_ARQOS), 
                        .ARUSER(S_AXI_ARUSER), 
                        .ARVALID(S_AXI_ARVALID), 
                        .ARREADY(S_AXI_ARREADY),
                        .RID(S_AXI_RID), 
                        .RDATA(S_AXI_RDATA), 
                        .RRESP(S_AXI_RRESP), 
                        .RLAST(S_AXI_RLAST), 
                        .RUSER(S_AXI_RUSER), 
                        .RVALID(S_AXI_RVALID), 
                        .RREADY(S_AXI_RREADY)
                        );

 initial begin
      reset_done = 0;
      // Wait for end of reset
      wait(S_AXI_ARESETN === 0) @(posedge S_AXI_ACLK);
      wait(S_AXI_ARESETN === 1) @(posedge S_AXI_ACLK);
      reset_done = 1;
      WRITE_BURST_RES_DONE = 0 ; READ_BURST_RES_DONE = 0;
      $display("=============== SLAVE RESET DONE === "); 
      $monitor ("(%0t) :::: (SLAVE) :: Value for Write or Read burst have changed Write = %0d and Read=%0d",$time,WRITE_BURST_RES,READ_BURST_RES);

  end
  
  always @(posedge S_AXI_ACLK) begin
          if(REPORT_STATUS == 1 && reset_done == 1)  begin
                  NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING = cdn_axi4_slave_bfm_inst.report_status(0);
                  REPORT_STATUS_DONE = 1;
          end
  end

  always @(posedge S_AXI_ACLK) begin
      
         
      if(WRITE_BURST_RES == 1 && reset_done == 1 ) begin
                WRITE_BURST_RES_DONE = 0 ;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (WRITE BURST RESPONDE ) for SLAVE ID = %0d:",WRITE_ID_TAG);
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");   
                cdn_axi4_slave_bfm_inst.WRITE_BURST_RESPOND(WRITE_ID_TAG,STESTBUSER,WR_DATA,STESTDATASIZE,S_V_WUSER);
                $display("EXAMPLE TEST : SLAVE WRITE DATA = 0x%h",WR_DATA);
                WRITE_BURST_RES_DONE = 1;
      end
      
      if(READ_BURST_RES == 1 && reset_done == 1 ) begin
                READ_BURST_RES_DONE = 0 ;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (READ BURST RESPONDE ) for SLAVE ID = %0d:",READ_ID_TAG);
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");   
              cdn_axi4_slave_bfm_inst.READ_BURST_RESPOND(READ_ID_TAG,
                                                         RESP_DATA,
                                                         S_V_RUSER);

              $display("EXAMPLE TEST : SLAVE RESP DATA = 0x%h",RESP_DATA);
                READ_BURST_RES_DONE = 1 ;
      end
      
      if(SET_READ_BURST_DATA_TRANSFER_GAP == 1 && reset_done == 1 ) begin
              SET_READ_BURST_DATA_TRANSFER_GAP_DONE = 0;
              cdn_axi4_slave_bfm_inst.set_read_burst_data_transfer_gap(GAP_DATA);
              SET_READ_BURST_DATA_TRANSFER_GAP_DONE = 1;
      end

      if (SET_READ_RESPONSE_GAP == 1) begin
              cdn_axi4_slave_bfm_inst.set_read_response_gap(GAP_DATA);
      end

      if(SET_WRITE_RESPONSE_GAP == 1) begin
              cdn_axi4_slave_bfm_inst.set_write_response_gap(GAP_DATA);
      end

      end
always @(posedge S_AXI_ACLK) begin
         PENDING_TRANSACTIONS_COUNT  = cdn_axi4_slave_bfm_inst.pending_transactions_count;
end
always @(posedge S_AXI_ACLK) begin
         @(cdn_axi4_slave_bfm_inst.read_data_transfer_complete);
         READ_DATA_TRANSFER_COMPLETE = 1;
         $display("(SLAVE) : READ_DATA_TRANSFER_COMPLETE EVENT occured =%0h",GAP_DATA); 
 end
 
 always @(posedge S_AXI_ACLK) begin
      if(WRITE_BURST_RESP_CTRL == 1 && reset_done == 1 ) begin
                WRITE_BURST_RESP_CTRL_DONE = 0 ;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (WRITE_BURST_RESP_CTRL) for SLAVE ID = %0d:",WRITE_ID_TAG);
                $display("---------------------------------------------------------");   
                cdn_axi4_slave_bfm_inst.WRITE_BURST_RESP_CTRL(WRITE_ID_TAG,
                                                              RESPONSE_TYPE,
                                                              STESTBUSER,
                                                              WR_DATA,
                                                              STESTDATASIZE,
                                                              S_V_WUSER);
                $display("EXAMPLE TEST : SLAVE WRITE DATA = 0x%h",WR_DATA);
                WRITE_BURST_RESP_CTRL_DONE = 1 ;
      end
end
 always @(posedge S_AXI_ACLK) begin
      if(READ_BURST_RESP_CTRL == 1 && reset_done == 1 ) begin
                READ_BURST_RESP_CTRL_DONE = 0 ;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (READ_BURST_RESP_CTRL) for SLAVE ID = %0d:",READ_ID_TAG);
                $display("---------------------------------------------------------");   
                cdn_axi4_slave_bfm_inst.READ_BURST_RESP_CTRL(READ_ID_TAG,
                                                             WR_DATA,
                                                             ERROR_VRESPONSE,
                                                             S_V_RUSER);
                $display("EXAMPLE TEST : SLAVE WRITE DATA = 0x%h",WR_DATA);
                READ_BURST_RESP_CTRL_DONE = 1 ;
      end
end

endmodule

