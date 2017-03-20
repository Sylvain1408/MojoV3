----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sylvain ROULAND
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
--RW : 0 write, 1 read
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
use ieee.numeric_std.ALL; 

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
		go				 			: IN std_logic;
		reset_n					: OUT std_logic;
		status					: IN std_logic_vector(2 downto 0);
		ack_error 				: IN std_logic;
		reset_in					: IN std_logic;
		
		led						: OUT std_logic_vector(7 downto 0)
		);
end i2c_ram_interface;

architecture Behavioral of i2c_ram_interface is

TYPE machine IS(idle, set_busy, ready, fetch_setup, fetch_data, decode_data, data_transfer, done); --needed states for I2C control
TYPE tic_states IS(low, high); --needed states for tic signal
SIGNAL state         : machine := idle;               --state machine
signal setup_word : std_logic_vector(31 downto 0);
signal data_word : std_logic_vector(31 downto 0);
signal data_recv : std_logic_vector(31 downto 0);
signal led_signal : std_logic_vector(7 downto 0) := "00000000";
signal T : integer range 0 to 1 := 0;
signal tic_counter : integer range 0 to 170 := 0;
signal nb_bytes : integer range 1 to 4 := 1;
signal tic_go : std_logic;

begin

--debug : process(clk, reset_in)
--	begin
--		if( clk'event and clk = '1')then
--		ram_addr <= X"00000000";
--		ram_byte <= "0000";
--			if(reset_in = '0')then
--				ram_write <= X"FFFFFFFF";
--				ram_byte <= "1111";
--				led <= X"FF";
--			else
--				ram_write <= X"11111111";
--				ram_byte <= "1111";
--				led <= X"00";
--			end if;
--		end if;
--	end process debug;

main : process(clk, go)
	begin
	if( clk'event and clk = '1')then				
		if(go = '1' and state = idle)then
			state <= ready;
		end if;
		
		case state is
			when idle =>
				ram_addr <= X"00000000";
				ram_byte <= "0000";
				reset_n <= '0';
				tic_go <= '0';
				--led <= X"01";
				
			when ready =>--waiting on go signal to start
				ram_addr <= X"00000004";
				ram_byte <= "0000";
				state <= set_busy;			
				--led <= X"11";				
				
			when set_busy =>
				setup_word <= ram_read;
				ram_addr <= X"00000004";
				ram_byte <= "1111";
				ram_din <= (31 downto 4 & '1' & 2 downto 0);
				state <= fetch_setup;
			
			when fetch_setup =>--fetch data from ram
				
				if(ram_read(1) = '0')then -- write to slave, get data from RAM
					ram_addr <= X"00000008";
					ram_byte <= "0000";
				end if;
				state <= fetch_data;
				--led <= X"22";
				
			when fetch_data =>
				data_word <= ram_read;
				if(to_integer(unsigned(setup_word(6 downto 4))) > 4)then
					nb_bytes <= 4;
				else
					nb_bytes <= to_integer(unsigned(setup_word(6 downto 4)));
				end if;
				state <= decode_data;
				led <= X"23";
				
			when decode_data =>--slave addr first
				rd <= '0';
				we <= '1';
				slave_din <= setup_word(15 downto 8);
				reset_n <= '1';
				tic_go <= '1';
				if(queue = '0')then--error
					state <= data_transfer;
					rd <= setup_word(1);
					we <= not setup_word(1);
				end if;

			when data_transfer =>--waiting physical to get back data from slave
				if(queue = '0')then
					if(nb_bytes = 0)then
						state <= done;
					else
						nb_bytes <= nb_bytes - 1;
						slave_din <= data_word( (8*(4-nb_bytes)+7) downto ((8*(4-nb_bytes))));
						data_recv((8*(4-nb_bytes)+7) downto ((8*(4-nb_bytes)))) <= slave_dout;
					end if;
				end if;
				led(7 downto 0) <= X"00";
				
			when done =>
				ram_byte <= "1111";
				ram_addr <= X"00000008";
				ram_din <= data_recv;
				state <= idle;
				led <= X"66";
			when others =>
				null;
		end case;
	end if;

	end process main;
	
clock_gen : process(clk, tic_go)--300kHz clock generator from 50MHz (to finally drive I2C at 100KHz)
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

