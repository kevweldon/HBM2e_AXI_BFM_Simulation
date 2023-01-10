module my_sys_hbm_fp_0 (
		output wire       ch0_u0_wmc_intr,   //   ch0_u0_wmc_intr.conduit
		output wire       ch0_u1_wmc_intr,   //   ch0_u1_wmc_intr.conduit
		input  wire       hbm_reset_in,      //      hbm_reset_in.reset
		output wire       hbm_cattrip,       //           cattrip.hbm_cattrip
		input  wire       hbm_cattrip_i,     //         cattrip_i.conduit
		output wire [2:0] hbm_temp,          //              temp.hbm_temp
		input  wire [2:0] hbm_temp_i,        //            temp_i.conduit
		output wire       local_cal_success, // local_cal_success.local_cal_success
		output wire       local_cal_fail,    //    local_cal_fail.local_cal_fail
		input  wire       uibpll_refclk,     //     uibpll_refclk.clk
		output wire       wmcrst_n           //          wmcrst_n.reset_n
	);
endmodule

