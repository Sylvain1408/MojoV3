
-- VHDL Instantiation Created from source file ram_interface.vhd -- 23:16:40 05/14/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_ram_interface: ram_interface PORT MAP(
		clk => ,
		mcs_addr => ,
		mcs_read => ,
		mcs_write => ,
		mcs_byte_enable => ,
		mcs_ready => ,
		mcs_rd_strobe => ,
		mcs_wr_strobe => ,
		mcs_addr_strobe => ,
		ram_addr => ,
		ram_read => ,
		ram_write => ,
		ram_byte_enable => ,
		led => 
	);


