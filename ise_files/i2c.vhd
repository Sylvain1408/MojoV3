----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:29 05/07/2016 
-- Design Name: 
-- Module Name:    i2c - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity i2c is
    Port ( 
		clk : IN  STD_LOGIC;
		fetch_decode : IN std_logic;--start i2c component
		ram_din : OUT std_logic_vector(31 downto 0);
		ram_dout : IN std_logic_vector(31 downto 0);
		ram_addr : OUT std_logic_vector(31 downto 0);
		ram_byte : OUT std_logic_vector(3 downto 0);
		scl : INOUT std_logic;
		sda : INOUT std_logic;
		
		led : OUT std_logic_vector(7 downto 0)
	 );
end i2c;

architecture Behavioral of i2c is

signal reset_n : std_logic;
signal ena : std_logic;
signal addr : std_logic_vector(6 downto 0);
signal rw : std_logic;
signal data_wr : std_logic_vector(7 downto 0);
signal busy : std_logic;
signal data_rd : std_logic_vector(7 downto 0);
signal ack_error : std_logic;

	COMPONENT i2c_master
	GENERIC (
		input_clk : integer;
		bus_clk : integer
		);
	PORT(
		clk : IN std_logic;
		reset_n : IN std_logic;
		ena : IN std_logic;
		addr : IN std_logic_vector(6 downto 0);
		rw : IN std_logic;
		data_wr : IN std_logic_vector(7 downto 0);    
		sda : INOUT std_logic;
		scl : INOUT std_logic;      
		busy : OUT std_logic;
		data_rd : OUT std_logic_vector(7 downto 0);
		ack_error : BUFFER std_logic
		);
	END COMPONENT;
	
	COMPONENT i2c_ram_interface
	PORT(
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
		
		led						: OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

begin

	SubModule_i2c_physical: i2c_master 
	GENERIC MAP(
		input_clk => 50_000_000,
		bus_clk => 100_000
		)
	PORT MAP(
		clk => clk,
		reset_n => reset_n,
		ena => ena,
		addr => addr,
		rw => rw ,
		data_wr => data_wr,
		busy => busy,
		data_rd => data_rd,
		ack_error => ack_error,
		sda => sda,
		scl => scl
	);
	
	SubModule_i2c_ram_interface: i2c_ram_interface 
	PORT MAP(
		clk => clk,
		slave_read => data_rd,
		slave_write => data_wr,
		slave_addr => addr,
		ram_write => ram_din,
		ram_read => ram_dout,
		ram_addr => ram_addr,
		ram_byte => ram_byte,
		rw => rw,
		fetch_decode => fetch_decode,
		enable_communication => ena,
		reset_n => reset_n,
		busy => busy,
		ack_error => ack_error,
		
		led => led
	);


end Behavioral;

