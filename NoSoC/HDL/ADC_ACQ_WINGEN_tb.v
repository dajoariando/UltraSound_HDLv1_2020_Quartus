module ADC_ACQ_WINGEN_tb;
	
	// parameters are referenced in MHz for calculation
	parameter timescale_ref = 1000000; // reference scale based on timescale => 1ps => 1THz => 1000000 MHz
	parameter CLK_RATE_HZ = 4.3; // in MHz
	localparam integer clockticks = (timescale_ref / CLK_RATE_HZ) / 2.0;
	
	localparam SAMPLES_PER_ECHO_WIDTH = 32;
	localparam ADC_INIT_DELAY_WIDTH = 32;
	
	// parameters
	reg [ADC_INIT_DELAY_WIDTH-1:0] ADC_INIT_DELAY;
	reg [SAMPLES_PER_ECHO_WIDTH-1:0] SAMPLES_PER_ECHO;

	// control signal
	reg ACQ_WND;
	wire ACQ_EN;
	wire DONE;

	// system signal
	reg CLK;
	reg RESET;

	ADC_ACQ_WINGEN
	# (
		.SAMPLES_PER_ECHO_WIDTH (SAMPLES_PER_ECHO_WIDTH),
		.ADC_INIT_DELAY_WIDTH (ADC_INIT_DELAY_WIDTH) 
	)
	ADC_ACQ_WINGEN1
	(

		// parameters
		.ADC_INIT_DELAY (ADC_INIT_DELAY),
		.SAMPLES_PER_ECHO (SAMPLES_PER_ECHO),
		
		// control signal
		.ACQ_WND (ACQ_WND),
		.ACQ_EN (ACQ_EN),
		.DONE (DONE),
		
		// system signal
		.CLK (CLK),
		.RESET (RESET)
	);
	
	always begin
		#clockticks CLK = ~CLK;
	end
	
	initial begin
		ADC_INIT_DELAY = 2;
		SAMPLES_PER_ECHO = 10;
		CLK = 1'b1;
		ACQ_WND = 1'b0;
		
		#(clockticks*10) RESET = 1'b1;
		#(clockticks*10) RESET = 1'b0;
		
		#(clockticks*10) ACQ_WND = 1'b1;
		#(clockticks*100) ACQ_WND = 1'b0;
		
		#(clockticks*10) ACQ_WND = 1'b1;
		#(clockticks*100) ACQ_WND = 1'b0;
		

	end
	
endmodule