----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:05:41 05/13/2016 
-- Design Name: 
-- Module Name:    Module_UART_interface - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Convert 9600 bauds UART between Microblaze mcs and High speed UART for AVR
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
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Module_UART_interface is
	generic (
    CLK_PER_BIT : natural := 5208  -- DIVISOR = 100,000,000 / (16 x BAUD_RATE)
    -- 2400 -> 20833
    -- 9600 -> 5208
    -- 115200 -> 434
    -- 1562500 -> 32
    -- 2083333 -> 24
  );
  port (
	 clk		: in std_logic;
	 rst	: in std_logic;
	 --Connection to mcs
    rx		: in std_logic;
	 tx		: out std_logic;
	 
	 --Connection to avr_interface
	 rx_data	: out std_logic_vector(7 downto 0); --to AVR
	 tx_data : in 	std_logic_vector(7 downto 0); --from AVR
	 
	 rx_new_data : out std_logic;	--flag new outcoming data to AVR
	 tx_new_data : in std_logic;	--inflag new incoming data to AVR
	 rx_block	 : in std_logic	--busy signal
	 
  );
end Module_UART_interface;

architecture Behavioral of Module_UART_interface is

signal from_mcs_new_data 	: std_logic;
signal from_mcs_data			: std_logic_vector(7 downto 0);
signal mcs_tx_busy			: std_logic;
signal mcs_tx_data			: std_logic_vector(7 downto 0);
signal new_mcs_tx_data		: std_logic;
type STATE is (IDLE, SC_READ, SC_WRITE);
signal rx_state : STATE := IDLE;
signal tx_state : STATE := IDLE;

begin

	serial_rx	: entity work.serial_rx
	generic map (
		CLK_PER_BIT	=> CLK_PER_BIT,
		CTR_SIZE	=> 16
	)
	port map (
		clk			=> clk,
		rst			=> rst,
		rx				=> rx,
		data			=> from_mcs_data,
		new_data		=> from_mcs_new_data
	);
	
	serial_tx	: entity work.serial_tx
	generic map (
		CLK_PER_BIT	=>	CLK_PER_BIT,
		CTR_SIZE	=>	16
	)
	port map (
		clk			=> clk,
		rst			=> rst,
		tx				=> tx,
		tx_block		=> '0',
		busy			=> mcs_tx_busy,
		data			=> mcs_tx_data,
		new_data		=> new_mcs_tx_data
	);
	
	rx_proc : process(clk)
	begin
		if rising_edge (clk) then
			if(rst = '1' or rx_block = '1')then
				rx_state <= IDLE;
				rx_new_data <= '0';
			end if;
			case rx_state is
				when IDLE =>
					if(from_mcs_new_data = '1')then
						rx_state <= SC_READ;
					end if;
				when SC_READ =>
					rx_data <= from_mcs_data;
					rx_state <= SC_WRITE;
				when SC_WRITE =>
					rx_new_data <= '1';
					rx_state <= IDLE;
			end case;
		end if;
	end process;
	
	tx_proc : process(clk)
	begin
		if rising_edge (clk) then
			if(rst = '1')then
				tx_state <= IDLE;
				new_mcs_tx_data <= '0';
			end if;
			case tx_state is
				when IDLE =>
					new_mcs_tx_data <= '0';
					if( (tx_new_data and (not mcs_tx_busy)) = '1' )then
						tx_state <= SC_READ;
					end if;
				when SC_READ =>
					mcs_tx_data <= tx_data;
					tx_state <= SC_WRITE;
				when SC_WRITE =>
					new_mcs_tx_data <= '1';
					tx_state <= IDLE;
			end case;
		end if;
	end process;
  
end Behavioral;
