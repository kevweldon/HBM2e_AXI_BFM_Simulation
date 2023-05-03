module my_sys (
		input  wire       axi_reset_in_reset,                      //          axi_reset_in.reset
		input  wire       clk100_in_clk,                           //             clk100_in.clk
		input  wire       hbm_fp_0_cattrip_i_conduit,              //    hbm_fp_0_cattrip_i.conduit
		input  wire [2:0] hbm_fp_0_temp_i_conduit,                 //       hbm_fp_0_temp_i.conduit
		output wire       hbm_local_cal_success_local_cal_success, // hbm_local_cal_success.local_cal_success
		output wire       hbm_local_cal_fail_local_cal_fail,       //    hbm_local_cal_fail.local_cal_fail
		output wire       iopll_locked_export,                     //          iopll_locked.export
		input  wire       iopll_reset_reset,                       //           iopll_reset.reset
		input  wire       noc_reset_in_reset                       //          noc_reset_in.reset
	);
endmodule

