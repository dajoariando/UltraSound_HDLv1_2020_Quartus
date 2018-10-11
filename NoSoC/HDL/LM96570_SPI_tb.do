onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /LM96570_SPI_tb/START
add wave -noupdate /LM96570_SPI_tb/DONE
add wave -noupdate -radix hexadecimal /LM96570_SPI_tb/NUM_OF_SAMPLES
add wave -noupdate -radix hexadecimal /LM96570_SPI_tb/RD_DATA
add wave -noupdate /LM96570_SPI_tb/VALID
add wave -noupdate /LM96570_SPI_tb/SPI_CS_N
add wave -noupdate /LM96570_SPI_tb/SPI_SCK
add wave -noupdate /LM96570_SPI_tb/SPI_SDI
add wave -noupdate /LM96570_SPI_tb/BASE_CLK
add wave -noupdate /LM96570_SPI_tb/RESET
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {253516 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {1251018 ps}
