set_global_assignment -entity "pll_adc_datain" -library "lib_pll_adc_datain" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll_adc_datain" -library "lib_pll_adc_datain" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "pll_adc_datain" -library "lib_pll_adc_datain" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll_adc_datain" -name SPD_FILE [file join $::quartus(sip_path) "pll_adc_datain.spd"]

set_global_assignment -library "lib_pll_adc_datain" -name MISC_FILE [file join $::quartus(sip_path) "pll_adc_datain_sim/pll_adc_datain.vo"]
