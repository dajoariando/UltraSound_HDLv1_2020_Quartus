`timescale  1 ns / 1 ps
module ADC_AD9276 (
	rst, wren,
	dco_p, dco_n, fco_p, fco_n, 
	dina_p, dina_n, dinb_p, dinb_n,  
	dinc_p, dinc_n, dind_p, dind_n,  
	dine_p, dine_n, dinf_p, dinf_n,  
	ding_p, ding_n, dinh_p, dinh_n,
	doutA, doutB, doutC, doutD, doutE, doutF, doutG, doutH,
	clkout, load, dco_locked, fco_locked
);

	input rst, wren; 
	input dco_p, dco_n;
	input fco_p, fco_n;
	input dina_p, dina_n;
	input dinb_p, dinb_n;
	input dinc_p, dinc_n;
	input dind_p, dind_n;
	input dine_p, dine_n;
	input dinf_p, dinf_n;
	input ding_p, ding_n;
	input dinh_p, dinh_n;
         
	output [13:0] doutA; //Setting Up for 16-bit words
	output [13:0] doutB; 
	output [13:0] doutC; 
	output [13:0] doutD; 
	output [13:0] doutE; 
	output [13:0] doutF; 
	output [13:0] doutG; 
	output [13:0] doutH;
	output clkout, load; 
	output dco_locked;
	output fco_locked;

	reg load, gate;
	reg [6:0] dat_q1_a, dat_q2_a; //Setting Up for 12-bit words
	reg [6:0] dat_q1_b, dat_q2_b;
	reg [6:0] dat_q1_c, dat_q2_c;
	reg [6:0] dat_q1_d, dat_q2_d;
	reg [6:0] dat_q1_e, dat_q2_e;
	reg [6:0] dat_q1_f, dat_q2_f;
	reg [6:0] dat_q1_g, dat_q2_g;
	reg [6:0] dat_q1_h, dat_q2_h;

	reg [13:0] doutA;
	reg [13:0] doutB;
	reg [13:0] doutC;
	reg [13:0] doutD;
	reg [13:0] doutE;
	reg [13:0] doutF;
	reg [13:0] doutG;
	reg [13:0] doutH;

	reg [13:0] dout_a, dout_b;
	reg [13:0] dout_c, dout_d;
	reg [13:0] dout_e, dout_f;
	reg [13:0] dout_g, dout_h;
	
	reg q2_a_dly;
	reg q2_b_dly;
	reg q2_c_dly;
	reg q2_d_dly;
	reg q2_e_dly;
	reg q2_f_dly;
	reg q2_g_dly;
	reg q2_h_dly;

	reg [15:0] count;       
	reg fco1,fco2;
	reg fcostb;
	
	wire fco;
	wire dco;

	//Altera Implementations of above buffers, Check this again...
	alt_inbuf_diff IB1 (.i(dco_p), .ibar(dco_n), .o(dco_in));
	alt_inbuf_diff IB2 (.i(fco_p), .ibar(fco_n), .o(fco_in));

	alt_inbuf_diff IB3 (.i(dina_p), .ibar(dina_n), .o(din_a));
	alt_inbuf_diff IB4 (.i(dinb_p), .ibar(dinb_n), .o(din_b));
	alt_inbuf_diff IB5 (.i(dinc_p), .ibar(dinc_n), .o(din_c));
	alt_inbuf_diff IB6 (.i(dind_p), .ibar(dind_n), .o(din_d));
	alt_inbuf_diff IB7 (.i(dine_p), .ibar(dine_n), .o(din_e));
	alt_inbuf_diff IB8 (.i(dinf_p), .ibar(dinf_n), .o(din_f));
	alt_inbuf_diff IB9 (.i(ding_p), .ibar(ding_n), .o(din_g));
	alt_inbuf_diff IB10 (.i(dinh_p), .ibar(dinh_n), .o(din_h));
						 
	/* Altera Implementation of DCO Clk (Previous MegaFunctions: Alt_PLL)
	pll_adc_datain pll_adc_datain1 (
		.refclk		(dco_in),      
		.locked		(dco_locked),
		.rst		(rst), 
		.outclk_0	(dco)
	);
	*/
	assign dco = dco_in; // bypass the PLL
	
	/*
	dcm2 DCM2 (
		.refclk		(fco_in),      
		.locked		(fco_locked),
		.rst		(rst), 
		.outclk_0	(fco)
	);
	*/
	assign fco = fco_in;

	//Altera Implementation of DDR Inputs...
	IDDR1 I1 (
		.datain		(din_a),
		.inclock	(dco), 
		.dataout_l	(q1_a),
		.dataout_h	(q2_a),
		.inclocken	(1'b1),
		.aset		(1'b0)
	);

	IDDR1 I2 (
		.datain		(din_b),
		.inclock	(dco), 
		.dataout_l	(q1_b),
		.dataout_h	(q2_b),
		.inclocken	(1'b1),
		.aset		(1'b0)
	);

	IDDR1 I3 (
		.datain		(din_c),
		.inclock	(dco), 
		.dataout_l	(q1_c),
		.dataout_h	(q2_c),
		.inclocken	(1'b1),
		.aset		(1'b0)
	);

	IDDR1 I4 (
		.datain		(din_d),
		.inclock	(dco), 
		.dataout_l	(q1_d),
		.dataout_h	(q2_d),
		.inclocken	(1'b1),
		.aset		(1'b0));
				
	IDDR1 I5 (
		.datain		(din_e),
		.inclock	(dco), 
		.dataout_l	(q1_e),
		.dataout_h	(q2_e),
		.inclocken	(1'b1),
		.aset		(1'b0)
	);

	IDDR1 I6 (
		.datain		(din_f),
		.inclock	(dco), 
		.dataout_l	(q1_f),
		.dataout_h	(q2_f),
		.inclocken	(1'b1),
		.aset		(1'b0)
	);

	IDDR1 I7 (
		.datain		(din_g),
		.inclock	(dco), 
		.dataout_l	(q1_g),
		.dataout_h	(q2_g),
		.inclocken	(1'b1),
		.aset		(1'b0)
	);

	IDDR1 I8 (
		.datain		(din_h),
		.inclock	(dco), 
		.dataout_l	(q1_h),
		.dataout_h	(q2_h),
		.inclocken	(1'b1),
		.aset		(1'b0)
	);
	
	// the altera IDDR megafunction starts with falling-edge first and then rising-edge
	// in the other hand, the AD9276 starts with rising-edge and then falling-edge
	// therefore we need to make dataout_h delayed by 1 cycle and capture the signal late by 1 cycle
	always @(posedge dco)
		begin
			q2_a_dly <= q2_a;
			q2_b_dly <= q2_b;
			q2_c_dly <= q2_c;
			q2_d_dly <= q2_d;
			q2_e_dly <= q2_e;
			q2_f_dly <= q2_f;
			q2_g_dly <= q2_g;
			q2_h_dly <= q2_h;
		end
	
	
	always @(posedge dco)
		begin
			dat_q1_a[6:0] <= {dat_q1_a[5:0], q1_a}; 
			dat_q2_a[6:0] <= {dat_q2_a[5:0], q2_a_dly}; 
			dat_q1_b[6:0] <= {dat_q1_b[5:0], q1_b}; 
			dat_q2_b[6:0] <= {dat_q2_b[5:0], q2_b_dly}; 
			dat_q1_c[6:0] <= {dat_q1_c[5:0], q1_c}; 
			dat_q2_c[6:0] <= {dat_q2_c[5:0], q2_c_dly}; 
			dat_q1_d[6:0] <= {dat_q1_d[5:0], q1_d}; 
			dat_q2_d[6:0] <= {dat_q2_d[5:0], q2_d_dly}; 
			dat_q1_e[6:0] <= {dat_q1_e[5:0], q1_e}; 
			dat_q2_e[6:0] <= {dat_q2_e[5:0], q2_e_dly}; 
			dat_q1_f[6:0] <= {dat_q1_f[5:0], q1_f}; 
			dat_q2_f[6:0] <= {dat_q2_f[5:0], q2_f_dly}; 
			dat_q1_g[6:0] <= {dat_q1_g[5:0], q1_g}; 
			dat_q2_g[6:0] <= {dat_q2_g[5:0], q2_g_dly}; 
			dat_q1_h[6:0] <= {dat_q1_h[5:0], q1_h}; 
			dat_q2_h[6:0] <= {dat_q2_h[5:0], q2_h_dly};
		end
	//start new fco stuff

	//generate new FCO
	always @ (posedge dco)
		begin
			fco1 <= fco;
			fco2 <= fco1;
			fcostb <= fco1 & ~fco2;
		end
		
	always @(posedge dco)
		if (fcostb)
			begin
				dout_a <=  {
					dat_q2_a[6],dat_q1_a[6], 
					dat_q2_a[5],dat_q1_a[5], 
					dat_q2_a[4],dat_q1_a[4], 
					dat_q2_a[3],dat_q1_a[3], 
					dat_q2_a[2],dat_q1_a[2], 
					dat_q2_a[1],dat_q1_a[1], 
					dat_q2_a[0],dat_q1_a[0]
				};
			end

	always @(posedge dco)
		if (fcostb)
			begin
				dout_b <= {
					dat_q2_b[6], dat_q1_b[6],
					dat_q2_b[5], dat_q1_b[5],
					dat_q2_b[4], dat_q1_b[4],
					dat_q2_b[3], dat_q1_b[3],
					dat_q2_b[2], dat_q1_b[2],
					dat_q2_b[1], dat_q1_b[1],
					dat_q2_b[0], dat_q1_b[0]
				};
			end
			
	always @(posedge dco)
		if (fcostb)
			begin
				dout_c <= {
					dat_q2_c[6], dat_q1_c[6],
					dat_q2_c[5], dat_q1_c[5],
					dat_q2_c[4], dat_q1_c[4],
					dat_q2_c[3], dat_q1_c[3],
					dat_q2_c[2], dat_q1_c[2],
					dat_q2_c[1], dat_q1_c[1],
					dat_q2_c[0], dat_q1_c[0]
				};
			end
		
	always @(posedge dco)
		if (fcostb)
			begin
				dout_d <= {
					dat_q2_d[6], dat_q1_d[6],
					dat_q2_d[5], dat_q1_d[5],
					dat_q2_d[4], dat_q1_d[4],
					dat_q2_d[3], dat_q1_d[3],
					dat_q2_d[2], dat_q1_d[2],
					dat_q2_d[1], dat_q1_d[1],
					dat_q2_d[0], dat_q1_d[0]
				};
			end
			
	always @(posedge dco)
		if (fcostb)
			begin
				dout_e <= {
					dat_q2_e[6], dat_q1_e[6],
					dat_q2_e[5], dat_q1_e[5],
					dat_q2_e[4], dat_q1_e[4],
					dat_q2_e[3], dat_q1_e[3],
					dat_q2_e[2], dat_q1_e[2],
					dat_q2_e[1], dat_q1_e[1],
					dat_q2_e[0], dat_q1_e[0]
				};
			end
			
	always @(posedge dco)
		if (fcostb)
			begin
				dout_f <= {
					dat_q2_f[6], dat_q1_f[6],
					dat_q2_f[5], dat_q1_f[5],
					dat_q2_f[4], dat_q1_f[4],
					dat_q2_f[3], dat_q1_f[3],
					dat_q2_f[2], dat_q1_f[2],
					dat_q2_f[1], dat_q1_f[1],
					dat_q2_f[0], dat_q1_f[0]
				};
			end
	
	always @(posedge dco)
		if (fcostb)
			begin
				dout_g <= {
					dat_q2_g[6], dat_q1_g[6],
					dat_q2_g[5], dat_q1_g[5],
					dat_q2_g[4], dat_q1_g[4],
					dat_q2_g[3], dat_q1_g[3],
					dat_q2_g[2], dat_q1_g[2],
					dat_q2_g[1], dat_q1_g[1],
					dat_q2_g[0], dat_q1_g[0]
				};
			end
			
	always @(posedge dco)
		if (fcostb)
			begin
				dout_h <= {
					dat_q2_h[6], dat_q1_h[6],
					dat_q2_h[5], dat_q1_h[5],
					dat_q2_h[4], dat_q1_h[4],
					dat_q2_h[3], dat_q1_h[3],
					dat_q2_h[2], dat_q1_h[2],
					dat_q2_h[1], dat_q1_h[1],
					dat_q2_h[0], dat_q1_h[0]
				};
			end

			
	always @(posedge dco)
		if (fcostb)
			begin
				doutA <= dout_a;
				doutB <= dout_b;
				doutC <= dout_c;
				doutD <= dout_d;
				doutE <= dout_e;
				doutF <= dout_f;
				doutG <= dout_g;
				doutH <= dout_h;
			end
			


	assign clkout = fco;

	always @(posedge dco)
	begin
		if (rst)
			begin
				count <= 1'b0;
				gate <= 1'b0;
			end
		else if (fcostb)
			begin
				count <= count + 16'b1;
				if (&count)
					gate <= 1;
			end
	end
	always @(posedge dco)
		 
		if (gate & fcostb)
			begin
				load <= wren;
			end

endmodule