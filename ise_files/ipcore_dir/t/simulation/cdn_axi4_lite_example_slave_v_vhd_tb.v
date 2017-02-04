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
// File name: cdn_axi4_lite_slave_bfm_wrap.v
//
// Description: Verilog wrapper for Cadence's "cdn_axi4_lite_slave_bfm" module.
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
// The AXI 4 Lite Slave BFM Top Level Wrapper
//-----------------------------------------------------------------------------

module cdn_axi4_lite_slave_bfm_wrap (S_AXI_LITE_ACLK, S_AXI_LITE_ARESETN, 
                                     S_AXI_LITE_AWADDR, S_AXI_LITE_AWPROT, S_AXI_LITE_AWVALID, S_AXI_LITE_AWREADY,
                                     S_AXI_LITE_WDATA, S_AXI_LITE_WSTRB, S_AXI_LITE_WVALID, S_AXI_LITE_WREADY,
                                     S_AXI_LITE_BRESP, S_AXI_LITE_BVALID, S_AXI_LITE_BREADY,
                                     S_AXI_LITE_ARADDR, S_AXI_LITE_ARPROT, S_AXI_LITE_ARVALID, S_AXI_LITE_ARREADY,
                                     S_AXI_LITE_RDATA, S_AXI_LITE_RRESP, S_AXI_LITE_RVALID, S_AXI_LITE_RREADY,
                                     WRITE_ID_TAG, WR_DATA,  READ_ID_TAG, RESP_DATA, WRITE_BURST_RES, READ_BURST_RES,
                                     WRITE_BURST_RES_DONE, READ_BURST_RES_DONE,SET_READ_BURST_DATA_TRANSFER_GAP,
                                     STESTDATASIZE, PENDING_TRANSACTIONS_COUNT,RESPONSE,ERROR_RESPONSE,
                                     SET_WRITE_RESPONSE_GAP, SET_READ_RESPONSE_GAP,GAP_DATA,ADDRVALID,
                                     WRITE_BURST_RESP_CTRL,WRITE_BURST_RESP_CTRL_DONE, READ_BURST_RESP_CTRL, READ_BURST_RESP_CTRL_DONE,
                                     REPORT_STATUS,REPORT_STATUS_DONE,NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
                             );
//-----------------------------------------------------------------------------

parameter C_S_AXI_LITE_NAME = "SLAVE_0";
parameter C_S_AXI_LITE_DATA_WIDTH = 32;
parameter C_S_AXI_LITE_ADDR_WIDTH = 32;
parameter C_INTERCONNECT_S_AXI_LITE_READ_ACCEPTANCE = 8;
parameter C_INTERCONNECT_S_AXI_LITE_WRITE_ACCEPTANCE = 8;
parameter C_S_AXI_LITE_MEMORY_MODEL_MODE = 0;
parameter C_BASEADDR = 32'hffffffff;
parameter C_HIGHADDR = 32'h00000000;
parameter C_S_AXI_LITE_SLAVE_MEM_SIZE = 4096;

//------------------------------------------------------------------------
// Signal Definitions
//------------------------------------------------------------------------

// Global Clock Input. All signals are sampled on the rising edge.
input wire S_AXI_LITE_ACLK;    
// Global Reset Input. Active Low.
input wire S_AXI_LITE_ARESETN;
  
// Write Address Channel Signals.
input  wire [C_S_AXI_LITE_ADDR_WIDTH-1:0]         S_AXI_LITE_AWADDR ;  // Master Write address. 
input  wire [2:0]                                 S_AXI_LITE_AWPROT ;  // Master Protection type.
input  wire                                       S_AXI_LITE_AWVALID;  // Master Write address valid.
output wire                                       S_AXI_LITE_AWREADY;  // Slave Write address ready.

// Write Data Channel Signals.
input  wire [C_S_AXI_LITE_DATA_WIDTH-1:0]         S_AXI_LITE_WDATA  ;  // Master Write data.
input  wire [(C_S_AXI_LITE_DATA_WIDTH/8)-1:0]     S_AXI_LITE_WSTRB  ;  // Master Write strobes.
input  wire                                       S_AXI_LITE_WVALID ;  // Master Write valid.
output wire                                       S_AXI_LITE_WREADY ;  // Slave Write ready.
   
// Write Response Channel Signals.
output wire [1:0]                                 S_AXI_LITE_BRESP  ;  // Slave Write response.
output wire                                       S_AXI_LITE_BVALID ;  // Slave Write response valid. 
input  wire                                       S_AXI_LITE_BREADY ;  // Master Response ready.
   
// Read Address Channel Signals.
input  wire [C_S_AXI_LITE_ADDR_WIDTH-1:0]         S_AXI_LITE_ARADDR ;  // Master Read address.
input  wire [2:0]                                 S_AXI_LITE_ARPROT ;  // Master Protection type.
input  wire                                       S_AXI_LITE_ARVALID;  // Master Read address valid.
output wire                                       S_AXI_LITE_ARREADY;  // Slave Read address ready.
   
// Read Data Channel Signals.
output wire [C_S_AXI_LITE_DATA_WIDTH-1:0]         S_AXI_LITE_RDATA  ;   // Slave Read data.
output wire [1:0]                	                S_AXI_LITE_RRESP  ;   // Slave Read response.
output wire                                       S_AXI_LITE_RVALID ;   // Slave Read valid.
input  wire                                       S_AXI_LITE_RREADY ;   // Master Read ready.

input  wire [C_S_AXI_LITE_ADDR_WIDTH-1:0]                                 WRITE_ID_TAG                     ;
input  wire [C_S_AXI_LITE_ADDR_WIDTH-1:0]         READ_ID_TAG                      ;
input  wire [C_S_AXI_LITE_DATA_WIDTH-1:0]         RESP_DATA                        ;
input  wire                                       WRITE_BURST_RES                  ;
input  wire                                       READ_BURST_RES                   ;
input  wire                                       SET_READ_BURST_DATA_TRANSFER_GAP ;
input  wire                                       SET_WRITE_RESPONSE_GAP           ;
input  wire                                       SET_READ_RESPONSE_GAP            ;
input  wire [3:0]                                 GAP_DATA                         ;
input  wire                                       ADDRVALID                        ;
input  wire                                       WRITE_BURST_RESP_CTRL            ;
input  wire                                       READ_BURST_RESP_CTRL             ;
input  wire [`RESP_BUS_WIDTH-1:0]                 RESPONSE                         ;
output reg                                        WRITE_BURST_RESP_CTRL_DONE       ;
output reg                                        READ_BURST_RESP_CTRL_DONE        ;
input  wire  [`RESP_BUS_WIDTH-1:0]                 ERROR_RESPONSE                   ;
output reg  [3:0]                                 PENDING_TRANSACTIONS_COUNT       ;
output reg  [2:0]                                 STESTDATASIZE                    ;
output reg  [C_S_AXI_LITE_DATA_WIDTH-1:0]         WR_DATA                          ;
output reg                                        WRITE_BURST_RES_DONE             ;
output reg                                        READ_BURST_RES_DONE              ;
input                                                       REPORT_STATUS;
output reg                                                  REPORT_STATUS_DONE;
output reg                                                  NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING;


reg reset_done;

cdn_axi4_lite_slave_bfm #(.NAME(C_S_AXI_LITE_NAME),
                          .DATA_BUS_WIDTH(C_S_AXI_LITE_DATA_WIDTH),
                          .ADDRESS_BUS_WIDTH(C_S_AXI_LITE_ADDR_WIDTH),
                          .SLAVE_ADDRESS(C_BASEADDR),
                          .SLAVE_MEM_SIZE(C_S_AXI_LITE_SLAVE_MEM_SIZE),
                          .MAX_OUTSTANDING_TRANSACTIONS(C_INTERCONNECT_S_AXI_LITE_READ_ACCEPTANCE),
                          .MEMORY_MODEL_MODE(C_S_AXI_LITE_MEMORY_MODEL_MODE)
                          ) 
cdn_axi4_lite_slave_bfm_inst(.ACLK(S_AXI_LITE_ACLK), 
                             .ARESETn(S_AXI_LITE_ARESETN), 
                             .AWADDR(S_AXI_LITE_AWADDR), 
                             .AWPROT(S_AXI_LITE_AWPROT), 
                             .AWVALID(S_AXI_LITE_AWVALID), 
                             .AWREADY(S_AXI_LITE_AWREADY),
                             .WDATA(S_AXI_LITE_WDATA), 
                             .WSTRB(S_AXI_LITE_WSTRB), 
                             .WVALID(S_AXI_LITE_WVALID),
                             .WREADY(S_AXI_LITE_WREADY),
                             .BRESP(S_AXI_LITE_BRESP), 
                             .BVALID(S_AXI_LITE_BVALID),
                             .BREADY(S_AXI_LITE_BREADY),
                             .ARADDR(S_AXI_LITE_ARADDR), 
                             .ARPROT(S_AXI_LITE_ARPROT), 
                             .ARVALID(S_AXI_LITE_ARVALID), 
                             .ARREADY(S_AXI_LITE_ARREADY),
                             .RDATA(S_AXI_LITE_RDATA), 
                             .RRESP(S_AXI_LITE_RRESP), 
                             .RVALID(S_AXI_LITE_RVALID), 
                             .RREADY(S_AXI_LITE_RREADY)
                           );

 initial begin
      reset_done = 0;
      cdn_axi4_lite_slave_bfm_inst.set_channel_level_info(1);

      // Wait for end of reset
      wait(S_AXI_LITE_ARESETN === 0) @(posedge S_AXI_LITE_ACLK);
      wait(S_AXI_LITE_ARESETN === 1) @(posedge S_AXI_LITE_ACLK);
      reset_done = 1;
      WRITE_BURST_RES_DONE = 0 ; READ_BURST_RES_DONE = 0;
      $monitor ("(%0t) :::: (SLAVE) :: Value for Write or Read burst have changed Write = %0d and Read=%0d",$time,WRITE_BURST_RES,READ_BURST_RES);

  end
  always @(posedge S_AXI_LITE_ACLK) begin
          if(REPORT_STATUS == 1 && reset_done == 1)  begin
                  NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING = cdn_axi4_lite_slave_bfm_inst.report_status(0);
                  REPORT_STATUS_DONE = 1;
          end
  end

  always @(posedge S_AXI_LITE_ACLK) begin
      
      if(WRITE_BURST_RES == 1 && reset_done == 1 ) begin
                WRITE_BURST_RES_DONE = 0 ;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (WRITE BURST RESPONDE ) for SLAVE ID = %0d:",WRITE_ID_TAG);
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");   
                cdn_axi4_lite_slave_bfm_inst.WRITE_BURST_RESPOND(WRITE_ID_TAG,
                                                                 ADDRVALID,
                                                                 WR_DATA,
                                                                 STESTDATASIZE);

                $display("EXAMPLE TEST : SLAVE WRITE DATA = 0x%h",WR_DATA);
                WRITE_BURST_RES_DONE = 1;
      end
      
      if(READ_BURST_RES == 1 && reset_done == 1 ) begin
                READ_BURST_RES_DONE = 0 ;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (READ BURST RESPONDE ) for SLAVE ID = %0d:",READ_ID_TAG);
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");   
                cdn_axi4_lite_slave_bfm_inst.READ_BURST_RESPOND(READ_ID_TAG,
                                                                ADDRVALID,
                                                                RESP_DATA);
                $display("EXAMPLE TEST : SLAVE RESP DATA = 0x%h",RESP_DATA);
                READ_BURST_RES_DONE = 1 ;
      end
      
      if(WRITE_BURST_RESP_CTRL == 1 && reset_done == 1 ) begin
                WRITE_BURST_RESP_CTRL_DONE = 0 ;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (WRITE_BURST_RESP_CTRL) for SLAVE ID = %0d:",READ_ID_TAG);
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");   
                cdn_axi4_lite_slave_bfm_inst.WRITE_BURST_RESP_CTRL(READ_ID_TAG,
                                                                   ADDRVALID,
                                                                   RESPONSE,
                                                                   WR_DATA,
                                                                   STESTDATASIZE); 
                $display("EXAMPLE TEST : SLAVE WRITE_BURST_RESP_CTRL DATA = 0x%h",WR_DATA);
                WRITE_BURST_RESP_CTRL_DONE = 1 ;
      end
      if(READ_BURST_RESP_CTRL == 1 && reset_done == 1 ) begin
                READ_BURST_RESP_CTRL_DONE = 0 ;
                $display("---------------------------------------------------------");
                $display("EXAMPLE TEST (READ_BURST_RESP_CTRL) for SLAVE ID = %0d:",READ_ID_TAG);
                $display("Simple sequential write and read burst transfers example");
                $display("---------------------------------------------------------");   
                cdn_axi4_lite_slave_bfm_inst.READ_BURST_RESP_CTRL(READ_ID_TAG,
                                                                  ADDRVALID,
                                                                  RESP_DATA,
                                                                  ERROR_RESPONSE);
                
                $display("EXAMPLE TEST : SLAVE RESP DATA = 0x%h",RESP_DATA);
                READ_BURST_RESP_CTRL_DONE = 1 ;
      end

      if (SET_READ_RESPONSE_GAP == 1) begin
              cdn_axi4_lite_slave_bfm_inst.set_read_response_gap(GAP_DATA);
      end

      if(SET_WRITE_RESPONSE_GAP == 1) begin
              cdn_axi4_lite_slave_bfm_inst.set_write_response_gap(GAP_DATA);
      end

      end
        
always @(posedge S_AXI_LITE_ACLK) begin
         PENDING_TRANSACTIONS_COUNT = cdn_axi4_lite_slave_bfm_inst.pending_transactions_count;
end
                              
endmodule

