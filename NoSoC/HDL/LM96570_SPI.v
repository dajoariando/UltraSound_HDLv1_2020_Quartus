`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: David Ariando
// 
// Create Date:    18:01:00 08/11/2017 
// Project Name:   EECS397/600 Instrumentation and Measurement
// Design Name:    NMR Spectrometer
// Module Name:    SPI_LTC2314
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v17.0
// Description:    SPI Bus Transceiver
//
// This ADC has latency of 2 cycles when the start signal is given until CS is driven low
//                 
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module LM96570_SPI
#(
	parameter DATA_WIDTH = 70,
	parameter BIT_COUNT_WIDTH = 8 // to accomodate shifting 70 bits of data
)
(
	// Control Signals
	input									START,			// start signal
	output reg								DONE,			// acquisition done
	
	// Data Signals
	output reg [(DATA_WIDTH-1):0] 			RD_DATA,		// data wires
	
	// SPI output signals
	input [BIT_COUNT_WIDTH-1:0] 			NUM_OF_BIT,		// number of bits being shifted
	input [DATA_WIDTH-1:0]					DATA_IN,
	
	// SPI Bus Signals
	output reg 	SPI_CS_N,
	output reg 	SPI_SCK,
	input      	SPI_SDI,
	output reg	SPI_SDO,
	
	// System Signals
	input CLK,
	input RESET
);

	// Include StdFunctions for bit_index()
	// `include "StdFunctions.vh"

	// localparam BIT_COUNT_WIDTH = bit_index(DATA_WIDTH);
	
	//
	// The SPI Bus Rate is half of the system clock input (CLK)
	//
	
	//
	// SPI Transceiver State Machine
	//
	reg [8:0] State;
	localparam [8:0]
		S0 = 9'b000000001,
		S1 = 9'b000000010,
		S2 = 9'b000000100,
		S3 = 9'b000001000,
		S4 = 9'b000010000,
		S5 = 9'b000100000,
		S6 = 9'b001000000,
		S7 = 9'b010000000,
		S8 = 9'b100000000;
	
	
	reg	[(DATA_WIDTH-1):0]			shift_reg_rx, shift_reg_tx;
	
	reg	[BIT_COUNT_WIDTH-1:0]			bit_count;		// count shifted bit
		
		
		
	initial
	begin
		bit_count	<= {BIT_COUNT_WIDTH{1'b0}};
		RD_DATA		<= {DATA_WIDTH{1'b0}};
	end
	
	always @(posedge CLK, posedge RESET)
	begin
	
		if (RESET)
		begin
		
			shift_reg_rx <= {DATA_WIDTH{1'b0}};
		
			SPI_CS_N <= 1'b1;
			SPI_SCK <= 1'b0;
			
			
			DONE <= 1'b0;
									
			State <= S0;
			
		end
		else
		begin
		
			case (State)
			
				S0 :
				begin

					// Reset the sample count
					
					// reset the bit count
					bit_count <= {1'b1, { (BIT_COUNT_WIDTH-1) {1'b0} }} - NUM_OF_BIT;
										
					// Wait for the Start signal
					if (START)
						State <= S1;
				
				end
				
				S1 :
				begin
					
					// Initialize the shift register
					shift_reg_rx <= { (DATA_WIDTH) {1'b0} };
					shift_reg_tx <= DATA_IN;
					
					// Clear the Done signal
					DONE <= 1'b0;
					
					// Assert Chip Select
					SPI_CS_N <= 1'b0;
					
					// Reset the bit count
					bit_count <= {1'b1, { (BIT_COUNT_WIDTH-1) {1'b0} }} - NUM_OF_BIT;
					
					State <= S2;
								
				end
				
				S2 :
				begin
				
					SPI_SDO <= shift_reg_tx[0];
					shift_reg_tx <= {1'b0, {shift_reg_tx[DATA_WIDTH-1:1]} };
					
					// SCK Falling-Edge
					SPI_SCK <= 1'b0;
					
					// increment bit counter
					bit_count <= bit_count + 1'b1;
					
					State <= S3;
					
				end
				
				S3 :
				begin
					
					// shift data in
					shift_reg_rx <= { SPI_SDI, shift_reg_rx [DATA_WIDTH-1:1] };
					
					// SCK Rising-Edge
					SPI_SCK <= 1'b1;

					if (bit_count[BIT_COUNT_WIDTH-1])
					begin
						
						State <= S4;
					
					end
					
					else
						State <= S2;
					
				end
				
				S4 :
				begin
					
					SPI_SCK <= 1'b0;
										
					State <= S5;
					
				end
				
				S5 :
				begin
					
					// Deassert Chip Select
					SPI_CS_N <= 1'b1;
					
					State <= S6;
					
				end
				
				S6 :
				begin
					
					// Reset the bit count
					bit_count <= {1'b1, { (BIT_COUNT_WIDTH-1) {1'b0} }} - (DATA_WIDTH-NUM_OF_BIT-1);
					
					State <= S7;
					
				end
				
				S7 :
				begin
					
					bit_count <= bit_count + 1'b1;
					shift_reg_rx <= { 1'b0, shift_reg_rx [DATA_WIDTH-1:1] };
					
					if (bit_count[BIT_COUNT_WIDTH-1])
					begin
					
						State <= S8;
					
					end
					
					else 
					begin
						State <= S7;
					end
				end
				
				S8 :
				begin
					
					RD_DATA <= shift_reg_rx;
					
					// Assert Done signal
					DONE <= 1'b1;
					
					State <= S0;
					
				end
				
			endcase
		
		end
	
	end
	
endmodule
