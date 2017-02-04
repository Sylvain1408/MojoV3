----------------------------------------------------------------------------------
-- Mojo_top VHDL
-- Translated from Mojo-base Verilog project @ http://embeddedmicro.com/frontend/files/userfiles/files/Mojo-Base.zip
-- by Xark
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity mojo_top is
	port (
		clk			: in  std_logic;		-- 50Mhz clock
		rst_n		: in  std_logic;		-- "reset" button input (negative logic)
		cclk		: in  std_logic;		-- configuration clock (?) from AVR (to detect when AVR ready)
		led			: out std_logic_vector(7 downto 0);	 -- 8 LEDs on Mojo board
		spi_sck		: in  std_logic;		-- SPI clock to from AVR
		spi_ss		: in  std_logic;		-- SPI slave select from AVR
		spi_mosi	: in  std_logic;		-- SPI serial data master out, slave in (AVR -> FPGA)
		spi_miso	: out std_logic;		-- SPI serial data master in, slave out (AVR <- FPGA)
		spi_channel : out std_logic_vector(3 downto 0);  -- analog read channel (input to AVR service task)
		avr_tx		: in  std_logic;		-- serial data transmited from AVR/USB (FPGA recieve)
		avr_rx		: out std_logic;		-- serial data for AVR/USB to receive (FPGA transmit)
		avr_rx_busy : in  std_logic;			-- AVR/USB buffer full (don't send data when true)
		i2c_scl		: inout std_logic;
		i2c_sda		: inout std_logic
	);
	
	
end mojo_top;

architecture RTL of mojo_top is


signal rst	: std_logic;		-- reset signal (rst_n inverted for postive logic)

-- signals for avr_interface
signal channel			: std_logic_vector(3 downto 0);
signal sample			: std_logic_vector(9 downto 0);
signal sample_channel	: std_logic_vector(3 downto 0);
signal new_sample		: std_logic;
signal tx_data			: std_logic_vector(7 downto 0);
signal rx_data			: std_logic_vector(7 downto 0);
signal new_tx_data		: std_logic;
signal new_rx_data		: std_logic;
signal tx_busy			: std_logic;

-- signals for UART echo test
signal uart_data		: std_logic_vector(7 downto 0);	-- data buffer for UART (holds last recieved/sent byte)
signal data_to_send		: std_logic;					-- indicates data to send in uart_data

-- signals for sample test
signal last_sample		: std_logic_vector(9 downto 0);

-- signals for MicroBlaze mcs
signal addr_strobe : std_logic;
signal read_strobe : std_logic;
signal write_strobe : std_logic;
signal address_out : std_logic_vector(31 downto 0);
signal write_data : std_logic_vector(31 downto 0);
signal read_data : std_logic_vector(31 downto 0);
signal byte_enable : std_logic_vector(3 downto 0);
signal ready : std_logic;
signal FIT1_Toggle : std_logic;
signal GPO1 : std_logic_vector(7 downto 0);

signal mcs_rx : std_logic;
signal mcs_tx : std_logic;
signal test : std_logic_vector(7 downto 0);

COMPONENT microblaze_mcs
  PORT (
    Clk : IN STD_LOGIC;
    Reset : IN STD_LOGIC;
    IO_Addr_Strobe : OUT STD_LOGIC;
    IO_Read_Strobe : OUT STD_LOGIC;
    IO_Write_Strobe : OUT STD_LOGIC;
    IO_Address : OUT STD_LOGIC_VECTOR(31 downto 0);
    IO_Byte_Enable : OUT STD_LOGIC_VECTOR(3 downto 0);
    IO_Write_Data : OUT STD_LOGIC_VECTOR(31 downto 0);
    IO_Read_Data : IN STD_LOGIC_VECTOR(31 downto 0);
    IO_Ready : IN STD_LOGIC;
	 UART_Rx : IN STD_LOGIC;
    UART_Tx : OUT STD_LOGIC;
    FIT1_Toggle : OUT STD_LOGIC;
    GPO1 : OUT STD_LOGIC_VECTOR(7 downto 0)
  );
END COMPONENT;

COMPONENT Module_UART_interface
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		rx : IN std_logic;
		tx_data : IN std_logic_vector(7 downto 0);
		tx_new_data : IN std_logic;
		rx_block : IN std_logic;          
		tx : OUT std_logic;
		rx_data : OUT std_logic_vector(7 downto 0);
		rx_new_data : OUT std_logic
		);
	END COMPONENT;

--signals for RAM
signal addr_a : std_logic_vector(31 downto 0);
signal byte_enable_a : std_logic_vector(3 downto 0);
signal data_in_a : std_logic_vector(31 downto 0);
signal data_out_a : std_logic_vector(31 downto 0);
signal byte_enable_b : std_logic_vector(3 downto 0);
signal addr_b : std_logic_vector(31 downto 0);
signal data_in_b : std_logic_vector(31 downto 0);
signal data_out_b : std_logic_vector(31 downto 0);

--BRAM
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

--RAM interface used for mcs/ram communication
	COMPONENT ram_interface
	PORT(
		clk : IN std_logic;
		mcs_addr : IN std_logic_vector(31 downto 0);
		mcs_write : IN std_logic_vector(31 downto 0);
		mcs_byte_enable : IN std_logic_vector(3 downto 0);
		mcs_rd_strobe : IN std_logic;
		mcs_wr_strobe : IN std_logic;
		mcs_addr_strobe : IN std_logic;
		ram_read : IN std_logic_vector(31 downto 0);          
		mcs_read : OUT std_logic_vector(31 downto 0);
		mcs_ready : OUT std_logic;
		ram_addr : OUT std_logic_vector(31 downto 0);
		ram_write : OUT std_logic_vector(31 downto 0);
		ram_byte_enable : OUT std_logic_vector(3 downto 0);
		led : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	

signal fetch_decode : std_logic;

COMPONENT i2c
	PORT(
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
END COMPONENT;

COMPONENT Module_register_signals
	PORT(
		clk : IN std_logic;
		ram_read : IN std_logic_vector(31 downto 0);          
		ram_addr : IN std_logic_vector(31 downto 0);
		byte_enable_a : IN std_logic_vector(3 downto 0);
		enable_i2c : OUT std_logic;
		
		led : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

begin

	rst	<= NOT rst_n;						-- generate non-inverted reset signal from rst_n button



-- NOTE: If you are not using the avr_interface component, then you should uncomment the
--       following lines to keep the AVR output lines in a high-impeadence state.  When
--       using the avr_interface, this will be done automatically and these lines should
--       be commented out (or else "multiple signals connected to output" errors).
--spi_miso <= 'Z';						-- keep AVR output lines high-Z
--avr_rx <= 'Z';						-- keep AVR output lines high-Z
--spi_channel <= "ZZZZ";				-- keep AVR output lines high-Z

-- instantiate the avr_interface (to handle USB UART and analog sampling, etc.)
	avr_interface : entity work.avr_interface
		port map (
			clk			=> clk,				-- 50Mhz clock
			rst			=> rst,				-- reset signal
			-- AVR MCU pin connections (that will be managed)
			cclk		=> cclk,
			spi_miso	=> spi_miso,
			spi_mosi	=> spi_mosi,
			spi_sck		=> spi_sck,
			spi_ss		=> spi_ss,
			spi_channel	=> spi_channel,
			tx			=> avr_rx,
			tx_block	=> avr_rx_busy,
			rx			=> avr_tx,
			-- analog sample interface
			channel		=> channel,			-- set this to channel to sample (0, 1, 4, 5, 6, 7, 8, or 9)
			new_sample	=> new_sample,		-- indicates when new sample available
			sample_channel => sample_channel,	-- channel number of sample (only when new_sample = '1')
			sample		=> sample,			-- 10 bit sample value (only when new_sample = '1')
			-- USB UART tx interface
			new_tx_data	=> new_tx_data,		-- set to set data in tx_data (only when tx_busy = '0')
			tx_data		=> tx_data,			-- data to send
			tx_busy		=> tx_busy,			-- indicates AVR is not ready to send data
			-- USB UART rx interface
			new_rx_data	=> new_rx_data,		-- set when new data is received
			rx_data		=> rx_data			-- received data (only when new_tx_data = '1')
		);

	mcs_0 : microblaze_mcs
		port map (
			 clk => clk,
			 Reset => rst,
			 IO_Addr_Strobe => addr_strobe,
			 IO_Read_Strobe => read_strobe,
			 IO_Write_Strobe => write_strobe,
			 IO_Address => address_out,
			 IO_Byte_Enable => byte_enable,
			 IO_Write_Data => write_data,
			 IO_Read_Data => read_data,
			 IO_Ready => ready,
			 UART_Rx => mcs_rx,
			 UART_Tx => mcs_tx,
			 FIT1_Toggle => open,
			 GPO1 => open
	);

	dual_bram_0 : ram
		port map (
			--port A connected to mcs_0
			 clka => clk,
			 wea => byte_enable_a,
			 addra => addr_a,
			 dina => data_in_a,
			 douta => data_out_a,
--			 wea => byte_enable,
--			 addra => address_out,
--			 dina => write_data,
--			 douta => read_data,
			--port B connected to user_logic
			 clkb => clk,
--			 web => X"1",
--			 addrb => X"00000001",
--			 dinb => X"AAAAAAAA",
--			 doutb => open
			 web => byte_enable_b,
			 addrb => addr_b,
			 dinb => data_in_b,
			 doutb => data_out_b
		);
		
	Inst_Module_UART_interface: Module_UART_interface 
		PORT MAP(
			clk => clk,
			rst => rst,
			rx => mcs_tx,
			tx => mcs_rx,
			rx_data => tx_data,
			--rx_data => led,
			tx_data => rx_data,
			rx_new_data => new_tx_data,
			tx_new_data => new_rx_data,
			rx_block => tx_busy
	);
	
		Module_ram_interface : ram_interface PORT MAP(
		clk => clk,
		
		mcs_addr => address_out,
		mcs_read => read_data,
		mcs_write => write_data,
		mcs_byte_enable => byte_enable,
		mcs_ready => ready,
		mcs_rd_strobe => read_strobe,
		mcs_wr_strobe => write_strobe,
		mcs_addr_strobe => addr_strobe,
		
		ram_addr => addr_a,
		ram_read => data_out_a,
		ram_write => data_in_a,
		ram_byte_enable => byte_enable_a,
		
		led => open
	);

--I2C module
--Contain I2C Physical interface and ram interface
--ADDR CBASEADDR + 0x04
	Module_I2C : i2c
		PORT MAP(
			clk => clk,
			fetch_decode => fetch_decode,
			ram_addr => addr_b,
			ram_din => data_in_b,
			ram_dout => data_out_b,
			ram_byte => byte_enable_b,
			scl => i2c_scl,
			sda => i2c_sda,
			
			led => led
		);
	
	Module_enabler: Module_register_signals PORT MAP(
		clk => clk,
		ram_addr => addr_a,
		ram_read => data_in_a,
		enable_i2c => fetch_decode,
		byte_enable_a => byte_enable_a,
		
		led => open
	);

-- The following is simple test that will transmit any bytes received on UART and show upper 8-bits of analog 0 sample on LEDs
--echo: process(clk, rst)
--begin
--	if rst = '1' then									-- set signals to default on reset
--		tx_data		<= (others => '0');
--		uart_data	<= (others => '0');
--		data_to_send <= '0';
--		new_tx_data <= '0';
--		channel <= "0000";									-- use channel 0 for this test
--		last_sample <= (others => '0');
--		led(7 downto 1) <= "1111111";									-- flash LEDs on reset
--	elsif rising_edge(clk) then
--		if data_to_send = '1' and tx_busy = '0' then	-- if there is data to send and UART is not busy then
--			tx_data <= test;							-- set tx_data input
--			new_tx_data <= '1';								-- signal there is data to tx
--			data_to_send <= '0';							-- clear our send flag
--			led <= test;
--		else
--			new_tx_data <= '0';							-- else, we have no new tx data
--		end if;
--
--		if new_rx_data = '1' then						-- if there is new received data then
--			uart_data <= rx_data;							-- put it into uart_data register
--			data_to_send <= '1';							-- set flag that we have data to send
--		end if;
--		
--		if new_sample = '1' then						-- if there is a new sample available then
--			last_sample <= sample;							-- put it into last_sample register
--			--led <= last_sample(9 downto 2);					-- display upper 8-bits of last 10-bit analog sample reading
--		end if;
--		
--		
--	end if;
--end process echo;

end RTL;
