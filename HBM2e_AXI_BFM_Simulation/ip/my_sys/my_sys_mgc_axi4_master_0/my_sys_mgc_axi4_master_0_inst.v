	my_sys_mgc_axi4_master_0 #(
		.AXI4_ADDRESS_WIDTH          (INTEGER_VALUE_FOR_AXI4_ADDRESS_WIDTH),
		.AXI4_RDATA_WIDTH            (INTEGER_VALUE_FOR_AXI4_RDATA_WIDTH),
		.AXI4_WDATA_WIDTH            (INTEGER_VALUE_FOR_AXI4_WDATA_WIDTH),
		.AXI4_ID_WIDTH               (INTEGER_VALUE_FOR_AXI4_ID_WIDTH),
		.AXI4_USER_WIDTH             (INTEGER_VALUE_FOR_AXI4_USER_WIDTH),
		.AXI4_REGION_MAP_SIZE        (INTEGER_VALUE_FOR_AXI4_REGION_MAP_SIZE),
		.index                       (INTEGER_VALUE_FOR_index),
		.READ_ISSUING_CAPABILITY     (INTEGER_VALUE_FOR_READ_ISSUING_CAPABILITY),
		.WRITE_ISSUING_CAPABILITY    (INTEGER_VALUE_FOR_WRITE_ISSUING_CAPABILITY),
		.COMBINED_ISSUING_CAPABILITY (INTEGER_VALUE_FOR_COMBINED_ISSUING_CAPABILITY),
		.USE_AWID                    (INTEGER_VALUE_FOR_USE_AWID),
		.USE_AWREGION                (INTEGER_VALUE_FOR_USE_AWREGION),
		.USE_AWLEN                   (INTEGER_VALUE_FOR_USE_AWLEN),
		.USE_AWSIZE                  (INTEGER_VALUE_FOR_USE_AWSIZE),
		.USE_AWBURST                 (INTEGER_VALUE_FOR_USE_AWBURST),
		.USE_AWLOCK                  (INTEGER_VALUE_FOR_USE_AWLOCK),
		.USE_AWCACHE                 (INTEGER_VALUE_FOR_USE_AWCACHE),
		.USE_AWQOS                   (INTEGER_VALUE_FOR_USE_AWQOS),
		.USE_WSTRB                   (INTEGER_VALUE_FOR_USE_WSTRB),
		.USE_BID                     (INTEGER_VALUE_FOR_USE_BID),
		.USE_BRESP                   (INTEGER_VALUE_FOR_USE_BRESP),
		.USE_ARID                    (INTEGER_VALUE_FOR_USE_ARID),
		.USE_ARREGION                (INTEGER_VALUE_FOR_USE_ARREGION),
		.USE_ARLEN                   (INTEGER_VALUE_FOR_USE_ARLEN),
		.USE_ARSIZE                  (INTEGER_VALUE_FOR_USE_ARSIZE),
		.USE_ARBURST                 (INTEGER_VALUE_FOR_USE_ARBURST),
		.USE_ARLOCK                  (INTEGER_VALUE_FOR_USE_ARLOCK),
		.USE_ARCACHE                 (INTEGER_VALUE_FOR_USE_ARCACHE),
		.USE_ARQOS                   (INTEGER_VALUE_FOR_USE_ARQOS),
		.USE_RID                     (INTEGER_VALUE_FOR_USE_RID),
		.USE_RRESP                   (INTEGER_VALUE_FOR_USE_RRESP),
		.USE_RLAST                   (INTEGER_VALUE_FOR_USE_RLAST),
		.USE_AWUSER                  (INTEGER_VALUE_FOR_USE_AWUSER),
		.USE_ARUSER                  (INTEGER_VALUE_FOR_USE_ARUSER),
		.USE_WUSER                   (INTEGER_VALUE_FOR_USE_WUSER),
		.USE_RUSER                   (INTEGER_VALUE_FOR_USE_RUSER),
		.USE_BUSER                   (INTEGER_VALUE_FOR_USE_BUSER)
	) u0 (
		.AWVALID  (_connected_to_AWVALID_),  //  output,    width = 1, altera_axi4_master.awvalid
		.AWPROT   (_connected_to_AWPROT_),   //  output,    width = 3,                   .awprot
		.AWREGION (_connected_to_AWREGION_), //  output,    width = 4,                   .awregion
		.AWLEN    (_connected_to_AWLEN_),    //  output,    width = 8,                   .awlen
		.AWSIZE   (_connected_to_AWSIZE_),   //  output,    width = 3,                   .awsize
		.AWBURST  (_connected_to_AWBURST_),  //  output,    width = 2,                   .awburst
		.AWLOCK   (_connected_to_AWLOCK_),   //  output,    width = 1,                   .awlock
		.AWQOS    (_connected_to_AWQOS_),    //  output,    width = 4,                   .awqos
		.AWREADY  (_connected_to_AWREADY_),  //   input,    width = 1,                   .awready
		.ARVALID  (_connected_to_ARVALID_),  //  output,    width = 1,                   .arvalid
		.ARPROT   (_connected_to_ARPROT_),   //  output,    width = 3,                   .arprot
		.ARREGION (_connected_to_ARREGION_), //  output,    width = 4,                   .arregion
		.ARLEN    (_connected_to_ARLEN_),    //  output,    width = 8,                   .arlen
		.ARSIZE   (_connected_to_ARSIZE_),   //  output,    width = 3,                   .arsize
		.ARBURST  (_connected_to_ARBURST_),  //  output,    width = 2,                   .arburst
		.ARLOCK   (_connected_to_ARLOCK_),   //  output,    width = 1,                   .arlock
		.ARQOS    (_connected_to_ARQOS_),    //  output,    width = 4,                   .arqos
		.ARREADY  (_connected_to_ARREADY_),  //   input,    width = 1,                   .arready
		.RVALID   (_connected_to_RVALID_),   //   input,    width = 1,                   .rvalid
		.RRESP    (_connected_to_RRESP_),    //   input,    width = 2,                   .rresp
		.RLAST    (_connected_to_RLAST_),    //   input,    width = 1,                   .rlast
		.RREADY   (_connected_to_RREADY_),   //  output,    width = 1,                   .rready
		.WVALID   (_connected_to_WVALID_),   //  output,    width = 1,                   .wvalid
		.WLAST    (_connected_to_WLAST_),    //  output,    width = 1,                   .wlast
		.WREADY   (_connected_to_WREADY_),   //   input,    width = 1,                   .wready
		.BVALID   (_connected_to_BVALID_),   //   input,    width = 1,                   .bvalid
		.BRESP    (_connected_to_BRESP_),    //   input,    width = 2,                   .bresp
		.BREADY   (_connected_to_BREADY_),   //  output,    width = 1,                   .bready
		.AWADDR   (_connected_to_AWADDR_),   //  output,   width = 64,                   .awaddr
		.AWID     (_connected_to_AWID_),     //  output,    width = 7,                   .awid
		.AWUSER   (_connected_to_AWUSER_),   //  output,    width = 8,                   .awuser
		.ARADDR   (_connected_to_ARADDR_),   //  output,   width = 64,                   .araddr
		.ARID     (_connected_to_ARID_),     //  output,    width = 7,                   .arid
		.ARUSER   (_connected_to_ARUSER_),   //  output,    width = 8,                   .aruser
		.RUSER    (_connected_to_RUSER_),    //   input,    width = 8,                   .ruser
		.WUSER    (_connected_to_WUSER_),    //  output,    width = 8,                   .wuser
		.RDATA    (_connected_to_RDATA_),    //   input,  width = 256,                   .rdata
		.RID      (_connected_to_RID_),      //   input,    width = 7,                   .rid
		.WDATA    (_connected_to_WDATA_),    //  output,  width = 256,                   .wdata
		.WSTRB    (_connected_to_WSTRB_),    //  output,   width = 32,                   .wstrb
		.BID      (_connected_to_BID_),      //   input,    width = 7,                   .bid
		.ACLK     (_connected_to_ACLK_),     //   input,    width = 1,         clock_sink.clk
		.ARESETn  (_connected_to_ARESETn_)   //   input,    width = 1,         reset_sink.reset_n
	);

