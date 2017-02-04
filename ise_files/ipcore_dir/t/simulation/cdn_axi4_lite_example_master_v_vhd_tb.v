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
// File name: cdn_axi4_lite_master_bfm_wrapper.v
// Description: Verilog wrapper for Cadence's "cdn_axi4_lite_master_bfm" module.
//  
//
//-----------------------------------------------------------------------------

`timescale 1ps/1ps

// Response Type Defines
`define RESPONSE_OKAY   2'b00
`define RESPONSE_EXOKAY 2'b01
`define RESPONSE_SLVERR 2'b10
`define RESPONSE_DECERR 2'b11

// AMBA AXI 4 Lite Range Constants
`define MAX_BURST_LENGTH 1
`define MAX_DATA_SIZE (DATA_BUS_WIDTH*`MAX_BURST_LENGTH)/8
   
// AMBA AXI 4 Lite Bus Size Constants
`define PROT_BUS_WIDTH 3
`define RESP_BUS_WIDTH 2

// Define for intenal control value
`define ADDRVALID_FALSE 0
`define ADDRVALID_TRUE  1

//-----------------------------------------------------------------------------
// The AXI4 Lite Master BFM Top Level Wrapper
//-----------------------------------------------------------------------------

module cdn_axi4_lite_master_bfm_wrap (M_AXI_LITE_ACLK, M_AXI_LITE_ARESETN, 
                                      M_AXI_LITE_AWADDR, M_AXI_LITE_AWPROT, M_AXI_LITE_AWVALID, M_AXI_LITE_AWREADY,
                                      M_AXI_LITE_WDATA, M_AXI_LITE_WSTRB, M_AXI_LITE_WVALID, M_AXI_LITE_WREADY,
                                      M_AXI_LITE_BRESP, M_AXI_LITE_BVALID, M_AXI_LITE_BREADY,
                                      M_AXI_LITE_ARADDR, M_AXI_LITE_ARPROT, M_AXI_LITE_ARVALID, M_AXI_LITE_ARREADY,
                                      M_AXI_LITE_RDATA, M_AXI_LITE_RRESP, M_AXI_LITE_RVALID, M_AXI_LITE_RREADY,
                                      MTESTADDRESS, MTESTPROTECTION, TEST_DATA, RD_DATA, RESPONSE, MTESTDATASIZE,
                                      WRITE_BURST, READ_BURST, WRITE_BURST_DONE, READ_BURST_DONE, WRITE_BURST_CONCURRENT, WRITE_BURST_CONCURRENT_DONE,
                                      WRITE_BURST_DATA_FIRST_DONE,WRITE_BURST_DATA_FIRST,REPORT_STATUS,REPORT_STATUS_DONE,NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING

                              );
//-----------------------------------------------------------------------------

parameter C_M_AXI_LITE_NAME = "MASTER_0";
parameter C_M_AXI_LITE_DATA_WIDTH = 32;
parameter C_M_AXI_LITE_ADDR_WIDTH = 32;
parameter C_INTERCONNECT_M_AXI_LITE_READ_ISSUING = 8;
parameter C_INTERCONNECT_M_AXI_LITE_WRITE_ISSUING = 8;
   
//------------------------------------------------------------------------
// Signal Definitions
//------------------------------------------------------------------------

// Global Clock Input. All signals are sampled on the rising edge.
input wire M_AXI_LITE_ACLK;
// Global Reset Input. Active Low.
input wire M_AXI_LITE_ARESETN;
   
// Write Address Channel Signals.
output wire [C_M_AXI_LITE_ADDR_WIDTH-1:0]         M_AXI_LITE_AWADDR;  // Master Write address. 
output wire [2:0]                                 M_AXI_LITE_AWPROT;  // Master Protection type.
output wire                                       M_AXI_LITE_AWVALID; // Master Write address valid.
input  wire                                       M_AXI_LITE_AWREADY; // Slave Write address ready.
   

// Write Data Channel Signals.
output wire [C_M_AXI_LITE_DATA_WIDTH-1:0]         M_AXI_LITE_WDATA;   // Master Write data.
output wire [(C_M_AXI_LITE_DATA_WIDTH/8)-1:0]     M_AXI_LITE_WSTRB;   // Master Write strobes.
output wire                                       M_AXI_LITE_WVALID;  // Master Write valid.
input  wire                                       M_AXI_LITE_WREADY;  // Slave Write ready.
  
// Write Response Channel Signals.
input  wire [1:0]                                 M_AXI_LITE_BRESP;   // Slave Write response.
input  wire                                       M_AXI_LITE_BVALID;  // Slave Write response valid. 
output wire                                       M_AXI_LITE_BREADY;  // Master Response ready.
   
// Read Address Channel Signals.
output wire [C_M_AXI_LITE_ADDR_WIDTH-1:0]         M_AXI_LITE_ARADDR;  // Master Read address.
output wire [2:0]                                 M_AXI_LITE_ARPROT;  // Master Protection type.
output wire                                       M_AXI_LITE_ARVALID; // Master Read address valid.
input  wire                                       M_AXI_LITE_ARREADY; // Slave Read address ready.
   
// Read Data Channel Signals.
input  wire [C_M_AXI_LITE_DATA_WIDTH-1:0]         M_AXI_LITE_RDATA;   // Slave Read data.
input  wire [1:0]                                 M_AXI_LITE_RRESP;   // Slave Read response.
input  wire                                       M_AXI_LITE_RVALID;  // Slave Read valid.
output wire                                       M_AXI_LITE_RREADY;  // Master Read ready.

input wire [C_M_AXI_LITE_ADDR_WIDTH-1:0] MTESTADDRESS;
input wire [`PROT_BUS_WIDTH-1:0]         MTESTPROTECTION;
input wire [C_M_AXI_LITE_DATA_WIDTH-1:0] TEST_DATA ;
output reg [C_M_AXI_LITE_DATA_WIDTH-1:0] RD_DATA ;
output reg [`RESP_BUS_WIDTH-1:0]         RESPONSE;
input wire [11:0]                         MTESTDATASIZE;
input  wire                                WRITE_BURST  ;
input  wire                                READ_BURST  ;
output reg                                 WRITE_BURST_DONE;
output reg                                 READ_BURST_DONE;
input  wire                                WRITE_BURST_CONCURRENT      ;
output reg                                 WRITE_BURST_CONCURRENT_DONE  ;
input  wire                                WRITE_BURST_DATA_FIRST;
output reg                                 WRITE_BURST_DATA_FIRST_DONE;
input                                      REPORT_STATUS;
output reg                                 REPORT_STATUS_DONE;
output reg                                 NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING;


reg reset_done;

cdn_axi4_lite_master_bfm #(.NAME(C_M_AXI_LITE_NAME),
                           .DATA_BUS_WIDTH(C_M_AXI_LITE_DATA_WIDTH),
                           .ADDRESS_BUS_WIDTH(C_M_AXI_LITE_ADDR_WIDTH),
                           .MAX_OUTSTANDING_TRANSACTIONS(C_INTERCONNECT_M_AXI_LITE_READ_ISSUING)
                           ) 
cdn_axi4_lite_master_bfm_inst(.ACLK(M_AXI_LITE_ACLK), 
                              .ARESETn(M_AXI_LITE_ARESETN), 
                              .AWADDR(M_AXI_LITE_AWADDR), 
                              .AWPROT(M_AXI_LITE_AWPROT), 
                              .AWVALID(M_AXI_LITE_AWVALID), 
                              .AWREADY(M_AXI_LITE_AWREADY),
                              .WDATA(M_AXI_LITE_WDATA), 
                              .WSTRB(M_AXI_LITE_WSTRB), 
                              .WVALID(M_AXI_LITE_WVALID),
                              .WREADY(M_AXI_LITE_WREADY),
                              .BRESP(M_AXI_LITE_BRESP), 
                              .BVALID(M_AXI_LITE_BVALID),
                              .BREADY(M_AXI_LITE_BREADY),
                              .ARADDR(M_AXI_LITE_ARADDR), 
                              .ARPROT(M_AXI_LITE_ARPROT), 
                              .ARVALID(M_AXI_LITE_ARVALID), 
                              .ARREADY(M_AXI_LITE_ARREADY),
                              .RDATA(M_AXI_LITE_RDATA), 
                              .RRESP(M_AXI_LITE_RRESP), 
                              .RVALID(M_AXI_LITE_RVALID), 
                              .RREADY(M_AXI_LITE_RREADY)
                              );


 initial begin
      reset_done = 0;
      cdn_axi4_lite_master_bfm_inst.set_channel_level_info(1);

      // Wait for end of reset
      wait(M_AXI_LITE_ARESETN === 0) @(posedge M_AXI_LITE_ACLK);
      wait(M_AXI_LITE_ARESETN === 1) @(posedge M_AXI_LITE_ACLK);
      reset_done = 1;
      WRITE_BURST_DONE = 0 ; READ_BURST_DONE = 0;
      $monitor ("(%0t) :::: (SLAVE) :: Value for Write or Read burst have changed Write = %0d and Read=%0d",$time,WRITE_BURST,READ_BURST);

  end
  
  always @(posedge M_AXI_LITE_ACLK) begin
          if(REPORT_STATUS == 1 && reset_done == 1)  begin
                  NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING = cdn_axi4_lite_master_bfm_inst.report_status(0);
                  REPORT_STATUS_DONE = 1;
          end
  end

  always @(posedge M_AXI_LITE_ACLK) begin
      
      if(WRITE_BURST == 1 && reset_done == 1 ) begin
                WRITE_BURST_DONE = 0 ;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (WRITE BURST ) for MASTER");
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");   
                cdn_axi4_lite_master_bfm_inst.WRITE_BURST(MTESTADDRESS,
                                                          MTESTPROTECTION,
                                                          TEST_DATA,
                                                          MTESTDATASIZE,
                                                          RESPONSE);
                $display("EXAMPLE TEST : MASTER WRITE DATA = 0x%h, response = 0x%h",TEST_DATA,RESPONSE);
                WRITE_BURST_DONE = 1;

      end
      
      if(READ_BURST == 1 && reset_done == 1 ) begin
                READ_BURST_DONE = 0 ;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (READ BURST) for MASTER ");
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");   
                cdn_axi4_lite_master_bfm_inst.READ_BURST(MTESTADDRESS,
                                                         MTESTPROTECTION,
                                                         RD_DATA,
                                                         RESPONSE);

                READ_BURST_DONE = 1 ;
                $display("EXAMPLE TEST : READ DATA = 0x%h, response = 0x%h",RD_DATA,RESPONSE);
      end

     if(WRITE_BURST_CONCURRENT == 1 && reset_done == 1 ) begin
             WRITE_BURST_CONCURRENT_DONE = 0 ;
             cdn_axi4_lite_master_bfm_inst.WRITE_BURST_CONCURRENT(MTESTADDRESS,
                                                                  MTESTPROTECTION,
                                                                  TEST_DATA,
                                                                  MTESTDATASIZE,
                                                                  RESPONSE);
               $display("EXAMPLE TEST : MASTER WRITE_BURST_CONCURRENT WRITE DATA = 0x%h, response = 0x%h",TEST_DATA,RESPONSE);
               WRITE_BURST_CONCURRENT_DONE = 1;
      end
      
      if(WRITE_BURST_DATA_FIRST == 1 && reset_done == 1 ) begin
             WRITE_BURST_DATA_FIRST_DONE = 0 ;
             cdn_axi4_lite_master_bfm_inst.WRITE_BURST_DATA_FIRST(MTESTADDRESS,
                                                                  MTESTPROTECTION,
                                                                  TEST_DATA,
                                                                  MTESTDATASIZE,
                                                                  RESPONSE);
               $display("EXAMPLE TEST : MASTER WRITE_BURST_DATA_FIRST WRITE DATA = 0x%h, response = 0x%h",TEST_DATA,RESPONSE);
               WRITE_BURST_DATA_FIRST_DONE = 1;
       end
end         


endmodule
