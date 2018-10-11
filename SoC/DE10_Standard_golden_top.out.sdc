## Generated SDC file "DE10_Standard_golden_top.out.sdc"

## Copyright (C) 2017  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Standard Edition"

## DATE    "Sun Sep 09 20:39:39 2018"

##
## DEVICE  "5CSXFC6D6F31C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 40.000 -waveform { 0.000 20.000 } [get_ports {altera_reserved_tck}]
create_clock -name {CLOCK2_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK2_50}]
create_clock -name {CLOCK3_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK3_50}]
create_clock -name {CLOCK4_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK4_50}]
create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]
create_clock -name {TD_CLK27} -period 37.037 -waveform { 0.000 18.518 } [get_ports {TD_CLK27}]
create_clock -name {tv_27m_ext} -period 37.037 -waveform { 0.000 18.518 } 
create_clock -name {ADC_DATA_CLK} -period 4.166 -waveform { 0.000 2.083 } [get_ports { dco_p }]
create_clock -name {ADC_LAUNCH_CLK} -period 4.166 -waveform { 3.124 5.208 } 


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} -source [get_pins {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|refclkin}] -duty_cycle 50/1 -multiply_by 4 -divide_by 2 -master_clock {ADC_DATA_CLK} [get_pins {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] 
create_generated_clock -name {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 2 -master_clock {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} [get_pins {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {ADC_DATA_CLK}] -rise_to [get_clocks {ADC_DATA_CLK}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {ADC_DATA_CLK}] -rise_to [get_clocks {ADC_DATA_CLK}] -hold 0.270  
set_clock_uncertainty -rise_from [get_clocks {ADC_DATA_CLK}] -fall_to [get_clocks {ADC_DATA_CLK}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {ADC_DATA_CLK}] -fall_to [get_clocks {ADC_DATA_CLK}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {ADC_DATA_CLK}] -rise_to [get_clocks {ADC_DATA_CLK}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {ADC_DATA_CLK}] -rise_to [get_clocks {ADC_DATA_CLK}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {ADC_DATA_CLK}] -fall_to [get_clocks {ADC_DATA_CLK}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {ADC_DATA_CLK}] -fall_to [get_clocks {ADC_DATA_CLK}] -hold 0.270  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -hold 0.270  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -hold 0.270  
set_clock_uncertainty -rise_from [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {ADC_DATA_CLK}] -rise_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.190  
set_clock_uncertainty -rise_from [get_clocks {ADC_DATA_CLK}] -rise_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.180  
set_clock_uncertainty -rise_from [get_clocks {ADC_DATA_CLK}] -fall_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.190  
set_clock_uncertainty -rise_from [get_clocks {ADC_DATA_CLK}] -fall_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.180  
set_clock_uncertainty -fall_from [get_clocks {ADC_DATA_CLK}] -rise_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.190  
set_clock_uncertainty -fall_from [get_clocks {ADC_DATA_CLK}] -rise_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.180  
set_clock_uncertainty -fall_from [get_clocks {ADC_DATA_CLK}] -fall_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.190  
set_clock_uncertainty -fall_from [get_clocks {ADC_DATA_CLK}] -fall_to [get_clocks {U1|pll_adc_datain1|pll_adc_datain_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.180  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {tv_27m_ext}]  3.750 [get_ports {TD_DATA[0]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m_ext}]  -2.560 [get_ports {TD_DATA[0]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m_ext}]  3.750 [get_ports {TD_DATA[1]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m_ext}]  -2.560 [get_ports {TD_DATA[1]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m_ext}]  3.750 [get_ports {TD_DATA[2]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m_ext}]  -2.560 [get_ports {TD_DATA[2]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m_ext}]  3.750 [get_ports {TD_DATA[3]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m_ext}]  -2.560 [get_ports {TD_DATA[3]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m_ext}]  3.750 [get_ports {TD_DATA[4]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m_ext}]  -2.560 [get_ports {TD_DATA[4]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m_ext}]  3.750 [get_ports {TD_DATA[5]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m_ext}]  -2.560 [get_ports {TD_DATA[5]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m_ext}]  3.750 [get_ports {TD_DATA[6]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m_ext}]  -2.560 [get_ports {TD_DATA[6]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m_ext}]  3.750 [get_ports {TD_DATA[7]}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m_ext}]  -2.560 [get_ports {TD_DATA[7]}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m_ext}]  3.750 [get_ports {TD_HS}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m_ext}]  -2.560 [get_ports {TD_HS}]
set_input_delay -add_delay -max -clock [get_clocks {tv_27m_ext}]  3.750 [get_ports {TD_VS}]
set_input_delay -add_delay -min -clock [get_clocks {tv_27m_ext}]  -2.560 [get_ports {TD_VS}]
set_input_delay -add_delay  -clock_fall -clock [get_clocks {altera_reserved_tck}]  3.000 [get_ports {altera_reserved_tdi}]
set_input_delay -add_delay  -clock_fall -clock [get_clocks {altera_reserved_tck}]  3.000 [get_ports {altera_reserved_tms}]
set_input_delay -add_delay  -clock [get_clocks {ADC_DATA_CLK}]  0.100 [get_ports {dina_p}]
set_input_delay -add_delay  -clock [get_clocks {ADC_DATA_CLK}]  0.100 [get_ports {dinb_p}]
set_input_delay -add_delay  -clock [get_clocks {ADC_DATA_CLK}]  0.100 [get_ports {dinc_p}]
set_input_delay -add_delay  -clock [get_clocks {ADC_DATA_CLK}]  0.100 [get_ports {dind_p}]
set_input_delay -add_delay  -clock [get_clocks {ADC_DATA_CLK}]  0.100 [get_ports {dine_p}]
set_input_delay -add_delay  -clock [get_clocks {ADC_DATA_CLK}]  0.100 [get_ports {dinf_p}]
set_input_delay -add_delay  -clock [get_clocks {ADC_DATA_CLK}]  0.100 [get_ports {ding_p}]
set_input_delay -add_delay  -clock [get_clocks {ADC_DATA_CLK}]  0.100 [get_ports {dinh_p}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  3.000 [get_ports {altera_reserved_tdo}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_ports {KEY*}] 
set_false_path -from [get_ports {SW*}] 
set_false_path -to [get_ports {LEDR*}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

