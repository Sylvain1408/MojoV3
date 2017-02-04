`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:58 06/11/2016 
// Design Name: 
// Module Name:    RamChain 
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
module RamChain(
Port ( 
		clk 						: IN std_logic;
		ram_write 				: OUT std_logic_vector(31 downto 0);
		ram_addr 				: OUT std_logic_vector(31 downto 0);
		ram_read 				: IN std_logic_vector(31 downto 0);
		ram_byte					: OUT STD_LOGIC_VECTOR(3 downto 0);
		slave_addr				: OUT std_logic_vector(6 downto 0);
		slave_write 			: OUT std_logic_vector(7 downto 0); 
		slave_read 				: IN std_logic_vector(7 downto 0);
		rw 						: OUT std_logic;
		fetch_decode 			: IN std_logic;
		enable_communication : OUT std_logic;
		reset_n					: OUT std_logic;
		busy 						: IN std_logic;
		ack_error 				: IN std_logic;
		
		led 						: OUT std_logic_vector(7 downto 0)
		);

endmodule
