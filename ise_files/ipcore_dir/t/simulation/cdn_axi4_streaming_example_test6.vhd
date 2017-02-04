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

use work.cdn_axi4_streaming_example.all;

entity cdn_axi4_streaming_example_testbench is 
end entity; 


architecture rtl of cdn_axi4_streaming_example_testbench is 

begin
    master_0:work.cdn_axi4_streaming_example.cdn_axi4_streaming_master_bfm_wrap
    generic map (
                C_M_AXIS_NAME                       => C_M_AXIS_NAME                       ,
                C_M_AXIS_TDATA_WIDTH                => C_M_AXIS_TDATA_WIDTH                ,
                C_M_AXIS_TID_WIDTH                  => C_M_AXIS_TID_WIDTH                  ,
                C_M_AXIS_TDEST_WIDTH                => C_M_AXIS_TDEST_WIDTH                ,
                C_M_AXIS_TUSER_WIDTH                => C_M_AXIS_TUSER_WIDTH                ,
                C_M_AXIS_MAX_PACKET_SIZE            => C_M_AXIS_MAX_PACKET_SIZE            ,
                C_INTERCONNECT_M_AXIS_READ_ISSUING  => C_INTERCONNECT_M_AXIS_READ_ISSUING  ,
                C_INTERCONNECT_M_AXIS_WRITE_ISSUING => C_INTERCONNECT_M_AXIS_WRITE_ISSUING ,
                C_M_AXIS_STROBE_NOT_USED            => C_M_AXIS_STROBE_NOT_USED            ,
                C_M_AXIS_KEEP_NOT_USED              => C_M_AXIS_KEEP_NOT_USED              
       )
    port map    (
                M_AXIS_ACLK          =>  M_AXIS_ACLK          ,
                M_AXIS_ARESETN       =>  M_AXIS_ARESETN       ,
                M_AXIS_TVALID        =>  M_AXIS_TVALID        ,
                M_AXIS_TREADY        =>  M_AXIS_TREADY        ,
                M_AXIS_TDATA         =>  M_AXIS_TDATA         ,
                M_AXIS_TSTRB         =>  M_AXIS_TSTRB         ,
                M_AXIS_TKEEP         =>  M_AXIS_TKEEP         ,
                M_AXIS_TLAST         =>  M_AXIS_TLAST         ,
                M_AXIS_TID           =>  M_AXIS_TID           ,
                M_AXIS_TDEST         =>  M_AXIS_TDEST         ,
                M_AXIS_TUSER         =>  M_AXIS_TUSER         ,
                MTESTID              =>  MTESTID              ,
                MTESTDEST            =>  MTESTDEST            ,
                MTESTDATA            =>  MTESTDATA            ,
                MTESTSTRB            =>  MTESTSTRB            ,
                MTESTKEEP            =>  MTESTKEEP            ,
                MTESTUSER            =>  MTESTUSER            ,
                MTESTDATASIZE        =>  MTESTDATASIZE        ,
                V_MTESTDATA          =>  V_MTESTDATA          ,
                V_MTESTUSER          =>  V_MTESTUSER          ,
                MTESTLAST            =>  MTESTLAST            ,
                SEND_TRANSFER        =>  SEND_TRANSFER        ,
                SEND_PACKET          =>  SEND_PACKET          ,
                SEND_TRANSFER_DONE   =>  SEND_TRANSFER_DONE   ,
                SEND_PACKET_DONE     =>  SEND_PACKET_DONE     ,      
                SET_PACKET_TRANSFER_GAP => SET_PACKET_TRANSFER_GAP,
                GAP_DATA                => GAP_DATA           ,
                REPORT_STATUS                     =>  REPORT_STATUS ,
                REPORT_STATUS_DONE                =>  REPORT_STATUS_DONE,
                NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING => NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
     );

    slave_0:work.cdn_axi4_streaming_example.cdn_axi4_streaming_slave_bfm_wrap
    generic map (
                 C_S_AXIS_NAME                           => C_S_AXIS_NAME                           ,
                 C_S_AXIS_TDATA_WIDTH                    => C_S_AXIS_TDATA_WIDTH                    ,
                 C_S_AXIS_TID_WIDTH                      => C_S_AXIS_TID_WIDTH                      ,
                 C_S_AXIS_TDEST_WIDTH                    => C_S_AXIS_TDEST_WIDTH                    ,
                 C_S_AXIS_TUSER_WIDTH                    => C_S_AXIS_TUSER_WIDTH                    ,
                 C_S_AXIS_MAX_PACKET_SIZE                => C_S_AXIS_MAX_PACKET_SIZE                ,
                 C_INTERCONNECT_S_AXIS_READ_ACCEPTANCE   => C_INTERCONNECT_S_AXIS_READ_ACCEPTANCE   ,
                 C_INTERCONNECT_S_AXIS_WRITE_ACCEPTANCE  => C_INTERCONNECT_S_AXIS_WRITE_ACCEPTANCE  ,
                 C_S_AXIS_STROBE_NOT_USED                => C_S_AXIS_STROBE_NOT_USED                ,
                 C_S_AXIS_KEEP_NOT_USED                  => C_S_AXIS_KEEP_NOT_USED                     
    )
    port map    (
                S_AXIS_ACLK           =>  S_AXIS_ACLK           ,
                S_AXIS_ARESETN        =>  S_AXIS_ARESETN        ,
                S_AXIS_TVALID         =>  M_AXIS_TVALID         ,
                S_AXIS_TREADY         =>  M_AXIS_TREADY         ,
                S_AXIS_TDATA          =>  M_AXIS_TDATA          ,
                S_AXIS_TSTRB          =>  M_AXIS_TSTRB          ,
                S_AXIS_TKEEP          =>  M_AXIS_TKEEP          ,
                S_AXIS_TLAST          =>  M_AXIS_TLAST          ,
                S_AXIS_TID            =>  M_AXIS_TID            ,
                S_AXIS_TDEST          =>  M_AXIS_TDEST          ,
                S_AXIS_TUSER          =>  M_AXIS_TUSER          ,
                STESTID               =>  STESTID               ,
                STESTDEST             =>  STESTDEST             ,
                PID                   =>  PID                   ,
                PDEST                 =>  PDEST                 ,
                STESTDATA             =>  STESTDATA             ,
                STESTSTRB             =>  STESTSTRB             ,
                STESTKEEP             =>  STESTKEEP             ,
                STESTUSER             =>  STESTUSER             ,
                STESTDATASIZE         =>  STESTDATASIZE         ,
                V_STESTDATA           =>  V_STESTDATA           ,
                V_STESTUSER           =>  V_STESTUSER           ,
                STESTLAST             =>  STESTLAST             ,
                RECEIVE_TRANSFER      =>  RECEIVE_TRANSFER      ,
                RECEIVE_TRANSFER_DONE =>  RECEIVE_TRANSFER_DONE ,
                RECEIVE_PACKET        =>  RECEIVE_PACKET        ,
                RECEIVE_PACKET_DONE   =>  RECEIVE_PACKET_DONE   ,
                IDVALID               =>  IDVALID               ,
                DESTVALID             =>  DESTVALID             ,
                REPORT_STATUS                       =>  S_REPORT_STATUS                      ,
                REPORT_STATUS_DONE                  =>  S_REPORT_STATUS_DONE                 ,
                NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING => S_NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
    );
            -----------------------------------------------------------------------
            -- Master Clock Generation
            -----------------------------------------------------------------------
           process begin
            wait for (clk_per/2);
            M_AXIS_ACLK <= not M_AXIS_ACLK;
            end process;
            
            -----------------------------------------------------------------------
            -- Slave Clock Generation
            -----------------------------------------------------------------------
            process begin
            wait for (clk_per/2);
            S_AXIS_ACLK <= not S_AXIS_ACLK;
            end process;

            -----------------------------------------------------------------------
            -- Slave Reset Generation
            -----------------------------------------------------------------------
            process 
              begin
                  S_AXIS_ARESETN <= '1';
                  wait for 10 ns;
                  S_AXIS_ARESETN <= '0';
						      wait for 50 ns;
						      wait until S_AXIS_ACLK = '1';
                  S_AXIS_ARESETN  <= '1';
              wait;
            end process;

            -----------------------------------------------------------------------
            -- Master Reset Generation
            -----------------------------------------------------------------------
            process 
            begin
                M_AXIS_ARESETN <= '1';
                wait for 10 ns;
                M_AXIS_ARESETN <= '0';
				    		wait for 50 ns;
				    		wait until M_AXIS_ACLK = '1';
                M_AXIS_ARESETN  <= '1';
                wait ;
            end process;

            -----------------------------------------------------------------------
            -- EXAMPLE TEST 6:
            -- Packet Data Interleaving example
            -- DESCRIPTION:
            -- The following master code sends 3 packets interleaved
            -----------------------------------------------------------------------
            process 
               variable outline2          : line;
               variable index             : integer;
               variable a                 : integer ;
               variable b                 : integer ;
               variable val               : std_logic_vector(7 downto 0);
               variable C_MTESTDATA       : std_logic_vector((C_M_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)    := (others=>'0') ;
               variable C_MTESTUSER       : std_logic_vector((USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)          := (others=>'0') ;

            begin
            SET_PACKET_TRANSFER_GAP <= '1';
            GAP_DATA                <= "0010";
            MTESTDATASIZE <= "00101000"  ; 
            
            --- V_MTESTUSER
            index :=   ((USER_BUS_WIDTH*(MAX_PACKET_SIZE))/8)-1;
            val   := "00000000";
            for j in 0 to index loop
               a := (j*8+8)-1;
               b := j*8;
               C_MTESTUSER(a downto b) := val+j;
            end loop;
            V_MTESTUSER <= C_MTESTUSER;
            -----------------------------------------------------------------------

            -- V_MTESTDATA
            index :=    (((C_M_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))/8)-1);
            for j in 0 to index loop
               a := (j*8+8)-1;
               b := j*8;
                C_MTESTDATA(a downto b) := val+j;
            end loop;
            V_MTESTDATA <= C_MTESTDATA;
            -----------------------------------------------------------------------

            -----------------------------------------------------------------------
            MTESTDEST <= "0001"; 
            MTESTID <=  "00000001"; 
            SEND_PACKET <= '1';
            wait until SEND_PACKET_DONE = '1';
            SEND_PACKET <= '0';
            -----------------------------------------------------------------------
            
            -----------------------------------------------------------------------
            MTESTDEST <= "0010"; 
            MTESTID <=  "00000010"; 
            SEND_PACKET <= '1';
            wait until SEND_PACKET_DONE = '1';
            SEND_PACKET <= '0';
            -----------------------------------------------------------------------
            
            -----------------------------------------------------------------------
            MTESTDEST <= "0011"; 
            MTESTID <=  "00000011"; 
            SEND_PACKET <= '1';
            wait until SEND_PACKET_DONE = '1';
            SEND_PACKET <= '0';
            -----------------------------------------------------------------------
            
            wait ;
            end process;
            
            process 
               variable PID_ACT        : std_logic_vector(ID_BUS_WIDTH-1       downto 0)        := (others=>'0')  ;
               variable PID_EXP        : std_logic_vector(ID_BUS_WIDTH-1       downto 0)        := (others=>'0')  ;
               variable TDEST_ACT      : std_logic_vector(DEST_BUS_WIDTH-1     downto 0)        := (others=>'0')  ;
               variable TDATA_ACT      : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1     downto 0)  := (others=>'0')  ;
               variable TSTRB_ACT      : std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0)  := (others=>'0')  ;
               variable TKEEP_ACT      : std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0)  := (others=>'0')  ;
               variable TLAST_ACT      : std_logic                                              := '0'            ;
               variable TUSER_ACT      : std_logic_vector(USER_BUS_WIDTH-1 downto 0)            := (others=>'0')  ;
               variable TDEST_EXP      : std_logic_vector(DEST_BUS_WIDTH-1     downto 0)        := (others=>'0')  ;
               variable TDATA_EXP      : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1     downto 0)  := (others=>'0')  ;
               variable TSTRB_EXP      : std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0)  := (others=>'0')  ;
               variable TKEEP_EXP      : std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0)  := (others=>'0')  ;
               variable TLAST_EXP      : std_logic                                              := '0'            ;
               variable TUSER_EXP      : std_logic_vector(USER_BUS_WIDTH-1 downto 0)            := (others=>'0')  ;
               
               variable TDATASIZE_EXP      : std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0) := (others=>'0')  ;
               variable TDATASIZE_ACT      : std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0) := (others=>'0')  ;
               variable TDATA_VECTOR_EXP   : std_logic_vector ((C_M_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1 downto 0) := (others=>'0')  ;
               variable TDATA_VECTOR_ACT   : std_logic_vector ((C_M_AXIS_TDATA_WIDTH*(MAX_PACKET_SIZE))-1 downto 0) := (others=>'0')  ;
               variable TUSER_VECTOR_ACT   :  std_logic_vector ((USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)       := (others=>'0')  ;
               variable TUSER_VECTOR_EXP   :  std_logic_vector ((USER_BUS_WIDTH*(MAX_PACKET_SIZE))-1 downto 0)       := (others=>'0')  ;
               variable outline2 : line;
               variable TEST           : integer ; 
               variable DATA_SIZE      : integer ;
               variable outline1       : line;
            begin
            -----------------------------------------------------------------------
            -- EXAMPLE TEST 6:
            -- Packet Data Interleaving
            -- DESCRIPTION:
            -- The following slave code receives a set of 3 interleaved AXI 4 
            -- Streaming packets.
            -----------------------------------------------------------------------
               STESTID  <=  "00000001" ;
               STESTDEST <=  "0001"  ; 
               IDVALID    <= '1';        
               DESTVALID  <= '1';           
               TEST       := 6;
               DATA_SIZE  := 40;       

               RECEIVE_PACKET<= '1';
               wait until RECEIVE_PACKET_DONE = '1';
               RECEIVE_PACKET<= '0';
               
               PID_ACT  :=  "00000001";
               PID_EXP   := PID;
               COMPARE_TID(PID_EXP,PID_ACT);
               
               TDEST_ACT :=  "0001"  ;
               TDEST_EXP := PDEST ;
               COMPARE_TDEST(TDEST_EXP,TDEST_ACT);

               TDATASIZE_EXP      := STESTDATASIZE ;
               TDATASIZE_ACT      := MTESTDATASIZE ;
               COMPARE_TDATASIZE(TDATASIZE_EXP,TDATASIZE_ACT);
               
               TDATA_VECTOR_EXP   := V_STESTDATA;
               TDATA_VECTOR_ACT   := V_MTESTDATA;
               COMPARE_TDATA_VECTOR(TDATA_VECTOR_EXP,TDATA_VECTOR_ACT,DATA_SIZE);

               TUSER_VECTOR_ACT   := V_MTESTUSER;
               TUSER_VECTOR_EXP   := V_STESTUSER;
               COMPARE_TUSER_VECTOR(TUSER_VECTOR_EXP,TUSER_VECTOR_ACT);
            -----------------------------------------------------------------------
            -----------------------------------------------------------------------
               STESTID  <=  "00000010" ;
               STESTDEST <=  "0010"  ; 
               IDVALID    <= '1';        
               DESTVALID  <= '1';           

               RECEIVE_PACKET<= '1';
               wait until RECEIVE_PACKET_DONE = '1';
               RECEIVE_PACKET<= '0';
               
               PID_ACT  :=  "00000010";
               PID_EXP   := PID;
               COMPARE_TID(PID_EXP,PID_ACT);
               
               TDEST_ACT :=  "0010"  ;
               TDEST_EXP := PDEST ;
               COMPARE_TDEST(TDEST_EXP,TDEST_ACT);

               TDATASIZE_EXP      := STESTDATASIZE;
               TDATASIZE_ACT      := MTESTDATASIZE;
               COMPARE_TDATASIZE(TDATASIZE_EXP,TDATASIZE_ACT);
               
               TDATA_VECTOR_EXP   := V_STESTDATA;
               TDATA_VECTOR_ACT   := V_MTESTDATA;
               COMPARE_TDATA_VECTOR(TDATA_VECTOR_EXP,TDATA_VECTOR_ACT,DATA_SIZE);

               TUSER_VECTOR_ACT   := V_MTESTUSER;
               TUSER_VECTOR_EXP   := V_STESTUSER;
               COMPARE_TUSER_VECTOR(TUSER_VECTOR_EXP,TUSER_VECTOR_ACT);
            -----------------------------------------------------------------------
             -----------------------------------------------------------------------
               STESTID  <=  "00000011" ;
               STESTDEST <=  "0011"  ; 
               IDVALID    <= '1';        
               DESTVALID  <= '1';    

               RECEIVE_PACKET<= '1';
               wait until RECEIVE_PACKET_DONE = '1';
               RECEIVE_PACKET<= '0';
               
               PID_ACT  :=  "00000011";
               PID_EXP   := PID;
               COMPARE_TID(PID_EXP,PID_ACT);
               
               TDEST_ACT :=  "0011"  ;
               TDEST_EXP := PDEST ;
               COMPARE_TDEST(TDEST_EXP,TDEST_ACT);

               TDATASIZE_EXP      := STESTDATASIZE;
               TDATASIZE_ACT      := MTESTDATASIZE;
               COMPARE_TDATASIZE(TDATASIZE_EXP,TDATASIZE_ACT);
               
               TDATA_VECTOR_EXP   := V_STESTDATA;
               TDATA_VECTOR_ACT   := V_MTESTDATA;
               COMPARE_TDATA_VECTOR(TDATA_VECTOR_EXP,TDATA_VECTOR_ACT,DATA_SIZE);

               TUSER_VECTOR_ACT   := V_MTESTUSER;
               TUSER_VECTOR_EXP   := V_STESTUSER;
               COMPARE_TUSER_VECTOR(TUSER_VECTOR_EXP,TUSER_VECTOR_ACT);
            -----------------------------------------------------------------------
              wait until M_AXIS_ACLK = '1';
              wait until M_AXIS_ACLK = '1';
              wait until M_AXIS_ACLK = '1';
              M_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING <= '0';
              S_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING <= '0';
              REPORT_STATUS  <= '1';
              wait until REPORT_STATUS_DONE  = '1';
              S_REPORT_STATUS  <= '1';
              wait until S_REPORT_STATUS_DONE  = '1';
              REPORT_MASTER_STATUS(M_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING,TEST);
              REPORT_SLAVE_STATUS(S_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING,TEST);
              write(outline1, string'("---------------------------------------------------------------"));
              writeline(output,outline1);
              write(outline1, string'("COMPLETE EXAMPLE TEST "));
              write(outline1, test);
              write(outline1, string'("  : FINISHED!"));
              writeline(output,outline1);
              write(outline1, string'("---------------------------------------------------------------"));
              writeline(output,outline1);
              stop_simulation;
              wait ;
            end process;

end;
