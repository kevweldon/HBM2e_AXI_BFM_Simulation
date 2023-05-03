	my_sys u0 (
		.axi_reset_in_reset                      (_connected_to_axi_reset_in_reset_),                      //   input,  width = 1,          axi_reset_in.reset
		.clk100_in_clk                           (_connected_to_clk100_in_clk_),                           //   input,  width = 1,             clk100_in.clk
		.hbm_fp_0_cattrip_i_conduit              (_connected_to_hbm_fp_0_cattrip_i_conduit_),              //   input,  width = 1,    hbm_fp_0_cattrip_i.conduit
		.hbm_fp_0_temp_i_conduit                 (_connected_to_hbm_fp_0_temp_i_conduit_),                 //   input,  width = 3,       hbm_fp_0_temp_i.conduit
		.hbm_local_cal_success_local_cal_success (_connected_to_hbm_local_cal_success_local_cal_success_), //  output,  width = 1, hbm_local_cal_success.local_cal_success
		.hbm_local_cal_fail_local_cal_fail       (_connected_to_hbm_local_cal_fail_local_cal_fail_),       //  output,  width = 1,    hbm_local_cal_fail.local_cal_fail
		.iopll_locked_export                     (_connected_to_iopll_locked_export_),                     //  output,  width = 1,          iopll_locked.export
		.iopll_reset_reset                       (_connected_to_iopll_reset_reset_),                       //   input,  width = 1,           iopll_reset.reset
		.noc_reset_in_reset                      (_connected_to_noc_reset_in_reset_)                       //   input,  width = 1,          noc_reset_in.reset
	);

