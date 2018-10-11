onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ADC_ACQ_WINGEN_tb/ACQ_WND
add wave -noupdate -radix unsigned /ADC_ACQ_WINGEN_tb/ADC_INIT_DELAY
add wave -noupdate -radix unsigned /ADC_ACQ_WINGEN_tb/SAMPLES_PER_ECHO
add wave -noupdate /ADC_ACQ_WINGEN_tb/ACQ_EN
add wave -noupdate /ADC_ACQ_WINGEN_tb/CLK
add wave -noupdate /ADC_ACQ_WINGEN_tb/RESET
add wave -noupdate -radix hexadecimal /ADC_ACQ_WINGEN_tb/ADC_ACQ_WINGEN1/State
add wave -noupdate -radix hexadecimal /ADC_ACQ_WINGEN_tb/ADC_ACQ_WINGEN1/ADC_DELAY_CNT
add wave -noupdate -radix hexadecimal /ADC_ACQ_WINGEN_tb/ADC_ACQ_WINGEN1/SAMPLES_PER_ECHO_CNT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9128731 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 328
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 10
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {31500 ns}
