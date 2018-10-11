`timescale 1ns / 1ps
module ADC_AD9276_tb;

reg _wen;	             // active-low FIFO write enable
reg	_rst;                 // active-low master reset       
reg dco_p, dco_n;        // clk inputs 
reg fco_p, fco_n;         
reg	dina_p, dina_n;      // data inputs
reg	dinb_p, dinb_n;
reg	dinc_p, dinc_n;
reg	dind_p, dind_n;
reg	dine_p, dine_n;      // data inputs
reg	dinf_p, dinf_n;
reg	ding_p, ding_n;
reg	dinh_p, dinh_n;

wire [13:0] doutA;
wire [13:0] doutB;
wire [13:0] doutC;
wire [13:0] doutD;
wire [13:0] doutE;
wire [13:0] doutF;
wire [13:0] doutG;
wire [13:0] doutH;

wire dco_locked;
wire fco_locked;
wire load;

ADC_AD9276 C1 (
	_rst, _wen,
	dco_p, dco_n,
	fco_p, fco_n,
	dina_p, dina_n,
	dinb_p, dinb_n,
	dinc_p, dinc_n,
	dind_p, dind_n,  
	dine_p, dine_n,
	dinf_p, dinf_n,
	ding_p, ding_n,
	dinh_p, dinh_n,
	doutA, doutB, doutC, doutD, doutE, doutF, doutG, doutH,
	clkout,
	load,
	dco_locked,
	fco_locked
);

localparam DCO_RATE_HZ = 240000000;
localparam DCO_HALF_PER = ((1.0 / DCO_RATE_HZ) * 1000000000.0) / 2.0;

initial begin
	#(DCO_HALF_PER) _rst = 1;
	#(20*DCO_HALF_PER) _rst = 0;
end

initial begin
	dco_p = 1'b0; dco_n = 1'b1;
	forever #(DCO_HALF_PER) begin
		dco_p = ~dco_p;
		dco_n = ~dco_n;
	end
end

initial begin
	fco_p = 1'b0; fco_n = 1'b1;
	#(DCO_HALF_PER/2);
	forever #(6*DCO_HALF_PER) begin
		fco_p = ~fco_p; fco_n = ~fco_n;
	end
end
	
initial begin
	dinb_p = 0; 
	dinb_n = 1;
	dinc_p = 0;
	dinc_n = 1;
	dind_p = 0;
	dind_n = 1;
	dine_p = 0; 
	dine_n = 1;
	dinf_p = 0;
	dinf_n = 1;
	ding_p = 0;
	ding_n = 1;
	dinh_p = 0;
	dinh_n = 1;
end
	
initial begin
	#(2*DCO_HALF_PER)
	#(DCO_HALF_PER/2)
	dina_p = 0; dina_n = 1;
	
	
	#(DCO_HALF_PER*16)
	dina_p = ~dina_p; dina_n = ~dina_n;

	#(2*DCO_HALF_PER)
	dina_p = ~dina_p; dina_n = ~dina_n;
	
	#(20*DCO_HALF_PER)
	dina_p = ~dina_p; dina_n = ~dina_n;
	
	#(1*DCO_HALF_PER)
	dina_p = ~dina_p; dina_n = ~dina_n;
	
	#(DCO_HALF_PER*12)
	dina_p = ~dina_p; dina_n = ~dina_n;


	//Generating VCD File
	#2000

	$dumpfile ("TestBenchOut.vcd");
	$dumpvars (_rst, _wen, dco_p, dco_n, fco_p, fco_n, dina_p, dina_n, dinb_p, dinb_n, dinc_p, dinc_n, dind_p, dind_n,  
		   dine_p, dine_n, dinf_p, dinf_n, ding_p, ding_n, dinh_p, dinh_n, doutA, doutB, doutC, doutD, doutE, 
		   doutF, doutG, doutH, clkout, load, dco_locked, fco_locked);
	$dumpflush;	
	$finish;
	
end			


endmodule
