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
-------------------------------------------
--| X |nb byte | busy   |Error|  RW	|  Go	|
--| 7	|  6-4   |  3     |  2  |  1  |  0  |
-------------------------------------------
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
		device					: OUT std_logic_vector(6 downto 0);
		
		led						: OUT std_logic_vector(7 downto 0)
		);
end i2c_ram_interface;

architecture Behavioral of i2c_ram_interface is

--Signals for main process
TYPE main_process_FSM IS(idle, set_busy, ready, fetch_setup, fetch_data, decode_data, wait_queue, data_transfer, send_back_setup, done); --needed states for I2C control
SIGNAL prev_queue : std_logic;
SIGNAL main_process_state : main_process_FSM := idle;               --state machine
signal setup_word : std_logic_vector(31 downto 0);
signal data_word : std_logic_vector(31 downto 0);
signal data_recv : std_logic_vector(31 downto 0) := X"00000000";
signal led_signal : std_logic_vector(7 downto 0) := "00000000";
signal T : integer range 0 to 1 := 0;
signal nb_bytes : integer range 0 to 4 := 1;
signal ack : std_logic;

--Signals for tic generation
signal tic_go : std_logic;
signal tic_counter : integer range 0 to 170 := 0;

signal test : std_logic_vector(7 downto 0) := X"00";

begin

--Debug process to test RAM writting
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

--Debug process to test RAM Reading
--debug : process(clk, reset_in)
--	begin
--		if( clk'event and clk = '1')then
--		ram_addr <= X"00000004";
--		ram_byte <= "0000";
--		led <= ram_read(15 downto 8);
--		end if;
--end process debug;
--
main : process(clk, go)
	begin
	if( clk'event and clk = '1')then				
		if(go = '1' and main_process_state = idle)then
			main_process_state <= ready;
		end if;
		
		case main_process_state is
			when idle =>
				ram_addr <= X"00000000";
				ram_byte <= "0000";
				--reset_n <= '0';
				tic_go <= '0';
				data_recv <= X"00000000";
				--led <= X"01";
				
			when ready =>--waiting on go signal to start
				ram_addr <= X"00000004";
				ram_byte <= "0000";
				main_process_state <= set_busy;			
				--led <= X"11";				
				
			when set_busy =>
				setup_word <= ram_read;
				ram_addr <= X"00000004";
				ram_byte <= "1111";
				ram_write <= ram_read(31 downto 4) & '1' & ram_read(2 downto 0);
				main_process_state <= fetch_setup;
			
			when fetch_setup =>--fetch data from ram
				setup_word <= ram_read;
				ram_byte <= "0000";
				if(ram_read(1) = '0')then -- write to slave, get data from RAM
					ram_addr <= X"00000008";
				end if;
				main_process_state <= fetch_data;
				--led <= X"22";
				
			when fetch_data =>
				data_word <= ram_read;
				main_process_state <= decode_data;
				if(to_integer(unsigned(setup_word(6 downto 4))) > 4)then
					nb_bytes <= 4;
					--led <= X"23";
				else 
					if(to_integer(unsigned(setup_word(6 downto 4))) = 0)then
						nb_bytes <= 1;
					end if;
					nb_bytes <= to_integer(unsigned(setup_word(6 downto 4)));
				end if;
				
			when decode_data =>--slave ram pointer first
				rd <= '0';
				we <= '1';
				device <= setup_word(14 downto 8);
				--device <= "1101000";
				slave_din <= setup_word(23 downto 16);
				reset_n <= '1';
				tic_go <= '1';
				if( prev_queue = '1' and queue = '0')then
					main_process_state <= data_transfer;
					rd <= setup_word(1);
					we <= not setup_word(1);
					slave_din <= data_word(31 downto 24);
				end if;
				--led <= X"44";
				
			when data_transfer =>--waiting physical to get back data from slave
				--led <= X"51";
				if( prev_queue = '1' and queue = '0')then
					if(nb_bytes > 1)then
						nb_bytes <= nb_bytes - 1;
						--led(7 downto 0) <= X"52";
					else
						main_process_state <= send_back_setup;
						--led(7 downto 0) <= X"55";
					end if;
				end if;
				
				if(data_valid = '1')then	
					data_recv((8*(3-nb_bytes)+7) downto (8*(3-nb_bytes))) <= slave_dout;--word @ 0x0 =| 7 dowto 0
					--data_recv((8*(nb_bytes+1)-1) downto ((8*(nb_bytes+1)-8))) <= slave_dout;--word @ 0x0 =| 31 dowto 24
					--led <= X"53";
				end if;
				
				slave_din <= data_word( (8*(nb_bytes)-1) downto ((8*(nb_bytes)-8)));
				
			when send_back_setup =>
				if( prev_queue = '1' and queue = '0')then
					ram_byte <= "1111";
					ram_addr <= X"00000004";
					ram_write <= "00000" & status & setup_word(23 downto 16) & "0" & setup_word(14 downto 8) 
						& setup_word(7 downto 4) & "1" & ack & setup_word(1 downto 0);
					main_process_state <= done;
					--led <= X"60";
				end if;
				if(data_valid = '1')then	--catch last one
					data_recv((8*(4-nb_bytes)+7) downto (8*(4-nb_bytes))) <= slave_dout;--word @ 0x0 =| 7 dowto 0
					--data_recv((8*(nb_bytes)-1) downto ((8*(nb_bytes)-8))) <= slave_dout;--word @ 0x0 =| 31 dowto 24
					--led <= X"53";
				end if;
				
			when done =>
					ram_byte <= "1111";
					ram_addr <= X"00000008";
					ram_write <= data_recv;
					main_process_state <= idle;
					--led <= X"66";
			when others =>
				null;
		end case;
		prev_queue <= queue;
		ack <= ack_error;
		led(2 downto 0) <= status;
		led(7 downto 3) <= "00000";
	end if;
	
	end process main;
	
--300kHz clock generator from 50MHz (to finally drive I2C at 100KHz)
clock_gen : process(clk)
	begin
		if( clk'event and clk = '1' and tic_go = '1')then	
			if(tic_counter < 167)then
				tic <= '0';
				tic_counter <= tic_counter + 1;
			elsif (tic_counter > 166)then
				tic <= '1';
				tic_counter <= 0;
			end if;
		end if;
			
	end process clock_gen;
	
--ram_write_process : process(clk)
--	begin
--		if( clk'event and clk = '1' and ram_update_go = '1')then	
--			case ram_process_state is
--				when send_setup =>
--					ram_addr <= X"00000004";
--					ram_write <= X"00" & setup_word(23 downto 16) & "0" & setup_word(14 downto 8) 
--						& setup_word(7 downto 4) & "1" & ack_error & setup_word(1 downto 0);
--					ram_byte <= "1111";
--					ram_process_state <= send_data;
--					--led <= X"00";
--				when send_data =>
--					ram_addr <= X"00000008";
--					ram_write <= data_recv;
--					ram_byte <= "1111";
--					ram_process_state <= send_setup;
--					--led <= X"11";
--				end case;
--		end if;
--	end process ram_write_process;
	
end Behavioral;

