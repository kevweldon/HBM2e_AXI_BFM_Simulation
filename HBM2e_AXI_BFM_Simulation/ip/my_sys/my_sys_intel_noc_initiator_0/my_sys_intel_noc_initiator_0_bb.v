module my_sys_intel_noc_initiator_0 (
		input  wire [6:0]   s0_axi4_awid,    //        s0_axi4.awid
		input  wire [43:0]  s0_axi4_awaddr,  //               .awaddr
		input  wire [7:0]   s0_axi4_awlen,   //               .awlen
		input  wire [2:0]   s0_axi4_awsize,  //               .awsize
		input  wire [1:0]   s0_axi4_awburst, //               .awburst
		input  wire         s0_axi4_awlock,  //               .awlock
		input  wire [2:0]   s0_axi4_awprot,  //               .awprot
		input  wire [10:0]  s0_axi4_awuser,  //               .awuser
		input  wire [3:0]   s0_axi4_awqos,   //               .awqos
		input  wire         s0_axi4_awvalid, //               .awvalid
		output wire         s0_axi4_awready, //               .awready
		input  wire [255:0] s0_axi4_wdata,   //               .wdata
		input  wire [31:0]  s0_axi4_wstrb,   //               .wstrb
		input  wire         s0_axi4_wlast,   //               .wlast
		input  wire         s0_axi4_wvalid,  //               .wvalid
		input  wire [31:0]  s0_axi4_wuser,   //               .wuser
		output wire         s0_axi4_wready,  //               .wready
		output wire [6:0]   s0_axi4_bid,     //               .bid
		output wire [1:0]   s0_axi4_bresp,   //               .bresp
		output wire         s0_axi4_bvalid,  //               .bvalid
		input  wire         s0_axi4_bready,  //               .bready
		input  wire [6:0]   s0_axi4_arid,    //               .arid
		input  wire [43:0]  s0_axi4_araddr,  //               .araddr
		input  wire [7:0]   s0_axi4_arlen,   //               .arlen
		input  wire [2:0]   s0_axi4_arsize,  //               .arsize
		input  wire [1:0]   s0_axi4_arburst, //               .arburst
		input  wire         s0_axi4_arlock,  //               .arlock
		input  wire [2:0]   s0_axi4_arprot,  //               .arprot
		input  wire [10:0]  s0_axi4_aruser,  //               .aruser
		input  wire [3:0]   s0_axi4_arqos,   //               .arqos
		input  wire         s0_axi4_arvalid, //               .arvalid
		output wire         s0_axi4_arready, //               .arready
		output wire [6:0]   s0_axi4_rid,     //               .rid
		output wire [255:0] s0_axi4_rdata,   //               .rdata
		output wire [1:0]   s0_axi4_rresp,   //               .rresp
		output wire         s0_axi4_rlast,   //               .rlast
		output wire         s0_axi4_rvalid,  //               .rvalid
		input  wire         s0_axi4_rready,  //               .rready
		output wire [31:0]  s0_axi4_ruser,   //               .ruser
		input  wire [6:0]   s1_axi4_awid,    //        s1_axi4.awid
		input  wire [43:0]  s1_axi4_awaddr,  //               .awaddr
		input  wire [7:0]   s1_axi4_awlen,   //               .awlen
		input  wire [2:0]   s1_axi4_awsize,  //               .awsize
		input  wire [1:0]   s1_axi4_awburst, //               .awburst
		input  wire         s1_axi4_awlock,  //               .awlock
		input  wire [2:0]   s1_axi4_awprot,  //               .awprot
		input  wire [10:0]  s1_axi4_awuser,  //               .awuser
		input  wire [3:0]   s1_axi4_awqos,   //               .awqos
		input  wire         s1_axi4_awvalid, //               .awvalid
		output wire         s1_axi4_awready, //               .awready
		input  wire [255:0] s1_axi4_wdata,   //               .wdata
		input  wire [31:0]  s1_axi4_wstrb,   //               .wstrb
		input  wire         s1_axi4_wlast,   //               .wlast
		input  wire         s1_axi4_wvalid,  //               .wvalid
		input  wire [31:0]  s1_axi4_wuser,   //               .wuser
		output wire         s1_axi4_wready,  //               .wready
		output wire [6:0]   s1_axi4_bid,     //               .bid
		output wire [1:0]   s1_axi4_bresp,   //               .bresp
		output wire         s1_axi4_bvalid,  //               .bvalid
		input  wire         s1_axi4_bready,  //               .bready
		input  wire [6:0]   s1_axi4_arid,    //               .arid
		input  wire [43:0]  s1_axi4_araddr,  //               .araddr
		input  wire [7:0]   s1_axi4_arlen,   //               .arlen
		input  wire [2:0]   s1_axi4_arsize,  //               .arsize
		input  wire [1:0]   s1_axi4_arburst, //               .arburst
		input  wire         s1_axi4_arlock,  //               .arlock
		input  wire [2:0]   s1_axi4_arprot,  //               .arprot
		input  wire [10:0]  s1_axi4_aruser,  //               .aruser
		input  wire [3:0]   s1_axi4_arqos,   //               .arqos
		input  wire         s1_axi4_arvalid, //               .arvalid
		output wire         s1_axi4_arready, //               .arready
		output wire [6:0]   s1_axi4_rid,     //               .rid
		output wire [255:0] s1_axi4_rdata,   //               .rdata
		output wire [1:0]   s1_axi4_rresp,   //               .rresp
		output wire         s1_axi4_rlast,   //               .rlast
		output wire         s1_axi4_rvalid,  //               .rvalid
		input  wire         s1_axi4_rready,  //               .rready
		output wire [31:0]  s1_axi4_ruser,   //               .ruser
		input  wire         s_axi4_aclk,     //    s_axi4_aclk.clk
		input  wire         s_axi4_aresetn   // s_axi4_aresetn.reset_n
	);
endmodule

