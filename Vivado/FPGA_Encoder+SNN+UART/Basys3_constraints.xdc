## ============================================================================
## BASYS3 XDC for basys3_mitbih_top (with XADC for live ECG)
## ============================================================================

## Clock
set_property PACKAGE_PIN W5 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
    create_clock -period 10.00 -name sys_clk_pin [get_ports clk]

## Reset (BTNC center button)
set_property PACKAGE_PIN U18 [get_ports rst]
    set_property IOSTANDARD LVCMOS33 [get_ports rst]

## UART over USB
set_property PACKAGE_PIN B18 [get_ports uart_rx]
    set_property IOSTANDARD LVCMOS33 [get_ports uart_rx]
set_property PACKAGE_PIN A18 [get_ports uart_tx]
    set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]

## Switches
set_property PACKAGE_PIN V17 [get_ports {input_select[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_select[0]}]
set_property PACKAGE_PIN V16 [get_ports {input_select[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_select[1]}]
set_property PACKAGE_PIN W16 [get_ports {process_mode_select[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {process_mode_select[0]}]
set_property PACKAGE_PIN W17 [get_ports {process_mode_select[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {process_mode_select[1]}]
set_property PACKAGE_PIN W15 [get_ports {encoding_select[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {encoding_select[0]}]
set_property PACKAGE_PIN V15 [get_ports {encoding_select[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {encoding_select[1]}]

## XADC Analog Input (Pmod JXADC column 1 = VAUX6)
## XA1_P (J3) = vauxp6 = positive input
## XA1_N (K3) = vauxn6 = negative input
## Connect AD8232 OUT to J3, GND to K3
set_property PACKAGE_PIN J3 [get_ports vauxp6]
    set_property IOSTANDARD LVCMOS33 [get_ports vauxp6]
set_property PACKAGE_PIN K3 [get_ports vauxn6]
    set_property IOSTANDARD LVCMOS33 [get_ports vauxn6]

## Status LEDs
set_property PACKAGE_PIN U16 [get_ports {status_led[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {status_led[0]}]
set_property PACKAGE_PIN E19 [get_ports {status_led[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {status_led[1]}]
set_property PACKAGE_PIN U19 [get_ports {status_led[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {status_led[2]}]
set_property PACKAGE_PIN V19 [get_ports {status_led[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {status_led[3]}]
set_property PACKAGE_PIN W18 [get_ports {status_led[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {status_led[4]}]
set_property PACKAGE_PIN U15 [get_ports {status_led[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {status_led[5]}]
set_property PACKAGE_PIN U14 [get_ports {status_led[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {status_led[6]}]
set_property PACKAGE_PIN V14 [get_ports {status_led[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {status_led[7]}]

## Async path relaxation
set_false_path -from [get_ports uart_rx]
set_false_path -from [get_ports rst]
set_false_path -from [get_ports {input_select[*]}]
set_false_path -from [get_ports {process_mode_select[*]}]
set_false_path -from [get_ports {encoding_select[*]}]

## Configuration
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
