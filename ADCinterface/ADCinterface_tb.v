`timescale 1ns/1ns

module ADCinterface_tb;
		// ADC board IO
		wire ADC_CSBn, ADC_SDIO, ADC_SCLK, ADC_OEn, ADC_SDOn;
		wire CHA_2X_PDn, CHA_3P5X_PDn, CHA_8P5X_PDn, CHA_EN, CHA_IN1, CHA_IN3, CHA_IN4;
		wire CHB_2X_PDn, CHB_3P5X_PDn, CHB_8P5X_PDn, CHB_EN, CHB_IN1, CHB_IN2, CHB_IN4;
		wire MON_EN, MON_FS;
		reg [7:0] D;
		reg DCO;
		reg main_clk;
		wire [7:0] led;
		
		// Avalon-MM IO
		reg [3:0] address;
		reg 	  write;
		reg 	  read;
		reg [7:0] writedata;
		wire [7:0] readdata;

 		 ADCinterface adc(.ADC_CSBn(ADC_CSBn),
							   .ADC_SDIO(ADC_SDIO),
								.ADC_SCLK(ADC_SCLK),
								.ADC_OEn(ADC_OEn),
								.ADC_SDOn(ADC_SDOn),
								.D(D),
								.DCO(DCO),
								.main_clk(main_clk),
								.CHA_3P5X_PDn(CHA_3P5X_PDn),
								.CHA_2X_PDn(CHA_2X_PDn),
								.CHA_8P5X_PDn(CHA_8P5X_PDn),
								.CHA_IN1(CHA_IN1),
								.CHA_IN3(CHA_IN3),
								.CHA_EN(CHA_EN),
								.CHA_IN4(CHA_IN4),
								.MON_FS(MON_FS),
								.MON_EN(MON_EN),
								.CHB_EN(CHB_EN),
								.CHB_IN2(CHB_IN2),
								.CHB_IN1(CHB_IN1),
								.CHB_IN4(CHB_IN4),
								.CHB_3P5X_PDn(CHB_3P5X_PDn),
								.CHB_2X_PDn(CHB_2X_PDn),
								.CHB_8P5X_PDn(CHB_8P5X_PDn),
								.button1(0),
								.button2(0),
								.switch1(0),
								.switch2(0),
								.switch3(0),
								.led(led),
								.address(address),
								.read(read),
								.write(write),
								.writedata(writedata),
								.readdata(readdata));
								
			initial
			begin
				DCO <= 0;
				main_clk <= 0;
				D <= 8'b0;
			end
				
			always #10 DCO <= ~DCO;
			always #10 main_clk <= ~main_clk;
			
			
			task writestuff;
				input [3:0] addr;
				input [7:0] stuff;
				begin
					address <= addr;
					writedata <= stuff;
					write <= 1;
					@(posedge main_clk)
					write <= 0;
				end
			endtask
			
			task readstuff;
				input [3:0] addr;
				begin
					address <= addr;
					read <= 1;
					@(posedge main_clk)
					read <= 0;
				end
			endtask
			
			initial
			begin
				repeat(5) @(posedge main_clk);
				writestuff(0, 8'b10101010);
				readstuff(0);
				
				writestuff(1, 0);
				readstuff(1);
				
				writestuff(1, 1);
				readstuff(1);
				
				writestuff(2, 0);
				readstuff(2);
				
				writestuff(2, 1);
				readstuff(2);
				
				writestuff(2, 2);
				readstuff(2);
				
				writestuff(3, 0);
				readstuff(3);
				
				writestuff(3, 1);
				readstuff(3);
				
				writestuff(3, 2);
				readstuff(3);
				
				writestuff(4, 0);
				readstuff(4);
				
				writestuff(4, 1);
				readstuff(4);
				
				writestuff(4, 2);
				readstuff(4);
				
				writestuff(5, 0);
				readstuff(5);
				
				writestuff(5, 1);
				readstuff(5);
				
				writestuff(6, 0);
				readstuff(6);
				
				writestuff(6, 1);
				readstuff(6);
				
				writestuff(7, 0);
				readstuff(7);
				
				writestuff(7, 1);
				readstuff(7);
				repeat(5) @(posedge main_clk);
				$finish;
			end
endmodule