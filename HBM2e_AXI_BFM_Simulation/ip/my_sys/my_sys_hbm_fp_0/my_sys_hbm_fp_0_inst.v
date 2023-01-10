	my_sys_hbm_fp_0 u0 (
		.ch0_u0_wmc_intr   (_connected_to_ch0_u0_wmc_intr_),   //  output,  width = 1,   ch0_u0_wmc_intr.conduit
		.ch0_u1_wmc_intr   (_connected_to_ch0_u1_wmc_intr_),   //  output,  width = 1,   ch0_u1_wmc_intr.conduit
		.hbm_reset_in      (_connected_to_hbm_reset_in_),      //   input,  width = 1,      hbm_reset_in.reset
		.hbm_cattrip       (_connected_to_hbm_cattrip_),       //  output,  width = 1,           cattrip.hbm_cattrip
		.hbm_cattrip_i     (_connected_to_hbm_cattrip_i_),     //   input,  width = 1,         cattrip_i.conduit
		.hbm_temp          (_connected_to_hbm_temp_),          //  output,  width = 3,              temp.hbm_temp
		.hbm_temp_i        (_connected_to_hbm_temp_i_),        //   input,  width = 3,            temp_i.conduit
		.local_cal_success (_connected_to_local_cal_success_), //  output,  width = 1, local_cal_success.local_cal_success
		.local_cal_fail    (_connected_to_local_cal_fail_),    //  output,  width = 1,    local_cal_fail.local_cal_fail
		.uibpll_refclk     (_connected_to_uibpll_refclk_),     //   input,  width = 1,     uibpll_refclk.clk
		.wmcrst_n          (_connected_to_wmcrst_n_)           //  output,  width = 1,          wmcrst_n.reset_n
	);

