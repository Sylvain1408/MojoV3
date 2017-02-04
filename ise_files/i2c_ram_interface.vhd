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
end i2c_ram_interface;

architecture Behavioral of i2c_ram_interface is

TYPE machine IS(idle, ready, fetch_setup, fetch_data, decode_data, wait_data, stop); --needed states
SIGNAL state         : machine := idle;               --state machine
signal setup_word : std_logic_vector(31 downto 0);
signal data_word : std_logic_vector(31 downto 0);
signal led_signal : std_logic_vector(7 downto 0) := "00000000";
signal busy_prev : std_logic;
signal start_micro : std_logic;
signal busy_cnt : integer range 0 to 6 := 0;
signal T : integer range 0 to 1 := 0;

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
				busy_cnt <= 0;
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
				slave_addr <= setup_word(14 downto 8);
				led <= X"23";
			when decode_data =>--decode data
--				if( setup_word(1) = '1')then	--read
--					rw <= '1';					
--				else	--write
--					rw <= '0';
--					slave_write <= setup_word(15 downto 8);						
--				end if;
--				slave_addr <= setup_word(30 downto 24);
--				enable_communication <= '1';
--				reset_n <= '1';
				busy_prev <= busy;
				if(busy_prev = '0' and busy = '1') then  --i2c busy just went high
					busy_cnt <= busy_cnt + 1;             --counts the times busy has gone from low to high during transaction
					
				end if;
				
				if(setup_word(1) = '1')then	--read
					case busy_cnt is
						when 0 => 	--initiate transaction, write operation -> set device ram address
							enable_communication <= '1';
							reset_n <= '1';
							rw <= '0';
							slave_write <= setup_word(23 downto 16);
							--led(7 downto 0) <= X"31";
						when 1 =>	--read 1
--							rw <= setup_word(1);
--							led(7 downto 0) <= X"32";
						when 2 => 	--read 2
							if(busy = '0')then
								--data_word(7 downto 0) <= slave_read;
								data_word(7 downto 0) <= X"98";
							end if;
--							led(7 downto 0) <= X"33";
--							
--							if(ack_error = '1')then
--								data_word(7) <= '1';
--							end if;
						when 3 => 	--read 3
							if(busy = '0')then
--								data_word(15 downto 8) <= slave_read;
								data_word(15 downto 8) <= X"76";
							end if;
--							led(7 downto 0) <= X"34";
--							
--							if(ack_error = '1')then
--								data_word(15) <= '1';
--							end if;
						when 4 => 	--read 4
							if(busy = '0')then
--								data_word(23 downto 16) <= slave_read;
								data_word(23 downto 16) <= X"54";
							end if;
--							led(7 downto 0) <= X"35";
--							
--							if(ack_error = '1')then
--								data_word(23) <= '1';
--							end if;
						when 5 =>
							if(busy = '0')then
--								data_word(31 downto 24) <= slave_read;
								data_word(31 downto 24) <= X"32";
							end if;
--							led(7 downto 0) <= X"36";
--							
--							if(ack_error = '1')then
--								data_word(31) <= '1';
--							end if;
						when 6 =>
							busy_cnt <= 0;
							ram_addr <= X"00000008";
							ram_byte <= "1111";
							ram_write <= X"FEDCBA01";
--							
--							
							state <= wait_data;
							led(7 downto 0) <= X"55";
						when others => null;
					end case;
				else									--write
					case busy_cnt is
						when 0 => 	--initiate transaction, write operation -> set device ram address
							enable_communication <= '1';
							reset_n <= '1';
							rw <= '0';
							slave_write <= setup_word(23 downto 16);
							led(7 downto 0) <= X"41";
						when 1 =>	--write 1
							rw <= setup_word(1);
							slave_write <= data_word(7 downto 0);
							led(7 downto 0) <= X"42";
						when 2 => 	--write 2
							slave_write <= data_word(15 downto 8);
							led(7 downto 0) <= X"43";
						when 3 => 	--write 3
							slave_write <= data_word(23 downto 16);
							led(7 downto 0) <= X"44";
						when 4 => 	--write 4
							slave_write <= data_word(31 downto 24);
							led(7 downto 0) <= X"45";
						when 5 =>
							busy_cnt <= 0;
							state <= wait_data;
							led(7 downto 0) <= X"4F";
						when others => null;
					end case;
				end if;--r/w
--				if(ack_error = '1')then
--						setup_word(2) <= '1';
--						ram_addr <= X"C0000004";
--						ram_byte <= "1111";
--						ram_write <= setup_word;
--				end if;
				
				led(7) <= busy;
			when wait_data =>--waiting physical to get back data from slave
--				if(busy = '0')then 
--					state <= stop;
--					ram_byte <= "0000";
--				else
--					setup_word(3) <= busy;--busy=1
--					ram_addr <= X"C0000004";
--					ram_byte <= "1111";
--					state <= wait_data;
--				end if;

				--enable_communication <= '0';
				--ram_addr <= X"00000000";
				--ram_byte <= "0000";
				--ram_write <= data_word;
				
				state <= stop;
				led(7 downto 0) <= X"00";
			when stop =>
--				setup_word(23 downto 16) <= slave_read;
----				setup_word(23 downto 16) <= X"DD";
--				ram_addr <= X"C0000004";
--				ram_byte <= "1111";
--				setup_word(3) <= busy;
--				setup_word(2) <= ack_error;
				state <= idle;
				led <= X"66";
			when others =>
				null;
		end case;
	end if;

	end process main;
end Behavioral;

