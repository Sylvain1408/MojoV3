
-- VHDL Instantiation Created from source file i2c_ram_interface.vhd -- 17:05:15 03/18/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT i2c_ram_interface
	PORT(
		clk : IN std_logic;
		ram_read : IN std_logic_vector(31 downto 0);
		slave_dout : IN std_logic_vector(7 downto 0);
		queue : IN std_logic;
		data_valid : IN std_logic;
		stop : IN std_logic;
		go : IN std_logic;
		status : IN std_logic_vector(2 downto 0);
		ack_error : IN std_logic;          
		tic : OUT std_logic;
		ram_write : OUT std_logic_vector(31 downto 0);
		ram_addr : OUT std_logic_vector(31 downto 0);
		ram_byte : OUT std_logic_vector(3 downto 0);
		slave_din : OUT std_logic_vector(7 downto 0);
		rd : OUT std_logic;
		we : OUT std_logic;
		reset_n : OUT std_logic;
		led : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_i2c_ram_interface: i2c_ram_interface PORT MAP(
		clk => ,
		tic => ,
		ram_write => ,
		ram_addr => ,
		ram_read => ,
		ram_byte => ,
		slave_din => ,
		slave_dout => ,
		rd => ,
		we => ,
		queue => ,
		data_valid => ,
		stop => ,
		go => ,
		reset_n => ,
		status => ,
		ack_error => ,
		led => 
	);


