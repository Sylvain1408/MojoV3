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
`define LOCK_TYPE_NORMAL    2'b00
`define LOCK_TYPE_EXCLUSIVE 2'b01
`define LOCK_TYPE_LOCKED    2'b10

// Response Type Defines
`define RESPONSE_OKAY 2'b00
`define RESPONSE_EXOKAY 2'b01
`define RESPONSE_SLVERR 2'b10
`define RESPONSE_DECERR 2'b11

// AMBA AXI 3 Bus Size Constants
`define LENGTH_BUS_WIDTH 4
`define SIZE_BUS_WIDTH 3
`define BURST_BUS_WIDTH 2
`define LOCK_BUS_WIDTH 2
`define CACHE_BUS_WIDTH 4
`define PROT_BUS_WIDTH 3
`define RESP_BUS_WIDTH 2
  
// AMBA AXI 3 Range Constants
`define MAX_BURST_LENGTH 4'b1111
`define MAX_DATA_SIZE (C_M_AXI_DATA_WIDTH*(`MAX_BURST_LENGTH+1))/8
  
// Defines for API control
`define IDVALID_TRUE  1'b1
`define IDVALID_FALSE 1'b0


//-----------------------------------------------------------------------------
// The AXI 3 Master BFM Top Level Wrapper
//-----------------------------------------------------------------------------

module cdn_axi3_master_bfm_wrap (M_AXI_ACLK, M_AXI_ARESETN, 
                                 M_AXI_AWID, M_AXI_AWADDR, M_AXI_AWLEN, M_AXI_AWSIZE, M_AXI_AWBURST, M_AXI_AWLOCK, 
                                 M_AXI_AWCACHE, M_AXI_AWPROT, M_AXI_AWVALID, M_AXI_AWREADY,
                                 M_AXI_WID, M_AXI_WDATA, M_AXI_WSTRB, M_AXI_WLAST, M_AXI_WVALID, M_AXI_WREADY,
                                 M_AXI_BID, M_AXI_BRESP, M_AXI_BVALID, M_AXI_BREADY,
                                 M_AXI_ARID, M_AXI_ARADDR, M_AXI_ARLEN, M_AXI_ARSIZE, M_AXI_ARBURST, M_AXI_ARLOCK,
                                 M_AXI_ARCACHE, M_AXI_ARPROT, M_AXI_ARVALID, M_AXI_ARREADY,
                                 M_AXI_RID, M_AXI_RDATA, M_AXI_RRESP, M_AXI_RLAST, M_AXI_RVALID, M_AXI_RREADY,
                                 WRITE_DONE,READ_DONE,WRITE_BURST_CONCURRENT,WRITE_BURST_CONCURRENT_DONE,WRITE_BURST_DATA_FIRST,WRITE_BURST_DATA_FIRST_DONE,
                                 SET_WRITE_BURST_DATA_TRANSFER_GAP, GAP_DATA, WRITE_DATA_TRANSFER_COMPLETE, stestID,mtestID,mtestADDR,mtestBurstLength,
                                 BURST_SIZE_4_BYTES_s,BURST_TYPE_FIXED_s,LOCK_TYPE_NORMAL_s,fourbit,threebit,test_data,mtestdatasize,response,rd_data,write_task,read_task,vresponse,REPORT_STATUS,REPORT_STATUS_DONE,NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
                                 );
//-----------------------------------------------------------------------------

parameter C_M_AXI_NAME = "MASTER_0";
parameter C_M_AXI_DATA_WIDTH = 32;
parameter C_M_AXI_ADDR_WIDTH = 32;
parameter C_M_AXI_ID_WIDTH = 4;
parameter C_INTERCONNECT_M_AXI_READ_ISSUING = 8;
parameter C_INTERCONNECT_M_AXI_WRITE_ISSUING = 8;
parameter C_M_AXI_EXCLUSIVE_ACCESS_SUPPORTED = 1;

// Global Clock Input. All signals are sampled on the rising edge.
input wire M_AXI_ACLK;
// Global Reset Input. Active Low.
input wire M_AXI_ARESETN;

// Write Address Channel Signals.
output wire [C_M_AXI_ID_WIDTH-1:0]	         M_AXI_AWID;    // Master Write address ID. 
output wire [C_M_AXI_ADDR_WIDTH-1:0]         M_AXI_AWADDR;  // Master Write address. 
output wire [3:0]	                           M_AXI_AWLEN;   // Master Burst length.
output wire [2:0]	                           M_AXI_AWSIZE;  // Master Burst size.
output wire [1:0]	                           M_AXI_AWBURST; // Master Burst type.
output wire [1:0]                            M_AXI_AWLOCK;  // Master Lock type.
output wire [3:0]	                           M_AXI_AWCACHE; // Master Cache type.
output wire [2:0]	                           M_AXI_AWPROT;  // Master Protection type.
output wire				                           M_AXI_AWVALID; // Master Write address valid.
input  wire				                           M_AXI_AWREADY; // Slave Write address ready.

// Write Data Channel Signals.
output wire [C_M_AXI_ID_WIDTH-1:0]           M_AXI_WID;     // Master Write ID tag.
output wire [C_M_AXI_DATA_WIDTH-1:0]         M_AXI_WDATA;   // Master Write data.
output wire [(C_M_AXI_DATA_WIDTH/8)-1:0]     M_AXI_WSTRB;   // Master Write strobes.
output wire				                           M_AXI_WLAST;   // Master Write last.
output wire				                           M_AXI_WVALID;  // Master Write valid.
input  wire				                           M_AXI_WREADY;  // Slave Write ready.

// Write Response Channel Signals.
input  wire [C_M_AXI_ID_WIDTH-1:0]          M_AXI_BID;     // Slave Response ID.
input  wire [1:0]	                          M_AXI_BRESP;   // Slave Write response.
input  wire				                          M_AXI_BVALID;  // Slave Write response valid. 
output wire				                          M_AXI_BREADY;  // Master Response ready.
 
// Read Address Channel Signals.
output wire [C_M_AXI_ID_WIDTH-1:0]	        M_AXI_ARID;    // Master Read address ID.
output wire [C_M_AXI_ADDR_WIDTH-1:0]        M_AXI_ARADDR;  // Master Read address.
output wire [3:0]	                          M_AXI_ARLEN;   // Master Burst length.
output wire [2:0]	                          M_AXI_ARSIZE;  // Master Burst size.
output wire [1:0]	                          M_AXI_ARBURST; // Master Burst type.
output wire [1:0]                           M_AXI_ARLOCK;  // Master Lock type.
output wire [3:0]	                          M_AXI_ARCACHE; // Master Cache type.
output wire [2:0]	                          M_AXI_ARPROT;  // Master Protection type.
output wire				                          M_AXI_ARVALID; // Master Read address valid.
input  wire				                          M_AXI_ARREADY; // Slave Read address ready.
  
// Read Data Channel Signals.
input  wire [C_M_AXI_ID_WIDTH-1:0]           M_AXI_RID;     // Slave Read ID tag. 
input  wire [C_M_AXI_DATA_WIDTH-1:0]         M_AXI_RDATA;   // Slave Read data.
input  wire [1:0]	                           M_AXI_RRESP;   // Slave Read response.
input  wire				                           M_AXI_RLAST;   // Slave Read last.
input  wire				                           M_AXI_RVALID;  // Slave Read valid.
output wire				                           M_AXI_RREADY;  // Master Read ready.

output reg				                           WRITE_DONE;  // Master Read ready.
output reg				                           READ_DONE;  // Master Read ready.

input wire [3:0]                             mtestID; 
input wire [3:0]                             stestID; 
input wire [C_M_AXI_ADDR_WIDTH-1:0]          mtestADDR;
input wire [3:0]                             mtestBurstLength;
input wire [3:0]                             BURST_SIZE_4_BYTES_s;
input wire [1:0]                             BURST_TYPE_FIXED_s;
input wire                                   LOCK_TYPE_NORMAL_s;
input wire                                   fourbit;
input wire                                   threebit;
input wire [(C_M_AXI_DATA_WIDTH*(`MAX_BURST_LENGTH+1))-1:0] test_data ;
output reg [(C_M_AXI_DATA_WIDTH*(`MAX_BURST_LENGTH+1))-1:0] rd_data ;
input wire                                                  write_task;
input wire                                                  read_task;
input wire [6:0]                             mtestdatasize;
output reg [`RESP_BUS_WIDTH-1:0]            response;
output reg [(`RESP_BUS_WIDTH*(`MAX_BURST_LENGTH+1))-1:0] vresponse;

input wire                                    WRITE_BURST_CONCURRENT       ;
output reg                                    WRITE_BURST_CONCURRENT_DONE  ;
input wire                                    WRITE_BURST_DATA_FIRST      ;
output reg                                    WRITE_BURST_DATA_FIRST_DONE ;
input wire                                    SET_WRITE_BURST_DATA_TRANSFER_GAP ;
input wire [11:0]                             GAP_DATA;
output reg                                    WRITE_DATA_TRANSFER_COMPLETE;
input                                         REPORT_STATUS;
output reg                                    REPORT_STATUS_DONE;
output reg                                    NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING;

reg reset_done;

cdn_axi3_master_bfm #(.NAME(C_M_AXI_NAME),
                      .DATA_BUS_WIDTH(C_M_AXI_DATA_WIDTH),
                      .ADDRESS_BUS_WIDTH(C_M_AXI_ADDR_WIDTH),
       	              .ID_BUS_WIDTH(C_M_AXI_ID_WIDTH), 
                      .MAX_OUTSTANDING_TRANSACTIONS(C_INTERCONNECT_M_AXI_READ_ISSUING),
                      .EXCLUSIVE_ACCESS_SUPPORTED(C_M_AXI_EXCLUSIVE_ACCESS_SUPPORTED)
                      ) 
cdn_axi3_master_bfm_inst(.ACLK(M_AXI_ACLK), 
                         .ARESETn(M_AXI_ARESETN),
                         .AWID(M_AXI_AWID), 
                      	 .AWADDR(M_AXI_AWADDR), 
                         .AWLEN(M_AXI_AWLEN), 	 	 
                         .AWSIZE(M_AXI_AWSIZE), 	 	 
                         .AWBURST(M_AXI_AWBURST),   	 
                         .AWLOCK(M_AXI_AWLOCK), 	 	 
                         .AWCACHE(M_AXI_AWCACHE),   	 
                         .AWPROT(M_AXI_AWPROT), 	 	 	 
                         .AWVALID(M_AXI_AWVALID),   	 
                         .AWREADY(M_AXI_AWREADY),	 	 
                         .WID(M_AXI_WID),
                         .WDATA(M_AXI_WDATA), 	 	 
                         .WSTRB(M_AXI_WSTRB), 	 	 
                         .WLAST(M_AXI_WLAST), 	 	 
                         .WVALID(M_AXI_WVALID), 	 	 
                         .WREADY(M_AXI_WREADY),	 	 
                         .BID(M_AXI_BID),  	 	 
                         .BRESP(M_AXI_BRESP), 	 	 
                         .BVALID(M_AXI_BVALID), 	 	 
                         .BREADY(M_AXI_BREADY),	 	 
                         .ARID(M_AXI_ARID), 	 	 
                         .ARADDR(M_AXI_ARADDR), 	 	 
                         .ARLEN(M_AXI_ARLEN), 	 	 
                         .ARSIZE(M_AXI_ARSIZE), 	 	 
                         .ARBURST(M_AXI_ARBURST),   	 
                         .ARLOCK(M_AXI_ARLOCK),	 	 
                         .ARCACHE(M_AXI_ARCACHE),   	 
                         .ARPROT(M_AXI_ARPROT), 	 	  	 
                         .ARVALID(M_AXI_ARVALID),   	 
                         .ARREADY(M_AXI_ARREADY),	 	 
                         .RID(M_AXI_RID),  	 	 
                         .RDATA(M_AXI_RDATA), 	 	 
                         .RRESP(M_AXI_RRESP), 	 	 
                         .RLAST(M_AXI_RLAST), 	 	 
                         .RVALID(M_AXI_RVALID), 	 	 
                         .RREADY(M_AXI_RREADY)	 	 
                       );
 initial begin
      // Wait for end of reset
      cdn_axi3_master_bfm_inst.set_channel_level_info(1);

      wait(M_AXI_ARESETN === 0) @(posedge M_AXI_ACLK);
      wait(M_AXI_ARESETN === 1) @(posedge M_AXI_ACLK);
      reset_done = 1;
      WRITE_DONE = 0 ; READ_DONE = 0;
end

always @(posedge M_AXI_ACLK ) begin
        if(WRITE_BURST_CONCURRENT == 1 && reset_done == 1)  begin
                WRITE_BURST_CONCURRENT_DONE = 0;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (WRITE_BURST_CONCURRENT) for MASTER ID = %0d:",mtestID);
                $display("---------------------------------------------------------");      
                cdn_axi3_master_bfm_inst.WRITE_BURST_CONCURRENT(mtestID,              
                                                                mtestADDR,
                                                                mtestBurstLength,
                                                                BURST_SIZE_4_BYTES_s,
                                                                BURST_TYPE_FIXED_s,
                                                                LOCK_TYPE_NORMAL_s,
                                                                fourbit,
                                                                threebit,
                                                                test_data,
                                                                mtestdatasize,
                                                                response);
                  $display("EXAMPLE TEST : MASTER WRITE_BURST_CONCURRENT DATA = 0x%h, response = 0x%h",test_data,response);
                  WRITE_BURST_CONCURRENT_DONE = 1;
          end
end

always @(posedge M_AXI_ACLK) begin
        if(WRITE_BURST_DATA_FIRST == 1 && reset_done == 1)  begin
                WRITE_BURST_DATA_FIRST_DONE = 0;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (WRITE_BURST_DATA_FIRST) for MASTER ID = %0d:",mtestID);
                $display("---------------------------------------------------------");      
                cdn_axi3_master_bfm_inst.WRITE_BURST_DATA_FIRST(mtestID,              
                                                                mtestADDR,
                                                                mtestBurstLength,
                                                                BURST_SIZE_4_BYTES_s,
                                                                BURST_TYPE_FIXED_s,
                                                                LOCK_TYPE_NORMAL_s,
                                                                fourbit,
                                                                threebit,
                                                                test_data,
                                                                mtestdatasize,
                                                                response);
                  $display("EXAMPLE TEST : MASTER WRITE_BURST_DATA_FIRST DATA = 0x%h, response = 0x%h",test_data,response);
                  WRITE_BURST_DATA_FIRST_DONE = 1;
          end
end
always @(posedge M_AXI_ACLK) begin
        @(cdn_axi3_master_bfm_inst.write_data_transfer_complete);
        WRITE_DATA_TRANSFER_COMPLETE = 1;
end
always @(posedge M_AXI_ACLK ) begin
        if(SET_WRITE_BURST_DATA_TRANSFER_GAP == 1 && reset_done == 1)  begin
                cdn_axi3_master_bfm_inst.set_write_burst_data_transfer_gap(GAP_DATA);
        end
end

always @(posedge M_AXI_ACLK) begin
        if(REPORT_STATUS == 1 && reset_done == 1)  begin
                NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING = cdn_axi3_master_bfm_inst.report_status(0);
                REPORT_STATUS_DONE = 1;
        end
end

always @(posedge M_AXI_ACLK ) begin
        if(write_task == 1 && reset_done == 1)  begin
                WRITE_DONE = 0;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (WRITE) for MASTER ID = %0d:",mtestID);
                $display("---------------------------------------------------------");      
                cdn_axi3_master_bfm_inst.WRITE_BURST(mtestID,              
                                                     mtestADDR,
                                                     mtestBurstLength,
                                                     BURST_SIZE_4_BYTES_s,
                                                     BURST_TYPE_FIXED_s,
                                                     LOCK_TYPE_NORMAL_s,
                                                     fourbit,
                                                     threebit,
                                                     test_data,
                                                     mtestdatasize,
                                                     response);
                  $display("EXAMPLE TEST : MASTER WRITE DATA = 0x%h, response = 0x%h",test_data,response);
                  WRITE_DONE = 1;
          end
  end
  always @(posedge M_AXI_ACLK && read_task ) begin
          if(read_task == 1 && reset_done == 1) begin
                READ_DONE = 0;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST for (READ) MASTER ID = %0d:",stestID);
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");      
                cdn_axi3_master_bfm_inst.READ_BURST(stestID,              
                                                     mtestADDR,
                                                     mtestBurstLength,
                                                     BURST_SIZE_4_BYTES_s,
                                                     BURST_TYPE_FIXED_s,
                                                     LOCK_TYPE_NORMAL_s,
                                                     fourbit,
                                                     threebit,
                                                     rd_data,
                                                     vresponse);
                  $display("EXAMPLE TEST : READ DATA = 0x%h, vresponse = 0x%h",test_data,vresponse);
                READ_DONE = 1;
          end
  end

endmodule

