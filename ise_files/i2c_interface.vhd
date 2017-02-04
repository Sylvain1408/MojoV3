----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:15:56 04/22/2016 
-- Design Name: 
-- Module Name:    i2c_interface - Behavioral 
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

entity i2c_interface is
    Port ( ram_address_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ram_write_data : out  STD_LOGIC_VECTOR (31 downto 0);
           ram_read_data : in  STD_LOGIC_VECTOR (31 downto 0);
           ram_byte_enable : in  STD_LOGIC_VECTOR (3 downto 0);
           i2c_sda : inout  STD_LOGIC;
           i2c_scl : inout  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC
			  );
end i2c_interface;

architecture Behavioral of i2c_interface is

begin

type state_type is (
		idle,
		start,
		read_write,
		ack,
		nack,
		pause,
		restart,
		stop,
		set_addr,
		set_data,
		get_data
		);
		
	signal process_state : state_type := idle;
	signal time_index : integer range 0 to 800000000 := 0;
	signal bit_pos : integer range 0 to 7 := 0;
	
	begin
		mainProcess : process(clock)
		begin
			if(clock'event and clock = '1')then
				case process_state is
					when idle =>
						ram_address_out <= X"C0000000";
						end if;
					when start =>
						sda <= '0';
						scl <= '1';
					when read_write =>
					when ack =>
					when nack =>
					when pause =>
					when restart =>
					when stop =>
					when set_addr =>
						if(bit_pos != 7) then
							sda <= data(bit_pos);
							bit_pos = bit_pos + 1;
						else
							process_state <= ack;
					when set_data =>
					when get_data =>
					end case;
				
				end if;
			end if;
		
	end process;

end Behavioral;

