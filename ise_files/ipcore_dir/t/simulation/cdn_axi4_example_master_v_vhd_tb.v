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
// File name: cdn_axi4_master_bfm_wrap.v
//
// Description: Verilog wrapper for Cadence's "cdn_axi4_master_bfm" module.
//
//
//-----------------------------------------------------------------------------

`timescale 1ps/1ps
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
  
// AMBA AXI 4 Range Constants
`define MAX_BURST_LENGTH 8'b1111_1111
`define MAX_DATA_SIZE (DATA_BUS_WIDTH*(`MAX_BURST_LENGTH+1))/8

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
// The AXI 4 Master BFM Top Level Wrapper
//-----------------------------------------------------------------------------

module cdn_axi4_master_bfm_wrap (M_AXI_ACLK, M_AXI_ARESETN, 
                                 M_AXI_AWID, M_AXI_AWADDR, M_AXI_AWLEN, M_AXI_AWSIZE, M_AXI_AWBURST, M_AXI_AWLOCK, 
                                 M_AXI_AWCACHE, M_AXI_AWPROT, M_AXI_AWREGION, M_AXI_AWQOS, M_AXI_AWUSER, 
                                 M_AXI_AWVALID, M_AXI_AWREADY,
                                 M_AXI_WDATA, M_AXI_WSTRB, M_AXI_WLAST, M_AXI_WUSER, M_AXI_WVALID, M_AXI_WREADY,
                                 M_AXI_BID, M_AXI_BRESP, M_AXI_BVALID, M_AXI_BUSER, M_AXI_BREADY,
                                 M_AXI_ARID, M_AXI_ARADDR, M_AXI_ARLEN, M_AXI_ARSIZE, M_AXI_ARBURST, M_AXI_ARLOCK,
                                 M_AXI_ARCACHE, M_AXI_ARPROT, M_AXI_ARREGION, M_AXI_ARQOS, M_AXI_ARUSER, 
                                 M_AXI_ARVALID, M_AXI_ARREADY,
                                 M_AXI_RID, M_AXI_RDATA, M_AXI_RRESP, M_AXI_RLAST, M_AXI_RUSER, M_AXI_RVALID, M_AXI_RREADY,
                                 WRITE_DONE, READ_DONE, STESTID, MTESTID, MTESTADDR, MTESTBURSTLENGTH,
                                 BURST_SIZE_4_BYTES, BURST_TYPE, LOCK_TYPE, FOURBIT, THREEBIT, TEST_DATA, MTESTDATASIZE, RESPONSE, RD_DATA, WRITE_TASK, READ_TASK, VRESPONSE,
                                 MTESTCACHETYPE, MTESTPROTECTIONTYPE, MTESTREGION, MTESTQOS, MTESTAWUSER, MTESTARUSER, MTESTBUSER, V_WUSER, V_RUSER, WRITE_BURST_DATA_TRANSFER_GAP, WRITE_BURST_DATA_TRANSFER_GAP_DONE, GAP_DATA,WRITE_DATA_TRANSFER_COMPLETE, WRITE_BURST_CONCURRENT, WRITE_BURST_CONCURRENT_DONE ,REPORT_STATUS,REPORT_STATUS_DONE,NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
                         );
//-----------------------------------------------------------------------------

parameter C_M_AXI_NAME = "MASTER_0";
parameter C_M_AXI_DATA_WIDTH = 32;
parameter C_M_AXI_ADDR_WIDTH = 32;
parameter C_M_AXI_ID_WIDTH = 4;
parameter C_M_AXI_AWUSER_WIDTH = 1;
parameter C_M_AXI_ARUSER_WIDTH = 1;
parameter C_M_AXI_RUSER_WIDTH  = 1;
parameter C_M_AXI_WUSER_WIDTH  = 1;
parameter C_M_AXI_BUSER_WIDTH  = 1;
parameter C_INTERCONNECT_M_AXI_READ_ISSUING = 8;
parameter C_INTERCONNECT_M_AXI_WRITE_ISSUING = 8;
parameter C_M_AXI_EXCLUSIVE_ACCESS_SUPPORTED = 0;

// Global Clock Input. All signals are sampled on the rising edge.
input wire                               M_AXI_ACLK;
// Global Reset Input. Active Low.
input wire                               M_AXI_ARESETN;
// Write Address Channel Signals.
output wire [C_M_AXI_ID_WIDTH-1:0]	     M_AXI_AWID;    // Master Write address ID. 
output wire [C_M_AXI_ADDR_WIDTH-1:0]     M_AXI_AWADDR;  // Master Write address. 
output wire [7:0]	                       M_AXI_AWLEN;   // Master Burst length.
output wire [2:0]	                       M_AXI_AWSIZE;  // Master Burst size.
output wire [1:0]	                       M_AXI_AWBURST; // Master Burst type.
output wire    	                         M_AXI_AWLOCK;  // Master Lock type.
output wire [3:0]	                       M_AXI_AWCACHE; // Master Cache type.
output wire [2:0]	                       M_AXI_AWPROT;  // Master Protection type.
output wire [3:0]	                       M_AXI_AWREGION;// Master Region signals.
output wire [3:0] 	                     M_AXI_AWQOS;   // Master QoS signals.
output wire [C_M_AXI_AWUSER_WIDTH-1:0]   M_AXI_AWUSER;  // Master User defined signals.
output wire				                       M_AXI_AWVALID; // Master Write address valid.
input  wire				                       M_AXI_AWREADY; // Slave Write address ready.

// Write Data Channel Signals.
output wire [C_M_AXI_DATA_WIDTH-1:0]     M_AXI_WDATA;   // Master Write data.
output wire [(C_M_AXI_DATA_WIDTH/8)-1:0] M_AXI_WSTRB;   // Master Write strobes.
output wire				                       M_AXI_WLAST;   // Master Write last.
output wire [C_M_AXI_WUSER_WIDTH-1:0]    M_AXI_WUSER;   // Master Write User defined signals.
output wire				                       M_AXI_WVALID;  // Master Write valid.
input  wire				                       M_AXI_WREADY;  // Slave Write ready.

// Write Response Channel Signals.
input  wire [C_M_AXI_ID_WIDTH-1:0]       M_AXI_BID;     // Slave Response ID.
input  wire [1:0]	                       M_AXI_BRESP;   // Slave Write response.
input  wire				                       M_AXI_BVALID;  // Slave Write response valid. 
input  wire [C_M_AXI_BUSER_WIDTH-1:0]    M_AXI_BUSER;   // Slave Write user defined signals.
output wire				                       M_AXI_BREADY;  // Master Response ready.
 
// Read Address Channel Signals.
output wire [C_M_AXI_ID_WIDTH-1:0]	     M_AXI_ARID;    // Master Read address ID.
output wire [C_M_AXI_ADDR_WIDTH-1:0]     M_AXI_ARADDR;  // Master Read address.
output wire [7:0]	                       M_AXI_ARLEN;   // Master Burst length.
output wire [2:0]	                       M_AXI_ARSIZE;  // Master Burst size.
output wire [1:0]	                       M_AXI_ARBURST; // Master Burst type.
output wire 	                           M_AXI_ARLOCK;  // Master Lock type.
output wire [3:0]	                       M_AXI_ARCACHE; // Master Cache type.
output wire [2:0]	                       M_AXI_ARPROT;  // Master Protection type.
output wire [3:0]	                       M_AXI_ARREGION;// Master Region signals.
output wire [3:0] 	                     M_AXI_ARQOS;   // Master QoS signals.
output wire [C_M_AXI_ARUSER_WIDTH-1:0]   M_AXI_ARUSER;  // Master User defined signals.
output wire				                       M_AXI_ARVALID; // Master Read address valid.
input  wire				                       M_AXI_ARREADY; // Slave Read address ready.
  
// Read Data Channel Signals.
input  wire [C_M_AXI_ID_WIDTH-1:0]       M_AXI_RID;     // Slave Read ID tag. 
input  wire [C_M_AXI_DATA_WIDTH-1:0]     M_AXI_RDATA;   // Slave Read data.
input  wire [1:0]	                       M_AXI_RRESP;   // Slave Read response.
input  wire				                       M_AXI_RLAST;   // Slave Read last.
input  wire [C_M_AXI_RUSER_WIDTH-1:0]    M_AXI_RUSER;   // Slave Read user defined signals.
input  wire				                       M_AXI_RVALID;  // Slave Read valid.
output wire				                       M_AXI_RREADY;  // Master Read ready.

input wire                               MTESTCACHETYPE;
input wire                               MTESTPROTECTIONTYPE;
input wire                               MTESTREGION;
input wire                               MTESTQOS;
input wire                               MTESTAWUSER;
input wire                               MTESTARUSER;
output reg                               MTESTBUSER;

output reg				                       WRITE_DONE;  // Master Read ready.
output reg				                       READ_DONE;  // Master Read ready.

input wire [3:0]                         MTESTID; 
input wire [3:0]                         STESTID; 
input wire [C_M_AXI_ADDR_WIDTH-1:0]      MTESTADDR;
input wire [((C_M_AXI_DATA_WIDTH/8)*(`MAX_BURST_LENGTH+1))-1:0]                         MTESTBURSTLENGTH;
input wire [3:0]                         BURST_SIZE_4_BYTES;
input wire [1:0]                         BURST_TYPE;
input wire                               LOCK_TYPE;
input wire                               FOURBIT;
input wire                               THREEBIT;
input wire [(C_M_AXI_DATA_WIDTH*(`MAX_BURST_LENGTH+1))-1:0] TEST_DATA ;
output reg [(C_M_AXI_DATA_WIDTH*(`MAX_BURST_LENGTH+1))-1:0] RD_DATA ;
input wire                                                  WRITE_TASK;
input wire                                                  READ_TASK;
input wire [10:0]                                            MTESTDATASIZE;
output reg [`RESP_BUS_WIDTH-1:0]                             RESPONSE;
output reg [(`RESP_BUS_WIDTH*(`MAX_BURST_LENGTH+1))-1:0]     VRESPONSE;
output reg [(C_M_AXI_RUSER_WIDTH*(`MAX_BURST_LENGTH+1))-1:0] V_RUSER;
input wire [(C_M_AXI_RUSER_WIDTH*(`MAX_BURST_LENGTH+1))-1:0] V_WUSER;
output reg                                                   WRITE_DATA_TRANSFER_COMPLETE;
input wire                                                   WRITE_BURST_DATA_TRANSFER_GAP;
output reg                                                   WRITE_BURST_DATA_TRANSFER_GAP_DONE;
input  wire [7:0]                                            GAP_DATA;

input wire                                                    WRITE_BURST_CONCURRENT;
output reg                                                    WRITE_BURST_CONCURRENT_DONE;
input                                         REPORT_STATUS;
output reg                                    REPORT_STATUS_DONE;
output reg                                    NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING;
reg reset_done;

cdn_axi4_master_bfm #(.NAME(C_M_AXI_NAME),
                      .DATA_BUS_WIDTH(C_M_AXI_DATA_WIDTH),
                      .ADDRESS_BUS_WIDTH(C_M_AXI_ADDR_WIDTH),
                      .ID_BUS_WIDTH(C_M_AXI_ID_WIDTH),
                      .AWUSER_BUS_WIDTH(C_M_AXI_AWUSER_WIDTH),
                      .ARUSER_BUS_WIDTH(C_M_AXI_ARUSER_WIDTH),
                      .RUSER_BUS_WIDTH(C_M_AXI_RUSER_WIDTH), 
                      .WUSER_BUS_WIDTH(C_M_AXI_WUSER_WIDTH), 
                      .BUSER_BUS_WIDTH(C_M_AXI_BUSER_WIDTH), 
                      .MAX_OUTSTANDING_TRANSACTIONS(C_INTERCONNECT_M_AXI_READ_ISSUING),
                      .EXCLUSIVE_ACCESS_SUPPORTED(C_M_AXI_EXCLUSIVE_ACCESS_SUPPORTED)
                      ) 
cdn_axi4_master_bfm_inst(.ACLK(M_AXI_ACLK), 
                         .ARESETn(M_AXI_ARESETN),
                         .AWID(M_AXI_AWID), 
                      	 .AWADDR(M_AXI_AWADDR), 
                         .AWLEN(M_AXI_AWLEN), 	 	 
                         .AWSIZE(M_AXI_AWSIZE), 	 	 
                         .AWBURST(M_AXI_AWBURST),   	 
                         .AWLOCK(M_AXI_AWLOCK), 	 	 
                         .AWCACHE(M_AXI_AWCACHE),   	 
                         .AWPROT(M_AXI_AWPROT), 	 	 
                         .AWREGION(M_AXI_AWREGION), 	 
                         .AWQOS(M_AXI_AWQOS), 	 	 
                         .AWUSER(M_AXI_AWUSER), 	 	 
                         .AWVALID(M_AXI_AWVALID),   	 
                         .AWREADY(M_AXI_AWREADY),	 	 
                         .WDATA(M_AXI_WDATA), 	 	 
                         .WSTRB(M_AXI_WSTRB), 	 	 
                         .WLAST(M_AXI_WLAST), 	 	 
                         .WUSER(M_AXI_WUSER), 	 	 
                         .WVALID(M_AXI_WVALID), 	 	 
                         .WREADY(M_AXI_WREADY),	 	 
                         .BID(M_AXI_BID),  	 	 
                         .BRESP(M_AXI_BRESP), 	 	 
                         .BVALID(M_AXI_BVALID), 	 	 
                         .BUSER(M_AXI_BUSER), 	 	 
                         .BREADY(M_AXI_BREADY),	 	 
                         .ARID(M_AXI_ARID), 	 	 
                         .ARADDR(M_AXI_ARADDR), 	 	 
                         .ARLEN(M_AXI_ARLEN), 	 	 
                         .ARSIZE(M_AXI_ARSIZE), 	 	 
                         .ARBURST(M_AXI_ARBURST),   	 
                         .ARLOCK(M_AXI_ARLOCK),	 	 
                         .ARCACHE(M_AXI_ARCACHE),   	 
                         .ARPROT(M_AXI_ARPROT), 	 	 
                         .ARREGION(M_AXI_ARREGION), 	 
                         .ARQOS(M_AXI_ARQOS), 	 	 
                         .ARUSER(M_AXI_ARUSER), 	 	 
                         .ARVALID(M_AXI_ARVALID),   	 
                         .ARREADY(M_AXI_ARREADY),	 	 
                         .RID(M_AXI_RID),  	 	 
                         .RDATA(M_AXI_RDATA), 	 	 
                         .RRESP(M_AXI_RRESP), 	 	 
                         .RLAST(M_AXI_RLAST), 	 	 
                         .RUSER(M_AXI_RUSER), 	 	 
                         .RVALID(M_AXI_RVALID), 	 	 
                         .RREADY(M_AXI_RREADY)	 	 
                       );


 initial begin
      // Wait for end of reset
      //cdn_axi4_master_bfm_inst.set_channel_level_info(1);

      wait(M_AXI_ARESETN === 0) @(posedge M_AXI_ACLK);
      wait(M_AXI_ARESETN === 1) @(posedge M_AXI_ACLK);
      reset_done = 1;
      WRITE_DONE = 0 ; READ_DONE = 0;
      $display("=============== MASTER RESET DONE === "); 
end

always @(posedge M_AXI_ACLK) begin
        if(REPORT_STATUS == 1 && reset_done == 1)  begin
                NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING = cdn_axi4_master_bfm_inst.report_status(0);
                REPORT_STATUS_DONE = 1;
        end
end
          
always @(posedge M_AXI_ACLK && WRITE_TASK ) begin
        if(WRITE_TASK == 1 && reset_done == 1)  begin
                WRITE_DONE = 0;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (WRITE) for MASTER ID = %0d:",MTESTID);
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");      
                cdn_axi4_master_bfm_inst.WRITE_BURST(MTESTID,              
                                                     MTESTADDR,
                                                     MTESTBURSTLENGTH,
                                                     BURST_SIZE_4_BYTES,
                                                     BURST_TYPE,
                                                     LOCK_TYPE,
                                                     MTESTCACHETYPE,
                                                     MTESTPROTECTIONTYPE,
                                                     TEST_DATA,
                                                     MTESTDATASIZE,
                                                     MTESTREGION,
                                                     MTESTQOS,
                                                     MTESTAWUSER,
                                                     V_WUSER,
                                                     RESPONSE,
                                                     MTESTBUSER);
                  $display("EXAMPLE TEST : MASTER WRITE DATA = 0x%h, RESPONSE = 0x%h",TEST_DATA,RESPONSE);
                  WRITE_DONE = 1;
          end
  end
  always @(posedge M_AXI_ACLK && READ_TASK ) begin
          if(READ_TASK == 1 && reset_done == 1) begin
                READ_DONE = 0;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST for (READ) MASTER ID = %0d:",STESTID);
                $display("---------------------------------------------------------");      
                cdn_axi4_master_bfm_inst.READ_BURST(STESTID,
                                                    MTESTADDR,
                                                    MTESTBURSTLENGTH,
                                                    BURST_SIZE_4_BYTES,
                                                    BURST_TYPE,
                                                    LOCK_TYPE,
                                                    MTESTCACHETYPE,
                                                    MTESTPROTECTIONTYPE,
                                                    MTESTREGION,
                                                    MTESTQOS,
                                                    MTESTARUSER,
                                                    RD_DATA,
                                                    VRESPONSE,
                                                    V_RUSER);
                $display("EXAMPLE TEST : READ DATA = 0x%h, vresponse = 0x%h",RD_DATA,VRESPONSE);
                READ_DONE = 1;
          end

  end

always @(posedge M_AXI_ACLK)  begin
        @(cdn_axi4_master_bfm_inst.write_data_transfer_complete);
        WRITE_DATA_TRANSFER_COMPLETE  = 1 ; 
end

always @(posedge M_AXI_ACLK ) begin
        if (WRITE_BURST_DATA_TRANSFER_GAP == 1) begin
                WRITE_BURST_DATA_TRANSFER_GAP_DONE = 0;
                cdn_axi4_master_bfm_inst.set_write_burst_data_transfer_gap(GAP_DATA);
                $display("(MASTER) : WRITE_BURST_DATA_TRANSFER_GAP EVENT occured GAP DATA =%0h ",GAP_DATA);
              WRITE_BURST_DATA_TRANSFER_GAP_DONE = 1;
        end
end


always @(posedge M_AXI_ACLK ) begin
        if(WRITE_BURST_CONCURRENT == 1 && reset_done == 1)  begin
                WRITE_BURST_CONCURRENT_DONE = 0;
                $display("------------------------------------------------------------------");
                $display("EXAMPLE TEST (WRITE_BURST_CONCURRENT) for MASTER ID = %0d:",MTESTID);
                $display("------------------------------------------------------------------");      
                cdn_axi4_master_bfm_inst.WRITE_BURST(MTESTID,              
                                                     MTESTADDR,
                                                     MTESTBURSTLENGTH,
                                                     BURST_SIZE_4_BYTES,
                                                     BURST_TYPE,
                                                     LOCK_TYPE,
                                                     MTESTCACHETYPE,
                                                     MTESTPROTECTIONTYPE,
                                                     TEST_DATA,
                                                     MTESTDATASIZE,
                                                     MTESTREGION,
                                                     MTESTQOS,
                                                     MTESTAWUSER,
                                                     V_WUSER,
                                                     RESPONSE,
                                                     MTESTBUSER);
                  $display("EXAMPLE TEST : MASTER WRITE DATA = 0x%h, RESPONSE = 0x%h",TEST_DATA,RESPONSE);
                  WRITE_BURST_CONCURRENT_DONE = 1;
          end
  end

endmodule
