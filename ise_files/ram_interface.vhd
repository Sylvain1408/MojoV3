----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:47 05/07/2016 
-- Design Name: 
-- Module Name:    ram_interface - Behavioral 
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

entity ram_interface is
    Port ( 
		clk : in  STD_LOGIC;
		--mcs interface
		mcs_addr	: IN std_logic_vector(31 downto 0);
		mcs_read	: OUT std_logic_vector(31 downto 0);
		mcs_write : IN std_logic_vector(31 downto 0);
		mcs_byte_enable : IN std_logic_vector(3 downto 0);
		mcs_ready : OUT std_logic; 
		mcs_rd_strobe : IN std_logic;
		mcs_wr_strobe : IN std_logic;
		mcs_addr_strobe : IN std_logic;
		
		--BRAM
		ram_addr	: OUT std_logic_vector(31 downto 0);
		ram_read	: IN std_logic_vector(31 downto 0);
		ram_write : OUT std_logic_vector(31 downto 0);
		ram_byte_enable : OUT std_logic_vector(3 downto 0);
		
		led : OUT std_logic_vector(7 downto 0)
		);
end ram_interface;

architecture Behavioral of ram_interface is

signal rw : std_logic;

signal addr : std_logic_vector(31 downto 0);
signal word : std_logic_vector(31 downto 0);

signal led_signal : std_logic_vector(7 downto 0) := "11111111";
type machine is (waiting, buffering, writing);
signal state : machine := waiting;
signal prev_addr_strobe : std_logic;

begin

buff_interface : process(clk, mcs_addr_strobe, mcs_rd_strobe, mcs_wr_strobe)
	begin
		--drive ready signals for mcs
			
		if( clk'event and clk = '1')then		
			
			case state is
			when waiting =>
				if(mcs_addr_strobe = '1')then
					ram_addr(31 downto 16) <= X"0000";
					ram_addr(15 downto 0) <= mcs_addr(15 downto 0);
					
					if(mcs_wr_strobe = '1')then
						ram_byte_enable <= "1111";
						rw <= '1';
						word <= mcs_write;
						ram_write <= mcs_write;
						state <= writing;
					else
						state <= writing;
					end if;
				
					
				else
					ram_byte_enable <= "XXXX";
					ram_write <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
					ram_addr <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
					mcs_read <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
					mcs_ready <= '0';
					rw <= '0';
					
					state <= waiting;
				end if;
			when writing =>
					state <= buffering;
			when buffering =>
				if(rw = '1')then--mcs write
					mcs_ready <= '1';
					ram_byte_enable <= "0000";
				else--mcs read
					mcs_ready <= '1';
					mcs_read <= ram_read;				

				end if;
				state <= waiting;
			when others =>
				null;
			end case;
			led <= addr(7 downto 0);
			
		end if;
end process buff_interface;

end Behavioral;