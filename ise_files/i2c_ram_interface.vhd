----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:15:52 05/07/2016 
-- Design Name: 
-- Module Name:    i2c_ram_interface - Behavioral 
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
--32 bits register
--register C_BASEADDR + 0x00
-------------------------------------
--nb byte | busy	|Error|	RW	|	Go	|
--	  7-4  |	3		|	2	|	1	|	 0	|
-------------------------------------
--register C_BASEADDR + 0x01
-------------------------------------
--| X |		   i2c slv_addr			|
--| 7 |				6-0					|
-------------------------------------
--register C_BASEADDR + 0x02
-------------------------------------
--|   			slv ram addr			|
--|				7-0						|
-------------------------------------
--register C_BASEADDR + 0x04 to 0x07
-------------------------------------
--|			data read / to write		|
--|					7-0					|
-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity i2c_ram_interface is
    Port ( 
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
end i2c_ram_interface;

architecture Behavioral of i2c_ram_interface is

TYPE machine IS(idle, ready, fetch_setup, fetch_data, decode_data, wait_data, done); --needed states for I2C control
TYPE tic_states IS(low, high); --needed states for tic signal
SIGNAL state         : machine := idle;               --state machine
signal setup_word : std_logic_vector(31 downto 0);
signal data_word : std_logic_vector(31 downto 0);
signal led_signal : std_logic_vector(7 downto 0) := "00000000";
signal busy_prev : std_logic;
signal start_micro : std_logic;
signal T : integer range 0 to 1 := 0;
signal tic_counter : integer range 0 to 170 := 0;

begin

main : process(clk, fetch_decode)
	begin
	if( clk'event and clk = '1')then				
		if(fetch_decode = '1' and state = idle)then
			state <= ready;
		end if;
		
		case state is
			when idle =>
				ram_addr <= X"00000000";
				ram_byte <= "0000";
				reset_n <= '0';
				led <= X"01";

			when ready =>--waiting on fetch_decode signal to start
				ram_addr <= X"00000004";
				ram_byte <= "0000";
				state <= fetch_setup;			
				led <= X"11";				
				
			when fetch_setup =>--fetch data from ram
				setup_word <= ram_read;
				state <= decode_data;
				if(ram_read(1) = '0')then
					ram_addr <= X"00000008";
					ram_byte <= "0000";
				end if;
				
				state <= fetch_data;
				led <= X"22";
			when fetch_data =>
				data_word <= ram_read;
				state <= decode_data;
				led <= X"23";
			when decode_data =>--decode data

			when wait_data =>--waiting physical to get back data from slave

				state <= done;
				led(7 downto 0) <= X"00";
			when done =>

				state <= idle;
				led <= X"66";
			when others =>
				null;
		end case;
	end if;

	end process main;
	
clock_gen : process(clk, fetch_decode)--300kHz clock generator from 50MHz (to finally drive I2C at 100KHz)
	begin
		if(tic_counter < 167)then
			tic <= '0';
			tic_counter <= tic_counter + 1;
		elsif (tic_counter > 167)then
			tic <= '1';
			tic_counter <= 1;
		end if;
			
	end process clock_gen;
	
end Behavioral;

