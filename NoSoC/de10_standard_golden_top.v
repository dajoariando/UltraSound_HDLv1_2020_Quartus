//`define ENABLE_HPS
//`define ENABLE_HSMC

module DE10_Standard_golden_top (


      ///////// CLOCK /////////
      input              CLOCK2_50,
      input              CLOCK3_50,
      input              CLOCK4_50,
      input              CLOCK_50,

      ///////// KEY /////////
      input    [ 3: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LED /////////
      output   [ 9: 0]   LEDR,

      ///////// Seg7 /////////
      output   [ 6: 0]   HEX0,
      output   [ 6: 0]   HEX1,
      output   [ 6: 0]   HEX2,
      output   [ 6: 0]   HEX3,
      output   [ 6: 0]   HEX4,
      output   [ 6: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// Video-In /////////
      input              TD_CLK27,
      input              TD_HS,
      input              TD_VS,
      input    [ 7: 0]   TD_DATA,
      output             TD_RESET_N,

      ///////// VGA /////////
      output             VGA_CLK,
      output             VGA_HS,
      output             VGA_VS,
      output   [ 7: 0]   VGA_R,
      output   [ 7: 0]   VGA_G,
      output   [ 7: 0]   VGA_B,
      output             VGA_BLANK_N,
      output             VGA_SYNC_N,

      ///////// Audio /////////
      inout              AUD_BCLK,
      output             AUD_XCK,
      inout              AUD_ADCLRCK,
      input              AUD_ADCDAT,
      inout              AUD_DACLRCK,
      output             AUD_DACDAT,

      ///////// PS2 /////////
      inout              PS2_CLK,
      inout              PS2_CLK2,
      inout              PS2_DAT,
      inout              PS2_DAT2,

      ///////// ADC /////////
      output             ADC_SCLK,
      input              ADC_DOUT,
      output             ADC_DIN,
      output             ADC_CONVST,

      ///////// I2C for Audio and Video-In /////////
      output             FPGA_I2C_SCLK,
      inout              FPGA_I2C_SDAT,

      ///////// GPIO /////////
//    inout    [35: 0]   GPIO,

/*
`ifdef ENABLE_HSMC
      ///////// HSMC /////////
      input              HSMC_CLKIN_P1,
      input              HSMC_CLKIN_N1,
      input              HSMC_CLKIN_P2,
      input              HSMC_CLKIN_N2,
      output             HSMC_CLKOUT_P1,
      output             HSMC_CLKOUT_N1,
      output             HSMC_CLKOUT_P2,
      output             HSMC_CLKOUT_N2,
      inout    [16: 0]   HSMC_TX_D_P,
      inout    [16: 0]   HSMC_TX_D_N,
      inout    [16: 0]   HSMC_RX_D_P,
      inout    [16: 0]   HSMC_RX_D_N,
      input              HSMC_CLKIN0,
      output             HSMC_CLKOUT0,
      inout    [ 3: 0]   HSMC_D,
      output             HSMC_SCL,
      inout              HSMC_SDA,
`endif /*ENABLE_HSMC*/

/*
`ifdef ENABLE_HPS
      ///////// HPS /////////
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout       [3:0]  HPS_FLASH_DATA,
      output             HPS_FLASH_DCLK,
      output             HPS_FLASH_NCSO,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_I2C2_SCLK,
      inout              HPS_I2C2_SDAT,
      inout              HPS_I2C_CONTROL,
      inout              HPS_KEY,
      inout              HPS_LCM_BK,
      inout              HPS_LCM_D_C,
      inout              HPS_LCM_RST_N,
      output             HPS_LCM_SPIM_CLK,
      output             HPS_LCM_SPIM_MOSI,
      output             HPS_LCM_SPIM_SS,
		input 				 HPS_LCM_SPIM_MISO,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
`endif /*ENABLE_HPS*/

		///////// IR /////////
		output             IRDA_TXD,
		input              IRDA_RXD,
		
		
		//Altera Specific Inputs and Outputs for High Speed Ultrasound Capture
		input dco_p, 
		input dco_n,	// clk inputs 
		input fco_p, 
		input fco_n,         
		input dina_p,
		input dina_n,	// data inputs
		input dinb_p,
		input dinb_n,
		input dinc_p,
		input dinc_n,
		input dind_p,
		input dind_n,
		input dine_p,
		input dine_n,	// data inputs
		input dinf_p,
		input dinf_n,
		input ding_p, 
		input ding_n,
		input dinh_p, 
		input dinh_n,

		//input pins for SPI Programming of the Receiver
		output CSB4,
		output CSB3,
		output CSB2,
		output CSB1,
		input SDO,	// input to the ADC
		output SDI, // output from the ADC
		output SCLK,
		output AD9516_in,
		output r_RESET,

				
		// spi for LM96570
		input SPI_SDI,
		output SPI_SDO,
		output SPI_SCK,
		output SPI_CS_N,
		
		// control signals
		output TX_EN,
		output PULSER_EN,
		output BF_RESET,
		output TX_PATH_EN
);


//=======================================================
//  REG/WIRE declarations
//=======================================================


wire data_clk;
wire [11:0] captured_dataA;
wire [11:0] captured_dataB;
wire [11:0] captured_dataC;
wire [11:0] captured_dataD;
wire [11:0] captured_dataE;
wire [11:0] captured_dataF;
wire [11:0] captured_dataG;
wire [11:0] captured_dataH;

wire dco_locked;
wire fco_locked;
wire load;

//=======================================================
//  Structural coding
//=======================================================

// capture data block
ADC_AD9276 U1 (
	.rst(), .wren(),				
	.dco_p(dco_p), .dco_n(dco_n), 
	.fco_p(fco_p), .fco_n(fco_n), 
	.dina_p(dina_p), .dina_n(dina_n),  
	.dinb_p(dinb_p), .dinb_n(dinb_n),  
	.dinc_p(dinc_p), .dinc_n(dinc_n),  
	.dind_p(dind_p), .dind_n(dind_n),
	.dine_p(dine_p), .dine_n(dine_n),  
	.dinf_p(dinf_p), .dinf_n(dinf_n),  
	.ding_p(ding_p), .ding_n(ding_n),  
	.dinh_p(dinh_p), .dinh_n(dinh_n),				
	.doutA(captured_dataA),
	.doutB(captured_dataB),
	.doutC(captured_dataC),
	.doutD(captured_dataD),
	.doutE(captured_dataE),
	.doutF(captured_dataF),
	.doutG(captured_dataG),
	.doutH(captured_dataH),
	.clkout(data_clk), 
	.load(load),
	.dco_locked(dco_locked),
	.fco_locked(fco_locked)
);

parameter DATA_WIDTH = 70;
parameter BIT_COUNT_WIDTH = 8; // to accomodate shifting 70 bits of data

wire [DATA_WIDTH-1:0] DATA_IN;
//wire [31:0] datain0, datain1;
//wire [5:0] datain2;
//wire [31:0] dataout0, dataout1;
//wire [5:0] dataout2;
wire [BIT_COUNT_WIDTH-1:0] NUM_OF_BIT;
wire [DATA_WIDTH-1:0] RD_DATA;
wire PLLOUT;
wire [9:0] ISSP_CNT;

// control signals from HPC
wire lm96570_start;
wire lm96570_spi_reset;
wire lm96570_tx_en;
wire lm96570_pin_reset;
wire pulser_en;
wire tx_path_en;


system u0 (
	.clk_clk            (CLOCK_50),    //         clk.clk
	.reset_reset_n      (~SW[0]),      //       reset.reset_n
	
	.pll_0_locked_export (LEDR[0]), //  pll_0_locked.export
    .pll_0_outclk0_clk   (PLLOUT),   // pll_0_outclk0.clk
	
	.dataout_source      (DATA_IN),      //       dataout.source
	.datain_probe        (RD_DATA),        //        datain.probe
	.num_of_bits_source  (NUM_OF_BIT),
	.issp_cnt_source     (ISSP_CNT),     //      issp_cnt.source
	
	//.lm96570_spi_in_0_export        (DATA_IN[69:64]),
	//.lm96570_spi_in_1_export        (DATA_IN[63:32]),
	//.lm96570_spi_in_2_export        (DATA_IN[31:0]),
	//.lm96570_spi_num_of_bits_export (NUM_OF_BIT),
	//.lm96570_spi_out_0_export       (RD_DATA[69:64]),
	//.lm96570_spi_out_1_export       (RD_DATA[63:32]),
	//.lm96570_spi_out_2_export       (RD_DATA[31:0]),
	.ad9276_spi_external_MISO       (SDO),
	.ad9276_spi_external_MOSI       (SDI),
	.ad9276_spi_external_SCLK       (SCLK),
	.ad9276_spi_external_SS_n       (CSB1),
	.general_cnt_export             ({	
										tx_path_en,
										pulser_en,
										lm96570_pin_reset,
										lm96570_tx_en,
										lm96570_spi_reset,
										lm96570_start
									})
);

LM96570_SPI
#(
	.DATA_WIDTH			(DATA_WIDTH),
	.BIT_COUNT_WIDTH	(BIT_COUNT_WIDTH)
)
SPI_01  
(
	// Control Signals
	.START				(ISSP_CNT[0]),
	.DONE				(),
	
	// Data Signals
	.RD_DATA			(RD_DATA),
	
	// SPI output signals
	.NUM_OF_BIT			(NUM_OF_BIT),		// number of bits being shifted
	.DATA_IN			(DATA_IN),
	
	// SPI Bus Signals
	.SPI_CS_N		(SPI_CS_N),
	.SPI_SCK			(SPI_SCK),
	.SPI_SDI			(SPI_SDI),
	.SPI_SDO			(SPI_SDO),
	
	// System Signals
	.CLK				(PLLOUT),
	.RESET			(ISSP_CNT[1])
);

assign TX_PATH_EN = tx_path_en;
assign TX_EN = lm96570_tx_en;
assign BF_RESET = ISSP_CNT[2];
assign PULSER_EN = pulser_en;




endmodule
