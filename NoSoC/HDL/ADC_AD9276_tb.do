onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ADC_AD9276_tb/dco_locked
add wave -noupdate /ADC_AD9276_tb/fco_locked
add wave -noupdate /ADC_AD9276_tb/_wen
add wave -noupdate /ADC_AD9276_tb/dco_p
add wave -noupdate /ADC_AD9276_tb/dco_n
add wave -noupdate /ADC_AD9276_tb/fco_p
add wave -noupdate /ADC_AD9276_tb/fco_n
add wave -noupdate /ADC_AD9276_tb/dina_p
add wave -noupdate /ADC_AD9276_tb/dina_n
add wave -noupdate /ADC_AD9276_tb/load
add wave -noupdate /ADC_AD9276_tb/clkout
add wave -noupdate /ADC_AD9276_tb/C1/rst
add wave -noupdate -divider DCO_gen
add wave -noupdate -label dco_in /ADC_AD9276_tb/C1/IB1/o
add wave -noupdate -divider FCO_gen
add wave -noupdate -label fco_in /ADC_AD9276_tb/C1/IB2/o
add wave -noupdate -divider datain
add wave -noupdate -color Magenta -label datain_A /ADC_AD9276_tb/C1/IB3/o
add wave -noupdate -label q1_a {/ADC_AD9276_tb/C1/I1/dataout_l[0]}
add wave -noupdate /ADC_AD9276_tb/C1/q2_a_dly
add wave -noupdate -label q2_a {/ADC_AD9276_tb/C1/I1/dataout_h[0]}
add wave -noupdate -radix hexadecimal /ADC_AD9276_tb/C1/dat_q1_a
add wave -noupdate -radix hexadecimal /ADC_AD9276_tb/C1/dat_q2_a
add wave -noupdate -divider dataout
add wave -noupdate /ADC_AD9276_tb/C1/fco1
add wave -noupdate /ADC_AD9276_tb/C1/fco2
add wave -noupdate /ADC_AD9276_tb/C1/fcostb
add wave -noupdate -radix binary -childformat {{{/ADC_AD9276_tb/C1/dout_a[13]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[12]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[11]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[10]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[9]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[8]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[7]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[6]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[5]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[4]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[3]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[2]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[1]} -radix binary} {{/ADC_AD9276_tb/C1/dout_a[0]} -radix binary}} -subitemconfig {{/ADC_AD9276_tb/C1/dout_a[13]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[12]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[11]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[10]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[9]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[8]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[7]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[6]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[5]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[4]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[3]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[2]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[1]} {-height 15 -radix binary} {/ADC_AD9276_tb/C1/dout_a[0]} {-height 15 -radix binary}} /ADC_AD9276_tb/C1/dout_a
add wave -noupdate -radix hexadecimal /ADC_AD9276_tb/doutA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25997 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 199
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
WaveRestoreZoom {0 ps} {105 ns}
