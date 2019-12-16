# LEDs-in-Verilog
A simple 'Hello World' project for Digilent's Zybo Zynq-7000 board

All it involves are 4 LEDs, 4 switches, and a clock. I implemented the whole thing under one module, using an FSM under an always @ block. Switches 0 & 1 are used to switch between 4 states, switch 2 controls the speed at which the LED outputs change, and switch 3 determines the direction (not applicable for state 1). 

# State 1
Blinks all LEDs at the same time. At this point, the FPGA dev board could be an honorary Arduino. 

# State 2
Adds one bit at a time. 

# State 3 
LEDs take turns turning on, giving the appearance of "moving" from one end of the panel to the other. Implemented as an FSM. 

# State 4
This reminds me of the old snake game in Nokia phones. Implemented as a LUT. 
