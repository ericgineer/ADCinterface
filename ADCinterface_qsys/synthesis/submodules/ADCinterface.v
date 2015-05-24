`timescale 1ns/1ns 

// This is a test module to interface to the BeScope ADC board and
// BeMicro CV FPGA development board
module ADCinterface(
						// ADC board interface
								output reg ADC_CSBn,
							   output reg ADC_SDIO,
								output reg ADC_SCLK,
								output reg ADC_OEn,
								output reg ADC_SDOn,
								input wire [7:0] D,
								input wire DCO,
								input wire main_clk,
								input wire rst,
								output reg CHA_3P5X_PDn,
								output reg CHA_2X_PDn,
								output reg CHA_8P5X_PDn,
								output reg CHA_IN1,
								output reg CHA_IN3,
								output reg CHA_EN,
								output reg CHA_IN4,
								output reg MON_FS,
								output reg MON_EN,
								output reg CHB_EN,
								output reg CHB_IN2,
								output reg CHB_IN1,
								output reg CHB_IN4,
								output reg CHB_3P5X_PDn,
								output reg CHB_2X_PDn,
								output reg CHB_8P5X_PDn,
								input wire button1,
								input wire button2,
								input wire switch1,
								input wire switch2,
								input wire switch3,
								output reg [7:0] led,
								
						// Avalon-MM interface
								input wire [3:0] address,
								input wire       read,
								input wire 		 write,
								input wire [7:0] writedata,
								output reg [7:0] readdata);
				
				
				
		// Memory address definition
		//
		// 0: Write value to LEDs
		// 1: Enable ADC (0: ADC off, 1: ADC on)
		// 2: Read ADC channel A data (read only register)
		// 3: Read ADC channel B data (read only register)
		// 4: Channel A gain select (0: 2x, 1: 3.5x, 2: 8.5x)
		// 5: Channel B gain select (0: 2x, 1: 3.5x, 2: 8.5x)
		// 6: Enable onboard signal generator (0: Sig gen off, 1: Sig gen on)
		// 7: Set onboard signal generator frequency (0: 2.5 MHz, 1: 5 MHz)
		// 8: 0 - Display register values on LEDs
		//    1 - Display ADC channel A values on LEDs
		//    2 - Display ADC channel B values on LEDs
		
		reg [7:0] mem[0:14];
		
		reg [7:0] led_tmp;
		reg [7:0] adc_cha_tmp, adc_chb_tmp;
		reg [7:0] mem_null;

		
		reg [21:0] clk_divide = 0;
		reg clk_new = 0;
						
		always @(posedge DCO)
		begin
			clk_divide <= clk_divide + 1;
			if (clk_divide <= 0)
			begin
				clk_new <= ~clk_new;
			end
		end
		
		always @(posedge DCO)
		begin
			adc_cha_tmp <= ~D[7:0];
			mem[2] <= D[7:0];
		end
		
		always @(negedge DCO)
		begin
			adc_chb_tmp <= ~D[7:0];
			mem[3] <= D[7:0];
		end
		
		// Avalon-MM interface
		always @(posedge main_clk)
		begin
			if (read)
				readdata <= mem[address];
			else
				readdata <= 8'b0;
			if (write)
				case (address)
					0: mem[0] <= writedata;
					1: mem[1] <= writedata;
					2: mem_null <= writedata;
					3: mem_null <= writedata;
					4: mem[4] <= writedata;
					5: mem[5] <= writedata;
					6: mem[6] <= writedata;
					7: mem[7] <= writedata;
					8: mem[8] <= writedata;
					default: mem_null <= writedata;
				endcase
		end
				
		
		always @(posedge main_clk)
		begin
			// Set input amplifier \PD to enable/disable the amplifiers (active high)
			CHA_3P5X_PDn <= 1;
			CHA_2X_PDn 	 <= 1;
			CHA_8P5X_PDn <= 1;
			
			CHB_3P5X_PDn <= 1;
			CHB_2X_PDn 	 <= 1;
			CHB_8P5X_PDn <= 1;
			
			// Set SDIO/PWDN (set to 1 to powerdown)
			
			ADC_SDOn <= 0;
			
			ADC_SCLK <= 0;
			
			// Set SPI Chip Select (active low)
			
			ADC_CSBn <= 1;
			
			// Write values to led_tmp
			
			led_tmp <= ~mem[0];
			
			// Set ADC \OE (active low)
			
			ADC_OEn <= ~mem[1];
			
			// Set channel enable (active low)
			CHA_EN <= 0;
			CHB_EN <= 0;
			
			// Set input MUX to select the proper gain amplifier (active low)
			
			case (mem[4])
				0: begin
						CHA_IN1 <= 1;  // CHA_GAIN8P5X
						CHA_IN3 <= 0;  // CHA_GAIN2X
						CHA_IN4 <= 1;  // CHA_GAIN3P5X
				   end
				1: begin
						CHA_IN1 <= 1;  // CHA_GAIN8P5X
						CHA_IN3 <= 1;  // CHA_GAIN2X
						CHA_IN4 <= 0;  // CHA_GAIN3P5X
				   end
				2: begin
						CHA_IN1 <= 0;  // CHA_GAIN8P5X
						CHA_IN3 <= 1;  // CHA_GAIN2X
						CHA_IN4 <= 1;  // CHA_GAIN3P5X
				   end
				default: begin
							CHA_IN1 <= 1;  // CHA_GAIN8P5X
							CHA_IN3 <= 1;  // CHA_GAIN2X
							CHA_IN4 <= 0;  // CHA_GAIN3P5X
						 end
			endcase
			
			case (mem[5])
				0: begin
						CHB_IN1 <= 1;  // CHB_GAIN3P5X
						CHB_IN2 <= 0;  // CHB_GAIN2X
						CHB_IN4 <= 1;  // CHB_GAIN8P5X
				   end
				1: begin
						CHB_IN1 <= 0;  // CHB_GAIN3P5X
						CHB_IN2 <= 1;  // CHB_GAIN2X
						CHB_IN4 <= 1;  // CHB_GAIN8P5X
				   end
				2: begin
						CHB_IN1 <= 1;  // CHB_GAIN3P5X
						CHB_IN2 <= 1;  // CHB_GAIN2X
						CHB_IN4 <= 0;  // CHB_GAIN8P5X
				   end
				default: begin
							CHB_IN1 <= 0;  // CHB_GAIN3P5X
							CHB_IN2 <= 1;  // CHB_GAIN2X
							CHB_IN4 <= 1;  // CHB_GAIN8P5X
						 end
			endcase				
			
			// Set MON_EN (active high) and MON_FS (1: F1, 0: F0)
			MON_EN <= mem[6];
			MON_FS <= mem[7];
		
			case (mem[8])
				0: led <= led_tmp;
				1: led <= adc_cha_tmp;
				2: led <= adc_chb_tmp;
				default: led <= led_tmp;
			endcase
		end
endmodule
						
						