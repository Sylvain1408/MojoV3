-- (c) Copyright 2011 - 2012 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--library verilog;
--use verilog.vl_types.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

library work;
use work.all;


package cdn_axi4_streaming_example is

      constant  C_M_AXIS_NAME                           : string  := "MASTER_0";
      constant  C_M_AXIS_TDATA_WIDTH                    : integer := 32;
      constant  C_M_AXIS_TID_WIDTH                      : integer := 8;
      constant  C_M_AXIS_TDEST_WIDTH                    : integer := 4;
      constant  C_M_AXIS_TUSER_WIDTH                    : integer := 8;
      constant  C_M_AXIS_MAX_PACKET_SIZE                : integer := 10;
      constant  C_INTERCONNECT_M_AXIS_READ_ISSUING      : integer := 8;
      constant  C_INTERCONNECT_M_AXIS_WRITE_ISSUING     : integer := 8;
      constant  C_M_AXIS_STROBE_NOT_USED                : integer := 0;
      constant  C_M_AXIS_KEEP_NOT_USED                  : integer := 0;
      constant  C_S_AXIS_NAME                           : string := "SLAVE_0";
      constant  C_S_AXIS_TDATA_WIDTH                    : integer := 32;
      constant  C_S_AXIS_TID_WIDTH                      : integer := 8;
      constant  C_S_AXIS_TDEST_WIDTH                    : integer := 4;
      constant  C_S_AXIS_TUSER_WIDTH                    : integer := 8;
      constant  C_S_AXIS_MAX_PACKET_SIZE                : integer := 10;
      constant  C_INTERCONNECT_S_AXIS_READ_ACCEPTANCE   : integer := 8;
      constant  C_INTERCONNECT_S_AXIS_WRITE_ACCEPTANCE  : integer := 8;
      constant  C_S_AXIS_STROBE_NOT_USED                : integer := 0;
      constant  C_S_AXIS_KEEP_NOT_USED                  : integer := 0;
      constant  ID_BUS_WIDTH                            : integer := 8;
      constant  DEST_BUS_WIDTH                          : integer := 4;
      constant  USER_BUS_WIDTH                          : integer := 8;
      constant  MAX_PACKET_SIZE                         : integer := 10;
      constant  CLK_PER                                 : time    :=  20 ns; -- 100 MHz clk

      -- SIGNAL DECLARATION
      signal M_AXIS_ACLK           : std_logic          := '0'                                          ;
      signal M_AXIS_ARESETN        : std_logic          := '0'                                          ;
      signal M_AXIS_TVALID         : std_logic                                                          ;
      signal M_AXIS_TREADY         : std_logic                                                          ;
      signal M_AXIS_TDATA          : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0)                  ;
      signal M_AXIS_TSTRB          : std_logic_vector(3 downto 0)                                       ;
      signal M_AXIS_TKEEP          : std_logic_vector(3 downto 0)                                       ;
      signal M_AXIS_TLAST          : std_logic                                                          ;
      signal M_AXIS_TID            : std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0)                    ;
      signal M_AXIS_TDEST          : std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0)                  ;
      signal M_AXIS_TUSER          : std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0)                  ; 
      signal MTESTID               : std_logic_vector(ID_BUS_WIDTH-1 downto 0)                                 ;  
      signal MTESTDEST             : std_logic_vector(DEST_BUS_WIDTH-1 downto 0)                               ;
      signal MTESTDATA             : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0)                         ;
      signal MTESTSTRB             : std_logic_vector(3 downto 0)                                              ;
      signal MTESTKEEP             : std_logic_vector(3 downto 0)                                              ;
      signal MTESTUSER             : std_logic_vector(USER_BUS_WIDTH-1 downto 0)                               ;
      signal MTESTDATASIZE         : std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0)                         ;
      signal V_MTESTDATA           : std_logic_vector((C_M_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)     ;
      signal V_MTESTUSER           : std_logic_vector((USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)           ;
      signal MTESTLAST             : std_logic                                                          ;
      signal SEND_TRANSFER         : std_logic                                                          ;
      signal SEND_PACKET           : std_logic                                                          ;
      signal SEND_TRANSFER_DONE    : std_logic                                                          ;
      signal SEND_PACKET_DONE      : std_logic                                                          ; 
      signal SET_PACKET_TRANSFER_GAP : std_logic                                                        ;
      signal GAP_DATA                : std_logic_vector(3 downto 0)                                     ;
      signal S_AXIS_ACLK           : std_logic              := '0'                                      ;
      signal S_AXIS_ARESETN        : std_logic              := '0'                                      ;
      signal S_AXIS_TVALID         : std_logic                                                          ;
      signal S_AXIS_TREADY         : std_logic                                                          ;
      signal S_AXIS_TDATA          : std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0)                        ;
      signal S_AXIS_TSTRB          : std_logic_vector(3 downto 0)                                             ;
      signal S_AXIS_TKEEP          : std_logic_vector(3 downto 0)                                             ;
      signal S_AXIS_TLAST          : std_logic                                                                ;
      signal S_AXIS_TID            : std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0)                          ;
      signal S_AXIS_TDEST          : std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0)                        ;
      signal S_AXIS_TUSER          : std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0)                        ;
      signal STESTID               : std_logic_vector(ID_BUS_WIDTH-1 downto 0)                                ;  
      signal STESTDEST             : std_logic_vector(DEST_BUS_WIDTH-1 downto 0)                              ;
      signal PID                   : std_logic_vector(ID_BUS_WIDTH-1 downto 0)                                ;  
      signal PDEST                 : std_logic_vector(DEST_BUS_WIDTH-1 downto 0)                              ;
      signal STESTDATA             : std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0)                        ;
      signal STESTSTRB             : std_logic_vector(3 downto 0)                                             ;
      signal STESTKEEP             : std_logic_vector(3 downto 0)                                             ;
      signal STESTUSER             : std_logic_vector(USER_BUS_WIDTH-1 downto 0)                              ;
      signal STESTDATASIZE         : std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0)                        ;
      signal V_STESTDATA           : std_logic_vector((C_S_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)    ;
      signal V_STESTUSER           : std_logic_vector((USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)          ;
      signal STESTLAST             : std_logic                                                                ;
      signal RECEIVE_TRANSFER      : std_logic                                                                ;
      signal RECEIVE_TRANSFER_DONE : std_logic                                                                ;
      signal RECEIVE_PACKET        : std_logic                                                                ;
      signal RECEIVE_PACKET_DONE   : std_logic                                                                ;
      signal IDVALID               : std_logic                                                                ;
      signal DESTVALID             : std_logic                                                                ;
      signal REPORT_STATUS                     : std_logic    ;
      signal REPORT_STATUS_DONE                : std_logic    ;
      signal NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : std_logic;
      signal S_REPORT_STATUS                     : std_logic    := '0' ;
      signal S_REPORT_STATUS_DONE                : std_logic    ;
      signal S_NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : std_logic;
      
      signal   M_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : std_logic := '0';
      signal   S_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : std_logic := '0';

      signal   TEST_1_DONE : std_logic := '0';

      -- REPORT_MASTER_STATUS
      PROCEDURE  REPORT_MASTER_STATUS (signal NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : IN std_logic;
                                       variable test                                     : IN integer) ;
      -- REPORT_SLAVE_STATUS
      PROCEDURE  REPORT_SLAVE_STATUS (signal NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : IN std_logic;
                                      variable test                                     : IN integer) ;

      -- Procedures
      PROCEDURE STOP_SIMULATION ;
      
      -- COMPARE TID
      PROCEDURE COMPARE_TID (variable PID_EXP_C : IN std_logic_vector (ID_BUS_WIDTH-1 downto 0);
                             variable PID_ACT_C : IN std_logic_vector (ID_BUS_WIDTH-1 downto 0));
             
      -- COMPATE TDEST       
      PROCEDURE COMPARE_TDEST (variable TDEST_EXP : IN std_logic_vector (DEST_BUS_WIDTH-1 downto 0);
                               variable TDEST_ACT : IN std_logic_vector (DEST_BUS_WIDTH-1 downto 0));
 
      -- COMPARE DATA
      PROCEDURE COMPARE_TDATA (variable TDATA_EXP : IN std_logic_vector (C_M_AXIS_TDATA_WIDTH-1 downto 0);
                               variable TDATA_ACT : IN std_logic_vector (C_M_AXIS_TDATA_WIDTH-1 downto 0));
  
      --COMPARE_TSTRB--STESTSTRB
      PROCEDURE COMPARE_TSTRB (variable TSTRB_EXP : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
                               variable TSTRB_ACT : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0)) ;
  
      --COMPARE_TKEEP--STESTKEEP
      PROCEDURE COMPARE_TKEEP (variable TKEEP_EXP : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
                               variable TKEEP_ACT : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0)) ;
      --COMPARE_TLAST--STESTLAST
      PROCEDURE COMPARE_TLAST (variable TLAST_EXP : IN std_logic;
                               variable TLAST_ACT : IN std_logic) ;
      --COMPARE_TUSER--STESTUSER
      PROCEDURE COMPARE_TUSER (variable TUSER_EXP : IN std_logic_vector (USER_BUS_WIDTH-1 downto 0);
                               variable TUSER_ACT : IN std_logic_vector (USER_BUS_WIDTH-1 downto 0)) ;
      --COMPARE_DATASIZE
      PROCEDURE COMPARE_TDATASIZE (variable TDATASIZE_EXP : IN std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);
                                   variable TDATASIZE_ACT : IN std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0)) ;
      
      --COMPARE_TDATA_VECTOR--STESTUSER C_M_AXIS_TDATA_WIDTH 
      PROCEDURE COMPARE_TDATA_VECTOR (variable TDATA_VECTOR_EXP : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1 downto 0);
                                      variable TDATA_VECTOR_ACT : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1 downto 0);
                                      variable DATASIZE         : IN integer);
      
      --COMPARE_TUSER_VECTOR--STESTUSER 
      PROCEDURE COMPARE_TUSER_VECTOR (variable TUSER_VECTOR_EXP : IN std_logic_vector ((USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1 downto 0);
                                      variable TUSER_VECTOR_ACT : IN std_logic_vector ((USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1 downto 0));

      component cdn_axi4_streaming_master_bfm_wrap is
          generic(
                   C_M_AXIS_NAME                       : string  := "MASTER_0";
                   C_M_AXIS_TDATA_WIDTH                : integer := 32;
                   C_M_AXIS_TID_WIDTH                  : integer := 8;
                   C_M_AXIS_TDEST_WIDTH                : integer := 4;
                   C_M_AXIS_TUSER_WIDTH                : integer := 8;
                   C_M_AXIS_MAX_PACKET_SIZE            : integer := 10;
                   C_INTERCONNECT_M_AXIS_READ_ISSUING  : integer := 8;
                   C_INTERCONNECT_M_AXIS_WRITE_ISSUING : integer := 8;
                   C_M_AXIS_STROBE_NOT_USED            : integer := 0;
                   C_M_AXIS_KEEP_NOT_USED              : integer := 0
               );
          port(
                   M_AXIS_ACLK          :  in  std_logic                                           ; 
                   M_AXIS_ARESETN       :  in  std_logic                                           ;
                   M_AXIS_TVALID        :  out std_logic                                           ;  -- Master Transfer Valid.
                   M_AXIS_TREADY        :  in  std_logic                                           ;  -- Slave Transfer Ready.
                   M_AXIS_TDATA         :  out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0)   ;  -- Master Transfer Data. 
                   M_AXIS_TSTRB         :  out std_logic_vector(3 downto 0)                        ;  -- Master Transfer Strobe. 
                   M_AXIS_TKEEP         :  out std_logic_vector(3 downto 0)                        ;  -- Master Transfer Keep.
                   M_AXIS_TLAST         :  out std_logic                                           ;  -- Master Transfer Last Flag.
                   M_AXIS_TID           :  out std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0)     ;  -- Master Transfer ID Tag. 
                   M_AXIS_TDEST         :  out std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0)   ;  -- Master Transfer Destination. 
                   M_AXIS_TUSER         :  out std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0)   ;  -- Master Transfer User Defined. 
                   MTESTID              :  in  std_logic_vector(ID_BUS_WIDTH-1 downto 0)                                 ;  
                   MTESTDEST            :  in  std_logic_vector(DEST_BUS_WIDTH-1 downto 0)                               ;
                   MTESTDATA            :  in  std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0)                         ;
                   MTESTSTRB            :  in  std_logic_vector(3 downto 0)                                              ;
                   MTESTKEEP            :  in  std_logic_vector(3 downto 0)                                              ;
                   MTESTUSER            :  in  std_logic_vector(USER_BUS_WIDTH-1 downto 0)                               ;
                   MTESTDATASIZE        :  in  std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0)                         ;
                   V_MTESTDATA          :  in  std_logic_vector((C_M_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)     ;
                   V_MTESTUSER          :  in  std_logic_vector((USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)           ;
                   MTESTLAST            :  in  std_logic                                                                 ;
                   SEND_TRANSFER        :  in  std_logic                                                                 ;
                   SEND_PACKET          :  in  std_logic                                                                 ;
                   SEND_TRANSFER_DONE   :  out std_logic                                                                 ;
                   SEND_PACKET_DONE     :  out std_logic                                                                 ;
                   SET_PACKET_TRANSFER_GAP : in  std_logic                                                               ;
                   GAP_DATA                : in  std_logic_vector(3 downto 0)                                            ;
                   REPORT_STATUS                     : in  std_logic    ;
                   REPORT_STATUS_DONE                : out std_logic    ;
                   NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : out std_logic
          );
          end component;
          
      component cdn_axi4_streaming_slave_bfm_wrap is
          generic(
                C_S_AXIS_NAME                           : string := "SLAVE_0";
                C_S_AXIS_TDATA_WIDTH                    : integer := 32;
                C_S_AXIS_TID_WIDTH                      : integer := 8;
                C_S_AXIS_TDEST_WIDTH                    : integer := 4;
                C_S_AXIS_TUSER_WIDTH                    : integer := 8;
                C_S_AXIS_MAX_PACKET_SIZE                : integer := 10;
                C_INTERCONNECT_S_AXIS_READ_ACCEPTANCE   : integer := 8;
                C_INTERCONNECT_S_AXIS_WRITE_ACCEPTANCE  : integer := 8;
                C_S_AXIS_STROBE_NOT_USED                : integer := 0;
                C_S_AXIS_KEEP_NOT_USED                  : integer := 0
           );
          port(
               S_AXIS_ACLK     : in  std_logic                                               ;
               S_AXIS_ARESETN  : in  std_logic                                               ;
               S_AXIS_TVALID   : in  std_logic                                               ; -- Master Transfer Valid.
               S_AXIS_TREADY   : out std_logic                                               ; -- Slave  Transfer Ready.
               S_AXIS_TDATA    : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0)       ; -- Master Transfer Data. 
               S_AXIS_TSTRB    : in  std_logic_vector(3 downto 0)                            ; -- Master Transfer Strobe. 
               S_AXIS_TKEEP    : in  std_logic_vector(3 downto 0)                            ; -- Master Transfer Keep.
               S_AXIS_TLAST    : in  std_logic                                               ; -- Master Transfer Last Flag.
               S_AXIS_TID      : in  std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0)         ; -- Master Transfer ID Tag. 
               S_AXIS_TDEST    : in  std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0)       ; -- Master Transfer Destination. 
               S_AXIS_TUSER    : in  std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0)       ; -- Master Transfer User Defined. 
               STESTID               : in  std_logic_vector(ID_BUS_WIDTH-1 downto 0)                                ;  
               STESTDEST             : in  std_logic_vector(DEST_BUS_WIDTH-1 downto 0)                              ;
               PID                   : out std_logic_vector(ID_BUS_WIDTH-1 downto 0)                                ;  
               PDEST                 : out std_logic_vector(DEST_BUS_WIDTH-1 downto 0)                              ;
               STESTDATA             : out std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0)                        ;
               STESTSTRB             : out std_logic_vector(3 downto 0)                                             ;
               STESTKEEP             : out std_logic_vector(3 downto 0)                                             ;
               STESTUSER             : out std_logic_vector(USER_BUS_WIDTH-1 downto 0)                              ;
               STESTDATASIZE         : out std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0)                        ;
               V_STESTDATA           : out std_logic_vector((C_S_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)    ;
               V_STESTUSER           : out std_logic_vector((USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)          ;
               STESTLAST             : out std_logic                                                         ;
               RECEIVE_TRANSFER      : in  std_logic                                                         ;
               RECEIVE_TRANSFER_DONE : out std_logic                                                         ;
               RECEIVE_PACKET        : in  std_logic                                                         ;
               RECEIVE_PACKET_DONE   : out std_logic                                                         ;
               IDVALID               : in  std_logic                                                         ;
               DESTVALID             : in  std_logic                                                         ; 
               REPORT_STATUS                       : in  std_logic                                           ;
               REPORT_STATUS_DONE                  : out std_logic                                           ;
               NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : out std_logic
           );
      end component;
end;


package body cdn_axi4_streaming_example is

   PROCEDURE STOP_SIMULATION is
         begin
         wait for 100 ns;
         assert false report "simulation ended" severity failure;
   end stop_simulation ;
   
   PROCEDURE COMPARE_TID (variable PID_EXP_C : IN std_logic_vector (ID_BUS_WIDTH-1 downto 0);
                          variable PID_ACT_C : IN std_logic_vector (ID_BUS_WIDTH-1 downto 0)) IS
          variable outline2 : line;
      BEGIN
   
      IF PID_EXP_C /= PID_ACT_C THEN
           REPORT "TESTBENCH ERROR! COMPARE_TID expected is not equal to actual. ";
           write(outline2, string'(" ACTUAL "));
           write(outline2, PID_ACT_C);
           write(outline2, string'(" EXPECTED "));
           write(outline2, PID_EXP_C);
           writeline(output,outline2);
           RETURN; -- Exit the procedure
      ELSE 
           write(outline2, string'("*****************************************"));
           write(outline2, string'("COMPARE_TID :: PASS"));
           write(outline2, string'("*****************************************"));
           writeline(output,outline2);
      END IF;
           writeline(output,outline2);
   
   END PROCEDURE COMPARE_TID;
   
   PROCEDURE COMPARE_TDEST (variable TDEST_EXP : IN std_logic_vector (DEST_BUS_WIDTH-1 downto 0);
                            variable TDEST_ACT : IN std_logic_vector (DEST_BUS_WIDTH-1 downto 0)) IS
          variable outline2 : line;
      BEGIN
   
      IF TDEST_EXP /= TDEST_ACT THEN
           REPORT "TESTBENCH ERROR! COMPARE_TDEST expected is not equal to actual. ";
           write(outline2, string'(" ACTUAL "));
           write(outline2, TDEST_ACT);
           write(outline2, string'(" EXPECTED "));
           write(outline2, TDEST_EXP);
           writeline(output,outline2);
           RETURN; -- Exit the procedure
      ELSE 
           write(outline2, string'("*****************************************"));
           write(outline2, string'("COMPARE_TDEST :: PASS"));
           write(outline2, string'("*****************************************"));
           writeline(output,outline2);
      END IF;
      writeline(output,outline2);
   
   END PROCEDURE COMPARE_TDEST;
   
   PROCEDURE COMPARE_TDATA (variable TDATA_EXP : IN std_logic_vector (C_M_AXIS_TDATA_WIDTH-1 downto 0);
                            variable TDATA_ACT : IN std_logic_vector (C_M_AXIS_TDATA_WIDTH-1 downto 0)) IS
          variable outline2 : line;
      BEGIN
   
      IF TDATA_EXP /= TDATA_ACT THEN
           REPORT "TESTBENCH ERROR! COMPARE_TDATA expected is not equal to actual. ";
           write(outline2, string'(" ACTUAL "));
           write(outline2, TDATA_ACT);
           write(outline2, string'(" EXPECTED "));
           write(outline2, TDATA_EXP);
           writeline(output,outline2);
           RETURN; -- Exit the procedure
      ELSE 
           write(outline2, string'("*****************************************"));
           write(outline2, string'("COMPARE_TDATA :: PASS"));
           write(outline2, string'("*****************************************"));
           writeline(output,outline2);
      END IF;
      writeline(output,outline2);
   
   END PROCEDURE COMPARE_TDATA;
   
   --COMPARE_TSTRB--STESTSTRB
   PROCEDURE COMPARE_TSTRB (variable TSTRB_EXP : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
                            variable TSTRB_ACT : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0)) IS
          variable outline2 : line;
      BEGIN
   
      IF TSTRB_EXP /= TSTRB_ACT THEN
           REPORT "TESTBENCH ERROR! COMPARE_TSTRB expected is not equal to actual. ";
           write(outline2, string'(" ACTUAL "));
           write(outline2, TSTRB_ACT);
           write(outline2, string'(" EXPECTED "));
           write(outline2, TSTRB_EXP);
           writeline(output,outline2);
           RETURN; -- Exit the procedure
      ELSE 
           write(outline2, string'("*****************************************"));
           write(outline2, string'("COMPARE_TSTRB :: PASS"));
           write(outline2, string'("*****************************************"));
           writeline(output,outline2);
      END IF;
      writeline(output,outline2);
   
   END PROCEDURE COMPARE_TSTRB;
   
   
   --COMPARE_TKEEP--STESTKEEP
   PROCEDURE COMPARE_TKEEP (variable TKEEP_EXP : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
                            variable TKEEP_ACT : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0)) IS
          variable outline2 : line;
      BEGIN
   
      IF TKEEP_EXP /= TKEEP_ACT THEN
           REPORT "TESTBENCH ERROR! COMPARE_TKEEP expected is not equal to actual. ";
           write(outline2, string'(" ACTUAL "));
           write(outline2, TKEEP_ACT);
           write(outline2, string'(" EXPECTED "));
           write(outline2, TKEEP_EXP);
           writeline(output,outline2);
           RETURN; -- Exit the procedure
      ELSE 
           write(outline2, string'("*****************************************"));
           write(outline2, string'("COMPARE_TKEEP :: PASS"));
           write(outline2, string'("*****************************************"));
           writeline(output,outline2);
      END IF;
      writeline(output,outline2);
   
   END PROCEDURE COMPARE_TKEEP;
   
   --COMPARE_TLAST--STESTLAST
   PROCEDURE COMPARE_TLAST (variable TLAST_EXP : IN std_logic;
                            variable TLAST_ACT : IN std_logic) IS
          variable outline2 : line;
      BEGIN
   
      IF TLAST_EXP /= TLAST_ACT THEN
           REPORT "TESTBENCH ERROR! COMPARE_TLAST expected is not equal to actual. ";
           write(outline2, string'(" ACTUAL "));
           write(outline2, TLAST_ACT);
           write(outline2, string'(" EXPECTED "));
           write(outline2, TLAST_EXP);
           writeline(output,outline2);
           RETURN; -- Exit the procedure
      ELSE 
           write(outline2, string'("*****************************************"));
           write(outline2, string'("COMPARE_TLAST :: PASS"));
           write(outline2, string'("*****************************************"));
           writeline(output,outline2);
      END IF;
      writeline(output,outline2);
   
   END PROCEDURE COMPARE_TLAST;
   
   --COMPARE_TUSER--STESTUSER
   PROCEDURE COMPARE_TUSER (variable TUSER_EXP : IN std_logic_vector (USER_BUS_WIDTH-1 downto 0);
                            variable TUSER_ACT : IN std_logic_vector (USER_BUS_WIDTH-1 downto 0)) IS
          variable outline2 : line;
      BEGIN
   
      IF TUSER_EXP /= TUSER_ACT THEN
           REPORT "TESTBENCH ERROR! COMPARE_TUSER expected is not equal to actual. ";
           write(outline2, string'(" ACTUAL "));
           write(outline2, TUSER_ACT);
           write(outline2, string'(" EXPECTED "));
           write(outline2, TUSER_EXP);
           writeline(output,outline2);
           RETURN; -- Exit the procedure
      ELSE 
           write(outline2, string'("*****************************************"));
           write(outline2, string'("COMPARE_TUSER :: PASS"));
           write(outline2, string'("*****************************************"));
           writeline(output,outline2);
      END IF;
      writeline(output,outline2);
   
   END PROCEDURE COMPARE_TUSER;

--COMPARE_DATASIZE
PROCEDURE COMPARE_TDATASIZE (variable TDATASIZE_EXP : IN std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);
                            variable TDATASIZE_ACT : IN std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0)) IS
       variable outline2 : line;
   BEGIN

   IF TDATASIZE_EXP /= TDATASIZE_ACT THEN
        REPORT "TESTBENCH ERROR! COMPARE_TDATASIZE expected is not equal to actual. ";
        write(outline2, string'(" ACTUAL "));
        write(outline2, TDATASIZE_EXP);
        write(outline2, string'(" EXPECTED "));
        write(outline2, TDATASIZE_ACT);
        writeline(output,outline2);
        RETURN; -- Exit the procedure
   ELSE 
        write(outline2, string'("*****************************************"));
        write(outline2, string'("COMPARE_TDATASIZE :: PASS"));
        write(outline2, string'("*****************************************"));
        writeline(output,outline2);
   END IF;
   writeline(output,outline2);

END PROCEDURE COMPARE_TDATASIZE;

--COMPARE_TDATA_VECTOR--STESTUSER C_M_AXIS_TDATA_WIDTH 
PROCEDURE COMPARE_TDATA_VECTOR (variable TDATA_VECTOR_EXP : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1 downto 0);
                                variable TDATA_VECTOR_ACT : IN std_logic_vector ((C_M_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1 downto 0);
                                variable DATASIZE         : IN integer ) IS
       variable outline2 : line;
       variable usb      : integer;
   BEGIN

        usb := (DATASIZE*8)-1;
        write(outline2, string'("*****************************************"));
        write(outline2, string'("FUNCTION COMPARE DATA  "));
        write(outline2, string'("DATASIZE : "));
        write(outline2, DATASIZE);
        write(outline2, string'(" Comparing data width (SIZE*8)) :"));
        write(outline2, usb);
        writeline(output,outline2);

   IF TDATA_VECTOR_EXP(usb downto 0) /= TDATA_VECTOR_ACT(usb downto 0) THEN
        write(outline2, string'(" ACTUAL "));
        write(outline2, TDATA_VECTOR_ACT(usb downto 0));
        writeline(output,outline2);
        write(outline2, string'(" EXPECTED "));
        write(outline2, TDATA_VECTOR_EXP(usb downto 0));
        writeline(output,outline2);
        write(outline2, string'("COMPARE_TDATA_VECTOR :: FAIL"));
        writeline(output,outline2);
        REPORT "TESTBENCH ERROR! COMPARE_TDATA_VECTOR expected is not equal to actual. ";
        RETURN; -- Exit the procedure
   ELSE 
        write(outline2, string'("*****************************************"));
        write(outline2, string'("COMPARE_TDATA_VECTOR :: PASS"));
        write(outline2, string'("*****************************************"));
        writeline(output,outline2);
   END IF;
   writeline(output,outline2);

END PROCEDURE COMPARE_TDATA_VECTOR;

--COMPARE_TUSER_VECTOR--STESTUSER 
PROCEDURE COMPARE_TUSER_VECTOR (variable TUSER_VECTOR_EXP : IN std_logic_vector ((USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1 downto 0);
                                variable TUSER_VECTOR_ACT : IN std_logic_vector ((USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)) IS
       variable outline2 : line;
   BEGIN

   IF TUSER_VECTOR_EXP /= TUSER_VECTOR_ACT THEN
        REPORT "TESTBENCH ERROR! COMPARE_TUSER_VECTOR expected is not equal to actual. ";
        write(outline2, string'(" ACTUAL "));
        write(outline2, TUSER_VECTOR_ACT);
        write(outline2, string'(" EXPECTED "));
        write(outline2, TUSER_VECTOR_EXP);
        writeline(output,outline2);
        RETURN; -- Exit the procedure
   ELSE 
        write(outline2, string'("*****************************************"));
        write(outline2, string'("COMPARE_TUSER_VECTOR :: PASS"));
        write(outline2, string'("*****************************************"));
        writeline(output,outline2);
   END IF;
   writeline(output,outline2);

END PROCEDURE COMPARE_TUSER_VECTOR;
--------------------------------------------------------------------------
-- TEST BENCH LEVEL API: REPORT_MASTER_STATUS
--------------------------------------------------------------------------
-- Description:
-- REPORT_MASTER_STATUS(number_of_expected_errors_warnings_and_pending)
-- This task calls the masters report_status function which returns the 
-- total of the errors + warnings + pending counters. This return number 
-- is compared with the input 
-- number_of_expected_errors_warnings_and_pending
--------------------------------------------------------------------------
PROCEDURE REPORT_MASTER_STATUS (signal NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : IN std_logic;
                                variable test                                     : IN integer ) IS 
       variable outline1 : line;
BEGIN
   If NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING /= NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING THEN
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'("EXAMPLE TEST "));
        write(outline1, test);
        write(outline1, string'("  : MASTER FAILED"));
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);

        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'(" EXPECTED  : "));
        write(outline1, NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING);
        writeline(output,outline1);
        write(outline1, string'(" ACTUAL (MASTER) : "));
        write(outline1, NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING);
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
   ELSE 
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'("EXAMPLE TEST "));
        write(outline1, test);
        write(outline1, string'("  : MASTER PASSED"));
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);

   END IF;

END PROCEDURE REPORT_MASTER_STATUS;

--------------------------------------------------------------------------
-- TEST BENCH LEVEL API: REPORT_SLAVE_STATUS
--------------------------------------------------------------------------
-- Description:
-- REPORT_SLAVE_STATUS(number_of_expected_errors_warnings_and_pending)
-- This task calls the slaves report_status function which returns the 
-- total of the errors + warnings + pending counters. This return number 
-- is compared with the input 
-- number_of_expected_errors_warnings_and_pending
--------------------------------------------------------------------------
PROCEDURE REPORT_SLAVE_STATUS (signal NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : IN std_logic;
                                variable test                                     : IN integer ) IS 
       variable outline1 : line;
BEGIN
   If NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING /= S_NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING THEN
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'("EXAMPLE TEST "));
        write(outline1, test);
        write(outline1, string'("  : SLAVE FAILED"));
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);

        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'(" EXPECTED  : "));
        write(outline1, NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING);
        writeline(output,outline1);
        write(outline1, string'(" ACTUAL (MASTER) : "));
        write(outline1, S_NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING);
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
   ELSE 
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'("EXAMPLE TEST "));
        write(outline1, test);
        write(outline1, string'("  : SLAVE PASSED"));
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);

   END IF;

END PROCEDURE REPORT_SLAVE_STATUS;
--------------------------------------------------------------------------

end package body;

