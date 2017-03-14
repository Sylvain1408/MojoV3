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
signal reset_sync : std_logic;
signal addr : std_logic_vector(6 downto 0);
signal data_wr : std_logic_vector(7 downto 0);
signal data_rd : std_logic_vector(7 downto 0);
signal ack_error : std_logic;

signal slave_dout : std_logic_vector(7 downto 0);
signal slave_din : std_logic_vector(7 downto 0);
signal tic : std_logic;
signal rd  : std_logic;
signal we : std_logic;
signal queue : std_logic;
signal data_valid : std_logic;
signal stop : std_logic;
signal status : std_logic_vector(2 downto 0);

	COMPONENT i2cmaster
		generic(
		DEVICE 		: std_logic_vector(7 downto 0) := x"38"
	);
	port(
		MCLK			: IN	std_logic;
		nRST			: IN	std_logic;
		SRST			: IN	std_logic; 							-- synchronious reset
		TIC			: IN	std_logic;							-- i2c rate (bit rate x3)
		DIN			: IN	std_logic_vector(7 downto 0);	-- data to send
		DOUT			: OUT	std_logic_vector(7 downto 0);	-- received data
		RD				: IN	std_logic;							-- read command
		WE				: IN	std_logic;							-- write command
		NACK			: OUT	std_logic;							-- nack from slave
		QUEUED		: OUT	std_logic;							-- operation (write or read cycle) is queued
		DATA_VALID	: OUT	std_logic;							-- new data available on DOUT
		STOP			: OUT	std_logic;
		STATUS		: OUT	std_logic_vector(2 downto 0);	-- state machine state
		SCL_IN		: IN	std_logic;							-- i2c signals
		SCL_OUT		: OUT	std_logic;
		SDA_IN		: IN	std_logic;
		SDA_OUT		: OUT	std_logic
	);
	END COMPONENT;
	
	COMPONENT i2c_ram_interface
	PORT(
		clk 						: IN std_logic;
		tic						: OUT std_logic;
		ram_write 				: OUT std_logic_vector(31 downto 0);
		ram_addr 				: OUT std_logic_vector(31 downto 0);
		ram_read 				: IN std_logic_vector(31 downto 0);
		ram_byte					: OUT STD_LOGIC_VECTOR(3 downto 0);
		slave_din 				: OUT std_logic_vector(7 downto 0); 
		slave_dout 				: IN std_logic_vector(7 downto 0);
		rd 						: OUT std_logic;
		we							: OUT std_logic;
		queue						: IN std_logic;
		data_valid				: IN std_logic;
		stop						: IN std_logic;
		fetch_decode 			: IN std_logic;
		reset_n					: OUT std_logic;
		status					: IN std_logic_vector(2 downto 0);
		ack_error 				: IN std_logic;
		
		led						: OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

begin

	SubModule_i2c_physical: i2cmaster 
	PORT MAP(
		MCLK => clk,
		nRST => reset_n,
		SRST => reset_sync,
		TIC => tic,
		DIN => slave_din,
		DOUT => slave_dout,
		RD =>	rd,
		WE =>	we,
		NACK => ack_error,
		QUEUED => queue,
		DATA_VALID =>	data_valid,
		STOP =>	stop,
		STATUS => status,
		SCL_IN => scl,
		SCL_OUT => scl,
		SDA_IN => sda,
		SDA_OUT => sda
	);
	
	SubModule_i2c_ram_interface: i2c_ram_interface 
	PORT MAP(
		clk => clk,
		reset_n => reset_n,
		--RAM side
		ram_write => ram_din,
		ram_read => ram_dout,
		ram_addr => ram_addr,
		ram_byte => ram_byte,
		fetch_decode => fetch_decode,
		
		--I2C side
		slave_dout => slave_dout,
		slave_din => slave_din,
		tic => tic,
		rd => rd,
		we	=> we,
		queue	=> queue,
		data_valid	=> data_valid,
		stop	=> stop,
		status => status,
		ack_error => ack_error,
		
		led => led
	);


end Behavioral;

