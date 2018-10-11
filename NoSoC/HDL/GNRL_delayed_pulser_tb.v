`timescale 1ps / 1ps

module GNRL_delayed_pulser_tb;
	
	parameter timescale_ref = 1000000; // reference scale based on timescale
	parameter CLK_RATE_HZ = 4.3; // in MHz
	
	
	// clock ticks
	localparam integer clockticks = (timescale_ref / CLK_RATE_HZ) / 2.0;
	
	// signals
	reg SIG_IN;
	wire SIG_OUT;
	
	// parameters
	reg [31:0] DELAY;
	
	// system
	reg CLK;
	reg RESET;
	
	GNRL_delayed_pulser
	#(
		.DELAY_WIDTH (32)
	)
	uut
	(
		// signals
		.SIG_IN (SIG_IN),
		.SIG_OUT (SIG_OUT),
		
		// parameters
		.DELAY (DELAY),
		
		// system
		.CLK (CLK),
		.RESET (RESET)
		
	);
	
	initial begin
		CLK = 1'b1;
		RESET = 1'b0;
		
		SIG_IN = 1'b0;
		DELAY = 32'd10;
		
		#(clockticks*2) RESET = 1'b1;
		#(clockticks*2) RESET = 1'b0;
		
		#(clockticks*2) SIG_IN = 1'b1;
		#(clockticks*100) SIG_IN = 1'b0;
		
		#(clockticks*3) SIG_IN = 1'b1;
		#(clockticks*2) SIG_IN = 1'b0;
		
	end
	
	always begin
		#clockticks CLK = ~CLK;
	end

endmodule