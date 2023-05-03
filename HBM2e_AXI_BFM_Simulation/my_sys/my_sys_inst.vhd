	component my_sys is
		port (
			axi_reset_in_reset                      : in  std_logic                    := 'X';             -- reset
			clk100_in_clk                           : in  std_logic                    := 'X';             -- clk
			hbm_fp_0_cattrip_i_conduit              : in  std_logic                    := 'X';             -- conduit
			hbm_fp_0_temp_i_conduit                 : in  std_logic_vector(2 downto 0) := (others => 'X'); -- conduit
			hbm_local_cal_success_local_cal_success : out std_logic;                                       -- local_cal_success
			hbm_local_cal_fail_local_cal_fail       : out std_logic;                                       -- local_cal_fail
			iopll_locked_export                     : out std_logic;                                       -- export
			iopll_reset_reset                       : in  std_logic                    := 'X';             -- reset
			noc_reset_in_reset                      : in  std_logic                    := 'X'              -- reset
		);
	end component my_sys;

	u0 : component my_sys
		port map (
			axi_reset_in_reset                      => CONNECTED_TO_axi_reset_in_reset,                      --          axi_reset_in.reset
			clk100_in_clk                           => CONNECTED_TO_clk100_in_clk,                           --             clk100_in.clk
			hbm_fp_0_cattrip_i_conduit              => CONNECTED_TO_hbm_fp_0_cattrip_i_conduit,              --    hbm_fp_0_cattrip_i.conduit
			hbm_fp_0_temp_i_conduit                 => CONNECTED_TO_hbm_fp_0_temp_i_conduit,                 --       hbm_fp_0_temp_i.conduit
			hbm_local_cal_success_local_cal_success => CONNECTED_TO_hbm_local_cal_success_local_cal_success, -- hbm_local_cal_success.local_cal_success
			hbm_local_cal_fail_local_cal_fail       => CONNECTED_TO_hbm_local_cal_fail_local_cal_fail,       --    hbm_local_cal_fail.local_cal_fail
			iopll_locked_export                     => CONNECTED_TO_iopll_locked_export,                     --          iopll_locked.export
			iopll_reset_reset                       => CONNECTED_TO_iopll_reset_reset,                       --           iopll_reset.reset
			noc_reset_in_reset                      => CONNECTED_TO_noc_reset_in_reset                       --          noc_reset_in.reset
		);

