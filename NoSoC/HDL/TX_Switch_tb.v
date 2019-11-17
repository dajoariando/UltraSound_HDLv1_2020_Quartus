`timescale 1ps/1ps

module TX_Switch_tb;
	
	parameter REG_WIDTH = 8;
	
	parameter timescale_ref = 1000000; // reference scale based on timescale
	parameter CLK_RATE_HZ = 20; // in MHz
	
	//setting up clockticks
	localparam integer clockticks = (timescale_ref / CLK_RATE_HZ) / 2.0;
	
	//Signals
	reg START;
	
	wire  		TXD1N;
	wire  		TXD1P;
	wire  		TXD2N;
	wire  		TXD2P;
	wire  		TXD3N;
	wire  		TXD3P;
	wire  		TXD4N;
	wire  		TXD4P;
	wire  		TXD5N;
	wire  		TXD5P;
	wire  		TXD6N;
	wire  		TXD6P;
	wire  		TXD7N;
	wire  		TXD7P;
	wire  		TXD8N;
	wire  		TXD8P;
	
	//System Signals
	reg CLK;
	reg RESET;
	
	reg [REG_WIDTH-1:0] init_delay;
	reg [REG_WIDTH-1:0] tx_len;
	reg [REG_WIDTH-1:0] damp_len;
	
	TX_Switch
	uut
	(
	//Signals
		.CLK(CLK),			
		.RESET(RESET),
		.START(START),		
		
		.init_delay (init_delay),
		.tx_len (tx_len),
		.damp_len (damp_len),
	
		.TXP						({
				TXD1P,TXD2P,TXD3P,TXD4P,
				TXD5P,TXD6P,TXD7P,TXD8P	
		}),
		
		.TXN						({
				TXD1N,TXD2N,TXD3N,TXD4N,
				TXD5N,TXD6N,TXD7N,TXD8N
		}));
	
	initial begin
	CLK = 1'b1;
	RESET = 1'b0;
	START = 1'b0;
	
	init_delay = 5;
	tx_len = 7;
	damp_len = 3;
	
	#(clockticks*4) RESET = 1'b1;
	#(clockticks*4) RESET = 1'b0;
	#(clockticks*12) START = 1'b1;
	#(clockticks*1) START = 1'b0;

	end
	
	always begin
			#clockticks CLK = ~CLK;
	end
	
	
endmodule
