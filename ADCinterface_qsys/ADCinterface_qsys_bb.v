
module ADCinterface_qsys (
	clk_clk,
	adc_interface_adc_csbn,
	adc_interface_adc_sdio,
	adc_interface_adc_sclk,
	adc_interface_adc_oen,
	adc_interface_adc_sdon,
	adc_interface_cha_3p5,
	adc_interface_cha_2x,
	adc_interface_cha_8p5x,
	adc_interface_cha_in1,
	adc_interface_cha_in3,
	adc_interface_cha_en,
	adc_interface_cha_in4,
	adc_interface_mon_fs,
	adc_interface_mon_en,
	adc_interface_chb_en,
	adc_interface_chb_in2,
	adc_interface_chb_in1,
	adc_interface_chb_in4,
	adc_interface_chb_3p5x,
	adc_interface_chb_2x,
	adc_interface_chb_8p5x,
	adc_dataandclock_adc_data,
	adc_dataandclock_adc_clk,
	buttonsandswitches_b1,
	buttonsandswitches_b2,
	buttonsandswitches_sw1,
	buttonsandswitches_sw2,
	buttonsandswitches_sw3,
	leds_led);	

	input		clk_clk;
	output		adc_interface_adc_csbn;
	output		adc_interface_adc_sdio;
	output		adc_interface_adc_sclk;
	output		adc_interface_adc_oen;
	output		adc_interface_adc_sdon;
	output		adc_interface_cha_3p5;
	output		adc_interface_cha_2x;
	output		adc_interface_cha_8p5x;
	output		adc_interface_cha_in1;
	output		adc_interface_cha_in3;
	output		adc_interface_cha_en;
	output		adc_interface_cha_in4;
	output		adc_interface_mon_fs;
	output		adc_interface_mon_en;
	output		adc_interface_chb_en;
	output		adc_interface_chb_in2;
	output		adc_interface_chb_in1;
	output		adc_interface_chb_in4;
	output		adc_interface_chb_3p5x;
	output		adc_interface_chb_2x;
	output		adc_interface_chb_8p5x;
	input	[7:0]	adc_dataandclock_adc_data;
	input		adc_dataandclock_adc_clk;
	input		buttonsandswitches_b1;
	input		buttonsandswitches_b2;
	input		buttonsandswitches_sw1;
	input		buttonsandswitches_sw2;
	input		buttonsandswitches_sw3;
	output	[7:0]	leds_led;
endmodule
