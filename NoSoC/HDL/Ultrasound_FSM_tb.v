`timescale 1ps / 1ps

module Ultrasound_FSM_tb;
	
	parameter ADC_SAMPLES_PER_ECHO_WIDTH = 32;
	parameter ADC_INIT_DELAY_WIDTH = 32;
	
	parameter timescale_ref = 1000000; // reference scale based on timescale
	parameter CLK_RATE_HZ = 30; // in MHz
	localparam integer clockticks = (timescale_ref / CLK_RATE_HZ) / 2.0;
	
	reg START;
	wire DONE;

	wire TX_EN;
	
	// timing parameters
	reg [31:0] ADC_START_length;

	// ACQ WINDOW
	reg [ADC_INIT_DELAY_WIDTH-1:0] 			ADC_INIT_DELAY;
	reg [ADC_SAMPLES_PER_ECHO_WIDTH-1:0]	ADC_SAMPLES_PER_ECHO;
	wire 									FIFO_EN;
	
	reg CLK;                  
	reg RESET;

	Ultrasound_FSM DUT
	#(
		.ADC_SAMPLES_PER_ECHO_WIDTH (ADC_SAMPLES_PER_ECHO_WIDTH),
		.ADC_INIT_DELAY_WIDTH (ADC_INIT_DELAY_WIDTH)
	)
	(
		// Control Signals
		.START		(START	),  	//Starting of TX Firing and Data Acquisiton
		.DONE		(DONE	),		//Notification of Completed Data Acquistion
		.TX_EN		(TX_EN	),    	//TX_EN Signal
		
		// timing parameters
		.ADC_START_length	(ADC_START_length),
		
		// ACQ WINDOW
		.ADC_INIT_DELAY			(ADC_INIT_DELAY),
		.ADC_SAMPLES_PER_ECHO	(ADC_SAMPLES_PER_ECHO),
		.FIFO_EN				(FIFO_EN),
		
		// System Signals
		.CLK	(CLK),
		.RESET	(RESET)
	);
	
	
	initial begin
		START = 1'b0;
		CLK	= 1'b0;
		RESET = 1'b0;
		ADC_START_length = 5;
		ADC_INIT_DELAY = 10;
		ADC_SAMPLES_PER_ECHO = 10;
		#(clockticks*2) RESET = 1'b1;
		#(clockticks*2) RESET = 1'b0;
		#(clockticks*2) START = 1'b1;
		#(clockticks*50) START = 1'b0; 
	end
	
	always begin
		#clockticks CLK = ~CLK;
	end

endmodule