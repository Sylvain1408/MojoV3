----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:37:27 06/11/2016 
-- Design Name: 
-- Module Name:    RamChain - Behavioral 
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

entity RamChain is
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
		
		led : OUT std_logic_vector(7 downto 0)
		);
end RamChain;

architecture Behavioral of RamChain is

COMPONENT ram
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(3 downto 0);
    addra : IN STD_LOGIC_VECTOR(31 downto 0);
    dina : IN STD_LOGIC_VECTOR(31 downto 0);
    douta : OUT STD_LOGIC_VECTOR(31 downto 0);
    clkb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(3 downto 0);
    addrb : IN STD_LOGIC_VECTOR(31 downto 0);
    dinb : IN STD_LOGIC_VECTOR(31 downto 0);
    doutb : OUT STD_LOGIC_VECTOR(31 downto 0)
  );
END COMPONENT;

signal addr : std_logic_vector(31 downto 0);
signal word : std_logic_vector(31 downto 0);
signal we : std_logic_vector(3 downto 0);
signal rd : std_logic_vector(31 downto 0);
signal wr : std_logic_vector(31 downto 0);
signal led_signal : std_logic_vector(7 downto 0) := "11111111";
type machine is (waiting, buffering, writing);
signal state : machine := waiting;
signal ready_go : integer range 0 to 1 := 0;
signal prev_addr_strobe : std_logic;
signal rw : std_logic;

begin

dual_bram_0 : ram
		port map (
			--port A connected to mcs_0
			 clka => clk,
			 wea => we,
			 addra => addr,
			 dina => wr,
			 douta => rd,
			--port B connected to user_logic
			 clkb => clk,
			 web => "0000",
			 addrb => X"00000000",
			 dinb => X"00000000",
			 doutb => open
		);
		
buff_interface : process(clk, mcs_addr_strobe, mcs_wr_strobe, mcs_rd_strobe)
	begin
		--drive ready signals for mcs
			
		if( clk'event and clk = '1')then		
			
			case state is
			when waiting =>
				if(mcs_addr_strobe = '1')then
					addr(31 downto 16) <= X"0000";
					addr(15 downto 0) <= mcs_addr(15 downto 0);
					
					if(mcs_wr_strobe = '1')then
--						case addr is
--							when X"00000000" => ram_write <= X"11110000" ;
--							when X"00000004" => ram_write <= X"22221111";
--							when X"00000008" => ram_write <= X"33332222";
--							when X"0000000B" => ram_write <= X"44442222";
--							when others => ram_write <= X"FFFFFFFF";
--						end case;
						we <= "1111";
						rw <= '1';
						word <= mcs_write;
						wr <= mcs_write;
						state <= writing;
					else
--						addr(31 downto 16) <= X"0000";
--						addr(15 downto 0) <= mcs_addr(15 downto 0);
						state <= writing;
					end if;
				
					
				else
					we <= "XXXX";
					wr <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
					addr <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
					mcs_read <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
					mcs_ready <= '0';
					rw <= '0';
					
					state <= waiting;
				end if;
			when writing => --1 turn waiting
					state <= buffering;
			when buffering =>
				if(rw = '1')then--mcs write
					mcs_ready <= '1';
					we <= "0000";
					
				else--mcs read
					mcs_ready <= '1';
					--mcs_read <= addr;
					mcs_read <= rd;
--					case addr is
--						when X"00000000" => mcs_read <= X"11110000" ;
--						when X"00000004" => mcs_read <= X"22221111";
--						when X"00000008" => mcs_read <= X"33332222";
--						when X"0000000B" => mcs_read <= X"44442222";
--						when others => mcs_read <= X"FFFFFFFF";
--					end case;
					

				end if;
				state <= waiting;
			when others =>
				null;
			end case;
		led <= rd(7 downto 0);
--		case state is
--			when waiting =>
--				state <= waiting;
--				mcs_ready <= '0';
--				if(mcs_addr_strobe = '1')then
--					state <= strobing;
--				end if;
--			when strobing =>
--				mcs_ready <= '1';
--				if(mcs_addr_strobe = '0')then
--					state <= waiting;
--				end if;
--			when others =>
--				null;
--		end case;
			
			
			--ram_byte_enable <= mcs_byte_enable;

			
		end if;
end process buff_interface;

end Behavioral;

