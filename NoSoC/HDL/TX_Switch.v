
module TX_Switch
#(
	parameter REG_WIDTH = 8
)
(
//-----------------Input Ports-----------------
input CLK			, //ClockSignal
input RESET			, //Active high,syn reset
input START			, //Start Process

input [REG_WIDTH-1:0] init_delay, // the initial delay from start to pulse
input [REG_WIDTH-1:0] tx_len, // the length of the transmit signal
input [REG_WIDTH-1:0] damp_len, // the length of the transmit signal

//-----------------Output Ports----------------


// Pulsing signals @ pulse freq
output   [7:0] TXP,
output  	[7:0] TXN
 
);
reg [REG_WIDTH-1:0]	init_delay_cnt;
reg [REG_WIDTH-1:0]	tx_len_cnt;
reg [REG_WIDTH-1:0] damp_len_cnt;

reg 		TX_EN;
reg			DAMP;

reg [4:0] State;
localparam [4:0]
	S0 = 5'b00001,
	S1 = 5'b00010,
	S2 = 5'b00100,
	S3 = 5'b01000,
	S4 = 5'b10000;
	
//
//State Machine Process
//
always @(posedge CLK, posedge RESET)
begin
	
	if  (RESET)
	begin
		//Reset Register Assignments
		init_delay_cnt <= 6'b000000;
		tx_len_cnt <= 4'b0000;
		TX_EN <= 1'b0;
		DAMP <= 1'b0;
						
		//Reset State Variable
		State <=S0;
	end
	
	else
	begin
	
		//State Machine operations (actions and transitions)
		case(State)
		
			S0: //State 0
				begin
					TX_EN <= 1'b0;
					DAMP <= 1'b0;
					
					init_delay_cnt <= {1'b1,{ (REG_WIDTH-1){1'b0} }} - init_delay + 2;
					tx_len_cnt <= {1'b1,{ (REG_WIDTH-1){1'b0} }} - tx_len + 1;
					damp_len_cnt <= {1'b1,{ (REG_WIDTH-1){1'b0} }} - damp_len + 1;
					
					//waiting for START to go high
					if (START)
						State <= S1;
				end
				
			S1:	//State 1
				begin
					init_delay_cnt <= init_delay_cnt + 1'b1;
					
					if (init_delay_cnt[REG_WIDTH-1])
						State <= S2;
				end
			
			S2: 	//State 2
				begin
					TX_EN = 1'b1;
					tx_len_cnt <= tx_len_cnt + 1'b1;
					
					if (tx_len_cnt[REG_WIDTH-1])
						State <= S3;
				end	
				
			S3:  //State 3
				begin
					TX_EN = 1'b0;
					DAMP = 1'b1;
					
					damp_len_cnt <= damp_len_cnt + 1'b1;
					
					if (damp_len_cnt[REG_WIDTH-1])
						State <= S0;
				end	
				
		endcase
	end
end

wire [7:0] TXPi;
wire [7:0] TXNi;

assign TXPi[0] = TX_EN ? CLK : 1'b0;
assign TXPi[1] = TX_EN ? CLK : 1'b0;
assign TXPi[2] = TX_EN ? CLK : 1'b0;
assign TXPi[3] = TX_EN ? CLK : 1'b0;
assign TXPi[4] = TX_EN ? CLK : 1'b0;
assign TXPi[5] = TX_EN ? CLK : 1'b0;
assign TXPi[6] = TX_EN ? CLK : 1'b0;
assign TXPi[7] = TX_EN ? CLK : 1'b0;

assign TXNi[0] = TX_EN ? ~CLK : 1'b0;
assign TXNi[1] = TX_EN ? ~CLK : 1'b0;
assign TXNi[2] = TX_EN ? ~CLK : 1'b0;
assign TXNi[3] = TX_EN ? ~CLK : 1'b0;
assign TXNi[4] = TX_EN ? ~CLK : 1'b0;
assign TXNi[5] = TX_EN ? ~CLK : 1'b0;
assign TXNi[6] = TX_EN ? ~CLK : 1'b0;
assign TXNi[7] = TX_EN ? ~CLK : 1'b0;

assign TXN = DAMP ? 8'hFF : TXNi;
assign TXP = DAMP ? 8'hFF : TXPi;
		
		
endmodule 