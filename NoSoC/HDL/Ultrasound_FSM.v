module Ultrasound_FSM
#(
	parameter ADC_SAMPLES_PER_ECHO_WIDTH = 32,
	parameter ADC_INIT_DELAY_WIDTH = 32
)
(
	// Control Signals
	input START,  			//Starting of TX Firing and Data Acquisiton
	output reg DONE,		//Notification of Completed Data Acquistion
	output reg TX_EN,    //TX_EN Signal
	
	// timing parameters
	input [31:0] ADC_START_length,
	
	// ACQ WINDOW
	input [ADC_INIT_DELAY_WIDTH-1:0] 		ADC_INIT_DELAY,
	input [ADC_SAMPLES_PER_ECHO_WIDTH-1:0]	ADC_SAMPLES_PER_ECHO,
	output 									FIFO_EN,
		
	// System Signals
	input CLK,
	input RESET
);
	//
	// State Machine Variable Definition
	//
	reg [8:0] State;
	localparam [8:0]
	S0 = 8'b000000001,  	//State Machine Initialization
	S1 = 8'b000000010,  	//State Machine Counter Zeroing
	S2 = 8'b000000100,		//State Machine TX_EN & RX_EN High
	S3 = 8'b000001000,  	//State Machine TX_EN & RX_EN Low
	S4 = 8'b000010000,
	S5 = 8'b000100000,
	S6 = 8'b001000000,
	S7 = 8'b010000000,
	S8 = 8'b100000000;
	
	reg [31:0] counter;
	reg ADC_START;
	wire ACQ_DONE;

	
always @(posedge CLK, posedge RESET)
	begin
		if (RESET)
			begin
			// Reset Register Assignments
			DONE <= 1'b0;
			ADC_START <= 1'b0;
			// Reset State Variable
			State <= S0;
		end
		else
			begin
			// State Machine Operations (Actions / Transitions)
			case (State)
			
				S0 : // State 0
				begin
					// Clear the Done status
					DONE <= 1'b1;
					TX_EN <= 1'b0;
					ADC_START <= 1'b0;
					
					// Wait for Start
					if (START)
						State <= S1;
				end
				
				S1 : // State 1
				begin
					DONE <= 1'b0;
					ADC_START <= 1'b1;
					TX_EN <= 1'b1;
					counter <= {1'b1,31'h0} - ADC_START_length + 2'd2;
					
					State <= S2;
				end
				
				S2 : // reset the counter to count ADC_START length
				begin
					counter <= counter + 1'b1;
					
					if (counter[31])
						State <= S3;
					
				end
				
				S3 : // wait until ADC stops
				begin
					ADC_START <= 1'b0;
					
					if (ACQ_DONE)
						State <= S4;
				end
				
				S4 : // 
				begin
					TX_EN <= 1'b0;
					DONE <= 1'b1;
					State <= S0;
				end
				
				
				
			endcase
		end
	end
	
	ADC_ACQ_WINGEN
	# (
		.SAMPLES_PER_ECHO_WIDTH	(ADC_SAMPLES_PER_ECHO_WIDTH),
		.ADC_INIT_DELAY_WIDTH	(ADC_INIT_DELAY_WIDTH) 
	)
	ADC_ACQ_WINGEN1
	(

		// parameters
		.ADC_INIT_DELAY 	(ADC_INIT_DELAY-1'b1), // minus 1 factor because of the delay from the FSM to this module
		.SAMPLES_PER_ECHO 	(ADC_SAMPLES_PER_ECHO),
		
		// control signal
		.ACQ_WND 			(ADC_START),
		.ACQ_EN 			(FIFO_EN),
		.DONE				(ACQ_DONE),
		
		// system signal
		.CLK 				(CLK),
		.RESET 				(RESET)
	);
	
	
endmodule