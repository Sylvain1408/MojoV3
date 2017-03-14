
-- VHDL Instantiation Created from source file i2c.vhd -- 11:40:37 03/14/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT i2c
	PORT(
		clk : IN std_logic;
		fetch_decode : IN std_logic;
		ram_dout : IN std_logic_vector(31 downto 0);    
		scl : INOUT std_logic;
		sda : INOUT std_logic;      
		ram_din : OUT std_logic_vector(31 downto 0);
		ram_addr : OUT std_logic_vector(31 downto 0);
		ram_byte : OUT std_logic_vector(3 downto 0);
		led : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_i2c: i2c PORT MAP(
		clk => ,
		fetch_decode => ,
		ram_din => ,
		ram_dout => ,
		ram_addr => ,
		ram_byte => ,
		scl => ,
		sda => ,
		led => 
	);


