	component system is
		port (
			ad9276_spi_external_MISO       : in  std_logic                     := 'X';             -- MISO
			ad9276_spi_external_MOSI       : out std_logic;                                        -- MOSI
			ad9276_spi_external_SCLK       : out std_logic;                                        -- SCLK
			ad9276_spi_external_SS_n       : out std_logic;                                        -- SS_n
			clk_clk                        : in  std_logic                     := 'X';             -- clk
			datain_probe                   : in  std_logic_vector(69 downto 0) := (others => 'X'); -- probe
			dataout_source                 : out std_logic_vector(69 downto 0);                    -- source
			general_cnt_export             : out std_logic_vector(31 downto 0);                    -- export
			issp_cnt_source                : out std_logic_vector(9 downto 0);                     -- source
			lm96570_spi_in_0_export        : out std_logic_vector(31 downto 0);                    -- export
			lm96570_spi_in_1_export        : out std_logic_vector(31 downto 0);                    -- export
			lm96570_spi_in_2_export        : out std_logic_vector(5 downto 0);                     -- export
			lm96570_spi_num_of_bits_export : out std_logic_vector(7 downto 0);                     -- export
			lm96570_spi_out_0_export       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			lm96570_spi_out_1_export       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			lm96570_spi_out_2_export       : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- export
			num_of_bits_source             : out std_logic_vector(7 downto 0);                     -- source
			pll_0_locked_export            : out std_logic;                                        -- export
			pll_0_outclk0_clk              : out std_logic;                                        -- clk
			reset_reset_n                  : in  std_logic                     := 'X'              -- reset_n
		);
	end component system;

	u0 : component system
		port map (
			ad9276_spi_external_MISO       => CONNECTED_TO_ad9276_spi_external_MISO,       --     ad9276_spi_external.MISO
			ad9276_spi_external_MOSI       => CONNECTED_TO_ad9276_spi_external_MOSI,       --                        .MOSI
			ad9276_spi_external_SCLK       => CONNECTED_TO_ad9276_spi_external_SCLK,       --                        .SCLK
			ad9276_spi_external_SS_n       => CONNECTED_TO_ad9276_spi_external_SS_n,       --                        .SS_n
			clk_clk                        => CONNECTED_TO_clk_clk,                        --                     clk.clk
			datain_probe                   => CONNECTED_TO_datain_probe,                   --                  datain.probe
			dataout_source                 => CONNECTED_TO_dataout_source,                 --                 dataout.source
			general_cnt_export             => CONNECTED_TO_general_cnt_export,             --             general_cnt.export
			issp_cnt_source                => CONNECTED_TO_issp_cnt_source,                --                issp_cnt.source
			lm96570_spi_in_0_export        => CONNECTED_TO_lm96570_spi_in_0_export,        --        lm96570_spi_in_0.export
			lm96570_spi_in_1_export        => CONNECTED_TO_lm96570_spi_in_1_export,        --        lm96570_spi_in_1.export
			lm96570_spi_in_2_export        => CONNECTED_TO_lm96570_spi_in_2_export,        --        lm96570_spi_in_2.export
			lm96570_spi_num_of_bits_export => CONNECTED_TO_lm96570_spi_num_of_bits_export, -- lm96570_spi_num_of_bits.export
			lm96570_spi_out_0_export       => CONNECTED_TO_lm96570_spi_out_0_export,       --       lm96570_spi_out_0.export
			lm96570_spi_out_1_export       => CONNECTED_TO_lm96570_spi_out_1_export,       --       lm96570_spi_out_1.export
			lm96570_spi_out_2_export       => CONNECTED_TO_lm96570_spi_out_2_export,       --       lm96570_spi_out_2.export
			num_of_bits_source             => CONNECTED_TO_num_of_bits_source,             --             num_of_bits.source
			pll_0_locked_export            => CONNECTED_TO_pll_0_locked_export,            --            pll_0_locked.export
			pll_0_outclk0_clk              => CONNECTED_TO_pll_0_outclk0_clk,              --           pll_0_outclk0.clk
			reset_reset_n                  => CONNECTED_TO_reset_reset_n                   --                   reset.reset_n
		);

