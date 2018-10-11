
module system (
	ad9276_spi_external_MISO,
	ad9276_spi_external_MOSI,
	ad9276_spi_external_SCLK,
	ad9276_spi_external_SS_n,
	clk_clk,
	datain_probe,
	dataout_source,
	general_cnt_export,
	issp_cnt_source,
	lm96570_spi_in_0_export,
	lm96570_spi_in_1_export,
	lm96570_spi_in_2_export,
	lm96570_spi_num_of_bits_export,
	lm96570_spi_out_0_export,
	lm96570_spi_out_1_export,
	lm96570_spi_out_2_export,
	num_of_bits_source,
	pll_0_locked_export,
	pll_0_outclk0_clk,
	reset_reset_n);	

	input		ad9276_spi_external_MISO;
	output		ad9276_spi_external_MOSI;
	output		ad9276_spi_external_SCLK;
	output		ad9276_spi_external_SS_n;
	input		clk_clk;
	input	[69:0]	datain_probe;
	output	[69:0]	dataout_source;
	output	[31:0]	general_cnt_export;
	output	[9:0]	issp_cnt_source;
	output	[31:0]	lm96570_spi_in_0_export;
	output	[31:0]	lm96570_spi_in_1_export;
	output	[5:0]	lm96570_spi_in_2_export;
	output	[7:0]	lm96570_spi_num_of_bits_export;
	input	[31:0]	lm96570_spi_out_0_export;
	input	[31:0]	lm96570_spi_out_1_export;
	input	[5:0]	lm96570_spi_out_2_export;
	output	[7:0]	num_of_bits_source;
	output		pll_0_locked_export;
	output		pll_0_outclk0_clk;
	input		reset_reset_n;
endmodule
