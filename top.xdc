set_property PACKAGE_PIN L16 [get_ports HWClock]
set_property IOSTANDARD LVCMOS33 [get_ports HWClock]
create_clock -period 8.000 -name Clock1[get_ports HWClock]

set_property PACKAGE_PIN G15 [get_ports Switch[0]]
set_property IOSTANDARD LVCMOS33 [get_ports Switch[0]]

set_property PACKAGE_PIN P15 [get_ports Switch[1]]
set_property IOSTANDARD LVCMOS33 [get_ports Switch[1]]

set_property PACKAGE_PIN W13 [get_ports Switch[2]]
set_property IOSTANDARD LVCMOS33 [get_ports Switch[2]]

set_property PACKAGE_PIN T16 [get_ports Switch[3]]
set_property IOSTANDARD LVCMOS33 [get_ports Switch[3]]

set_property PACKAGE_PIN M14 [get_ports LED[0]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[0]]

set_property PACKAGE_PIN M15 [get_ports LED[1]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[1]]

set_property PACKAGE_PIN G14 [get_ports LED[2]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[2]]

set_property PACKAGE_PIN D18 [get_ports LED[3]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[3]]
