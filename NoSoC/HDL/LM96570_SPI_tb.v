`timescale 1ps / 1ps

module LM96570_SPI_tb;
	
	parameter timescale_ref = 1000000; // reference scale based on timescale
	parameter CLK_RATE_HZ = 175; // in MHz
	parameter DATA_WIDTH = 70;
	parameter BIT_COUNT_WIDTH = 8; // to accomodate shifting 70 bits of data
	
	reg START;
	wire DONE;
	
	wire [DATA_WIDTH-1:0] RD_DATA;
	
	wire SPI_CS_N;
	wire SPI_SCK;
	reg SPI_SDI;
	wire SPI_SDO;
	                               
	reg BASE_CLK;                  
	reg RESET;

	reg [BIT_COUNT_WIDTH-1:0] 			NUM_OF_BIT;		// number of bits being shifted
	reg [DATA_WIDTH-1:0]				DATA_IN;
	                               
                 
	
	LM96570_SPI 
	#(
		.DATA_WIDTH			(DATA_WIDTH),
		.BIT_COUNT_WIDTH	(BIT_COUNT_WIDTH)
	)
	SPI_01  
	(
		// Control Signals
		.START				(START),
		.DONE				(DONE),
		
		// Data Signals
		.RD_DATA			(RD_DATA),
		
		// SPI output signals
		.NUM_OF_BIT			(NUM_OF_BIT),		// number of bits being shifted
		.DATA_IN			(DATA_IN),
		
		// SPI Bus Signals
		.SPI_CS_N			(SPI_CS_N),
		.SPI_SCK			(SPI_SCK),
		.SPI_SDI			(SPI_SDI),
		.SPI_SDO			(SPI_SDO),
		
		// System Signals
		.CLK				(BASE_CLK),
		.RESET				(RESET)
	);
	
	localparam integer clockticks = (timescale_ref / CLK_RATE_HZ) / 2.0;
	
	initial begin
		START = 1'b0;
		BASE_CLK = 1'b1;
		SPI_SDI = 1'b1;
		RESET = 1'b0;
		DATA_IN = 'h1A;
		NUM_OF_BIT = 5;
		#(clockticks*2) RESET = 1'b1;
		#(clockticks*2) RESET = 1'b0;
		#(clockticks*2) START = 1'b1;
		#(clockticks*2) START = 1'b0; 
	end
	
	always begin
		#clockticks BASE_CLK = ~BASE_CLK;
	end

endmodule