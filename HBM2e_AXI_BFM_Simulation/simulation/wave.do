onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/axi_reset_in_reset
add wave -noupdate /top_tb/clk100_in_clk
add wave -noupdate /top_tb/hbm_reset_in_reset
add wave -noupdate /top_tb/hbm_fp_0_cattrip_i_conduit
add wave -noupdate /top_tb/hbm_fp_0_temp_i_conduit
add wave -noupdate /top_tb/hbm_local_cal_success_local_cal_success
add wave -noupdate /top_tb/hbm_local_cal_fail_local_cal_fail
add wave -noupdate /top_tb/hbm_wmcrst_n_reset_n
add wave -noupdate /top_tb/iopll_locked_export
add wave -noupdate /top_tb/iopll_reset_reset
add wave -noupdate /top_tb/noc_reset_in_reset
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/AWVALID
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/AWSIZE
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/AWBURST
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/AWREADY
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/ARVALID
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/ARSIZE
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/ARBURST
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/ARREADY
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/ACLK
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/RVALID
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/RDATA
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/RLAST
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/RREADY
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/WVALID
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/WDATA
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/WLAST
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/WREADY
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/BVALID
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/BRESP
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/BREADY
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/AWADDR
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/AWUSER
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/ARADDR
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/ARID
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/RID
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/WSTRB
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/BID
add wave -noupdate -group {AXI BFM CH0} /top_tb/dut/mgc_axi4_master_0/ARESETn
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ACLK
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARESETn
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWVALID
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWADDR
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWPROT
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWREGION
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWLEN
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWSIZE
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWBURST
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWLOCK
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWCACHE
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWQOS
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWID
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWUSER
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/AWREADY
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARVALID
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARADDR
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARPROT
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARREGION
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARLEN
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARSIZE
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARBURST
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARLOCK
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARCACHE
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARQOS
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARID
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARUSER
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/ARREADY
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/RVALID
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/RDATA
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/RRESP
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/RLAST
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/RID
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/RUSER
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/RREADY
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/WVALID
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/WDATA
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/WSTRB
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/WLAST
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/WUSER
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/WREADY
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/BVALID
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/BRESP
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/BID
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/BUSER
add wave -noupdate -group {AXI BFM CH1} /top_tb/dut/mgc_axi4_master_1/mgc_axi4_master_0/BREADY
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s_axi4_aclk
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s_axi4_aresetn
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_awid
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_awaddr
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_awlen
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_awsize
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_awburst
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_awlock
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_awprot
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_awuser
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_awqos
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_awvalid
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_awready
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_wdata
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_wstrb
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_wlast
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_wvalid
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_wuser
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_wready
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_bid
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_bresp
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_bvalid
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_bready
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_arid
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_araddr
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_arlen
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_arsize
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_arburst
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_arlock
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_arprot
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_aruser
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_arqos
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_arvalid
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_arready
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_rid
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_rdata
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_rresp
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_rlast
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_rvalid
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_rready
add wave -noupdate -group {AXI NOC CH0} /top_tb/dut/intel_noc_initiator_0/s0_axi4_ruser
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s_axi4_aclk
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s_axi4_aresetn
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_awid
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_awaddr
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_awlen
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_awsize
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_awburst
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_awlock
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_awprot
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_awuser
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_awqos
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_awvalid
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_awready
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_wdata
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_wstrb
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_wlast
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_wvalid
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_wuser
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_wready
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_bid
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_bresp
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_bvalid
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_bready
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_arid
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_araddr
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_arlen
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_arsize
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_arburst
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_arlock
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_arprot
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_aruser
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_arqos
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_arvalid
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_arready
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_rid
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_rdata
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_rresp
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_rlast
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_rvalid
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_rready
add wave -noupdate -group {AXI NOC CH1} /top_tb/dut/intel_noc_initiator_0/s1_axi4_ruser
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {255501299641 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 524
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {252105560522 fs} {259330168750 fs}
