onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {System Signal}
add wave -noupdate /TX_Switch_tb/START
add wave -noupdate /TX_Switch_tb/RESET
add wave -noupdate -radix hexadecimal /TX_Switch_tb/uut/State
add wave -noupdate /TX_Switch_tb/CLK
add wave -noupdate -divider {Internal Signal}
add wave -noupdate /TX_Switch_tb/uut/TX_EN
add wave -noupdate /TX_Switch_tb/uut/DAMP
add wave -noupdate -divider Settings
add wave -noupdate -radix decimal /TX_Switch_tb/init_delay
add wave -noupdate -radix decimal /TX_Switch_tb/tx_len
add wave -noupdate -radix decimal /TX_Switch_tb/uut/damp_len
add wave -noupdate -divider Output
add wave -noupdate /TX_Switch_tb/TXD1N
add wave -noupdate /TX_Switch_tb/TXD1P
add wave -noupdate /TX_Switch_tb/TXD2N
add wave -noupdate /TX_Switch_tb/TXD2P
add wave -noupdate /TX_Switch_tb/TXD3N
add wave -noupdate /TX_Switch_tb/TXD3P
add wave -noupdate /TX_Switch_tb/TXD4N
add wave -noupdate /TX_Switch_tb/TXD4P
add wave -noupdate /TX_Switch_tb/TXD5N
add wave -noupdate /TX_Switch_tb/TXD5P
add wave -noupdate /TX_Switch_tb/TXD6N
add wave -noupdate /TX_Switch_tb/TXD6P
add wave -noupdate /TX_Switch_tb/TXD7N
add wave -noupdate /TX_Switch_tb/TXD7P
add wave -noupdate /TX_Switch_tb/TXD8N
add wave -noupdate /TX_Switch_tb/TXD8P
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5136606 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 178
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
WaveRestoreZoom {462422 ps} {1244981 ps}
