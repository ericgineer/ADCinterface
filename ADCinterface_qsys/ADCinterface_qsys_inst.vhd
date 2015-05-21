	component ADCinterface_qsys is
		port (
			clk_clk                   : in  std_logic                    := 'X';             -- clk
			adc_interface_adc_csbn    : out std_logic;                                       -- adc_csbn
			adc_interface_adc_sdio    : out std_logic;                                       -- adc_sdio
			adc_interface_adc_sclk    : out std_logic;                                       -- adc_sclk
			adc_interface_adc_oen     : out std_logic;                                       -- adc_oen
			adc_interface_adc_sdon    : out std_logic;                                       -- adc_sdon
			adc_interface_cha_3p5     : out std_logic;                                       -- cha_3p5
			adc_interface_cha_2x      : out std_logic;                                       -- cha_2x
			adc_interface_cha_8p5x    : out std_logic;                                       -- cha_8p5x
			adc_interface_cha_in1     : out std_logic;                                       -- cha_in1
			adc_interface_cha_in3     : out std_logic;                                       -- cha_in3
			adc_interface_cha_en      : out std_logic;                                       -- cha_en
			adc_interface_cha_in4     : out std_logic;                                       -- cha_in4
			adc_interface_mon_fs      : out std_logic;                                       -- mon_fs
			adc_interface_mon_en      : out std_logic;                                       -- mon_en
			adc_interface_chb_en      : out std_logic;                                       -- chb_en
			adc_interface_chb_in2     : out std_logic;                                       -- chb_in2
			adc_interface_chb_in1     : out std_logic;                                       -- chb_in1
			adc_interface_chb_in4     : out std_logic;                                       -- chb_in4
			adc_interface_chb_3p5x    : out std_logic;                                       -- chb_3p5x
			adc_interface_chb_2x      : out std_logic;                                       -- chb_2x
			adc_interface_chb_8p5x    : out std_logic;                                       -- chb_8p5x
			adc_dataandclock_adc_data : in  std_logic_vector(7 downto 0) := (others => 'X'); -- adc_data
			adc_dataandclock_adc_clk  : in  std_logic                    := 'X';             -- adc_clk
			buttonsandswitches_b1     : in  std_logic                    := 'X';             -- b1
			buttonsandswitches_b2     : in  std_logic                    := 'X';             -- b2
			buttonsandswitches_sw1    : in  std_logic                    := 'X';             -- sw1
			buttonsandswitches_sw2    : in  std_logic                    := 'X';             -- sw2
			buttonsandswitches_sw3    : in  std_logic                    := 'X';             -- sw3
			leds_led                  : out std_logic_vector(7 downto 0)                     -- led
		);
	end component ADCinterface_qsys;

	u0 : component ADCinterface_qsys
		port map (
			clk_clk                   => CONNECTED_TO_clk_clk,                   --                clk.clk
			adc_interface_adc_csbn    => CONNECTED_TO_adc_interface_adc_csbn,    --      adc_interface.adc_csbn
			adc_interface_adc_sdio    => CONNECTED_TO_adc_interface_adc_sdio,    --                   .adc_sdio
			adc_interface_adc_sclk    => CONNECTED_TO_adc_interface_adc_sclk,    --                   .adc_sclk
			adc_interface_adc_oen     => CONNECTED_TO_adc_interface_adc_oen,     --                   .adc_oen
			adc_interface_adc_sdon    => CONNECTED_TO_adc_interface_adc_sdon,    --                   .adc_sdon
			adc_interface_cha_3p5     => CONNECTED_TO_adc_interface_cha_3p5,     --                   .cha_3p5
			adc_interface_cha_2x      => CONNECTED_TO_adc_interface_cha_2x,      --                   .cha_2x
			adc_interface_cha_8p5x    => CONNECTED_TO_adc_interface_cha_8p5x,    --                   .cha_8p5x
			adc_interface_cha_in1     => CONNECTED_TO_adc_interface_cha_in1,     --                   .cha_in1
			adc_interface_cha_in3     => CONNECTED_TO_adc_interface_cha_in3,     --                   .cha_in3
			adc_interface_cha_en      => CONNECTED_TO_adc_interface_cha_en,      --                   .cha_en
			adc_interface_cha_in4     => CONNECTED_TO_adc_interface_cha_in4,     --                   .cha_in4
			adc_interface_mon_fs      => CONNECTED_TO_adc_interface_mon_fs,      --                   .mon_fs
			adc_interface_mon_en      => CONNECTED_TO_adc_interface_mon_en,      --                   .mon_en
			adc_interface_chb_en      => CONNECTED_TO_adc_interface_chb_en,      --                   .chb_en
			adc_interface_chb_in2     => CONNECTED_TO_adc_interface_chb_in2,     --                   .chb_in2
			adc_interface_chb_in1     => CONNECTED_TO_adc_interface_chb_in1,     --                   .chb_in1
			adc_interface_chb_in4     => CONNECTED_TO_adc_interface_chb_in4,     --                   .chb_in4
			adc_interface_chb_3p5x    => CONNECTED_TO_adc_interface_chb_3p5x,    --                   .chb_3p5x
			adc_interface_chb_2x      => CONNECTED_TO_adc_interface_chb_2x,      --                   .chb_2x
			adc_interface_chb_8p5x    => CONNECTED_TO_adc_interface_chb_8p5x,    --                   .chb_8p5x
			adc_dataandclock_adc_data => CONNECTED_TO_adc_dataandclock_adc_data, --   adc_dataandclock.adc_data
			adc_dataandclock_adc_clk  => CONNECTED_TO_adc_dataandclock_adc_clk,  --                   .adc_clk
			buttonsandswitches_b1     => CONNECTED_TO_buttonsandswitches_b1,     -- buttonsandswitches.b1
			buttonsandswitches_b2     => CONNECTED_TO_buttonsandswitches_b2,     --                   .b2
			buttonsandswitches_sw1    => CONNECTED_TO_buttonsandswitches_sw1,    --                   .sw1
			buttonsandswitches_sw2    => CONNECTED_TO_buttonsandswitches_sw2,    --                   .sw2
			buttonsandswitches_sw3    => CONNECTED_TO_buttonsandswitches_sw3,    --                   .sw3
			leds_led                  => CONNECTED_TO_leds_led                   --               leds.led
		);

