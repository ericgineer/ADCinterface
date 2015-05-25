5/25/15

ADCinterface controls the ADC on the BeScope board and writes
the output of the ADC to the LEDs on the BeMicro CV board and 
to registers that can be read using System Console and the Altera 
JTAG to Avalon memory master IP core.

Steps for using the ADC interface QSYS project:

1) The project has already been synthesized, so load top_ADCinterface.sof
from the output_files directory onto the BeMicro CV board using the Altera programmer.

2) Start the Altera system console from Quartus II. In the Quartus II
software, go to Tools -> System Debugging Tools -> System Console.

3) System console should automatically connect to the BeMicro CV board.
If System console fails to connect, make sure the BeMicro CV board is on and
the USB cable is connected to the PC.

4) Once System console has connected to the BeMicro CV board, type
"source ReadRegisters.tcl" into the Tcl Console window. You should see 
all 8 of the LEDs on the board turn on.

5) Use the memory address definition in ADCinterface.v to see the available
registers.