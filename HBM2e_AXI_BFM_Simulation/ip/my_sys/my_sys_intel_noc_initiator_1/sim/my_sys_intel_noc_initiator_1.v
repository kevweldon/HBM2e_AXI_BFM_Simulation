// my_sys_intel_noc_initiator_1.v

// Generated using ACDS version 23.1 115

`timescale 1 ps / 1 ps
module my_sys_intel_noc_initiator_1 (
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

	my_sys_intel_noc_initiator_1_intel_noc_initiator_110_qshnowy intel_noc_initiator_0 (
		.s0_axi4_awid    (s0_axi4_awid),    //   input,    width = 7,        s0_axi4.awid
		.s0_axi4_awaddr  (s0_axi4_awaddr),  //   input,   width = 44,               .awaddr
		.s0_axi4_awlen   (s0_axi4_awlen),   //   input,    width = 8,               .awlen
		.s0_axi4_awsize  (s0_axi4_awsize),  //   input,    width = 3,               .awsize
		.s0_axi4_awburst (s0_axi4_awburst), //   input,    width = 2,               .awburst
		.s0_axi4_awlock  (s0_axi4_awlock),  //   input,    width = 1,               .awlock
		.s0_axi4_awprot  (s0_axi4_awprot),  //   input,    width = 3,               .awprot
		.s0_axi4_awuser  (s0_axi4_awuser),  //   input,   width = 11,               .awuser
		.s0_axi4_awqos   (s0_axi4_awqos),   //   input,    width = 4,               .awqos
		.s0_axi4_awvalid (s0_axi4_awvalid), //   input,    width = 1,               .awvalid
		.s0_axi4_awready (s0_axi4_awready), //  output,    width = 1,               .awready
		.s0_axi4_wdata   (s0_axi4_wdata),   //   input,  width = 256,               .wdata
		.s0_axi4_wstrb   (s0_axi4_wstrb),   //   input,   width = 32,               .wstrb
		.s0_axi4_wlast   (s0_axi4_wlast),   //   input,    width = 1,               .wlast
		.s0_axi4_wvalid  (s0_axi4_wvalid),  //   input,    width = 1,               .wvalid
		.s0_axi4_wuser   (s0_axi4_wuser),   //   input,   width = 32,               .wuser
		.s0_axi4_wready  (s0_axi4_wready),  //  output,    width = 1,               .wready
		.s0_axi4_bid     (s0_axi4_bid),     //  output,    width = 7,               .bid
		.s0_axi4_bresp   (s0_axi4_bresp),   //  output,    width = 2,               .bresp
		.s0_axi4_bvalid  (s0_axi4_bvalid),  //  output,    width = 1,               .bvalid
		.s0_axi4_bready  (s0_axi4_bready),  //   input,    width = 1,               .bready
		.s0_axi4_arid    (s0_axi4_arid),    //   input,    width = 7,               .arid
		.s0_axi4_araddr  (s0_axi4_araddr),  //   input,   width = 44,               .araddr
		.s0_axi4_arlen   (s0_axi4_arlen),   //   input,    width = 8,               .arlen
		.s0_axi4_arsize  (s0_axi4_arsize),  //   input,    width = 3,               .arsize
		.s0_axi4_arburst (s0_axi4_arburst), //   input,    width = 2,               .arburst
		.s0_axi4_arlock  (s0_axi4_arlock),  //   input,    width = 1,               .arlock
		.s0_axi4_arprot  (s0_axi4_arprot),  //   input,    width = 3,               .arprot
		.s0_axi4_aruser  (s0_axi4_aruser),  //   input,   width = 11,               .aruser
		.s0_axi4_arqos   (s0_axi4_arqos),   //   input,    width = 4,               .arqos
		.s0_axi4_arvalid (s0_axi4_arvalid), //   input,    width = 1,               .arvalid
		.s0_axi4_arready (s0_axi4_arready), //  output,    width = 1,               .arready
		.s0_axi4_rid     (s0_axi4_rid),     //  output,    width = 7,               .rid
		.s0_axi4_rdata   (s0_axi4_rdata),   //  output,  width = 256,               .rdata
		.s0_axi4_rresp   (s0_axi4_rresp),   //  output,    width = 2,               .rresp
		.s0_axi4_rlast   (s0_axi4_rlast),   //  output,    width = 1,               .rlast
		.s0_axi4_rvalid  (s0_axi4_rvalid),  //  output,    width = 1,               .rvalid
		.s0_axi4_rready  (s0_axi4_rready),  //   input,    width = 1,               .rready
		.s0_axi4_ruser   (s0_axi4_ruser),   //  output,   width = 32,               .ruser
		.s1_axi4_awid    (s1_axi4_awid),    //   input,    width = 7,        s1_axi4.awid
		.s1_axi4_awaddr  (s1_axi4_awaddr),  //   input,   width = 44,               .awaddr
		.s1_axi4_awlen   (s1_axi4_awlen),   //   input,    width = 8,               .awlen
		.s1_axi4_awsize  (s1_axi4_awsize),  //   input,    width = 3,               .awsize
		.s1_axi4_awburst (s1_axi4_awburst), //   input,    width = 2,               .awburst
		.s1_axi4_awlock  (s1_axi4_awlock),  //   input,    width = 1,               .awlock
		.s1_axi4_awprot  (s1_axi4_awprot),  //   input,    width = 3,               .awprot
		.s1_axi4_awuser  (s1_axi4_awuser),  //   input,   width = 11,               .awuser
		.s1_axi4_awqos   (s1_axi4_awqos),   //   input,    width = 4,               .awqos
		.s1_axi4_awvalid (s1_axi4_awvalid), //   input,    width = 1,               .awvalid
		.s1_axi4_awready (s1_axi4_awready), //  output,    width = 1,               .awready
		.s1_axi4_wdata   (s1_axi4_wdata),   //   input,  width = 256,               .wdata
		.s1_axi4_wstrb   (s1_axi4_wstrb),   //   input,   width = 32,               .wstrb
		.s1_axi4_wlast   (s1_axi4_wlast),   //   input,    width = 1,               .wlast
		.s1_axi4_wvalid  (s1_axi4_wvalid),  //   input,    width = 1,               .wvalid
		.s1_axi4_wuser   (s1_axi4_wuser),   //   input,   width = 32,               .wuser
		.s1_axi4_wready  (s1_axi4_wready),  //  output,    width = 1,               .wready
		.s1_axi4_bid     (s1_axi4_bid),     //  output,    width = 7,               .bid
		.s1_axi4_bresp   (s1_axi4_bresp),   //  output,    width = 2,               .bresp
		.s1_axi4_bvalid  (s1_axi4_bvalid),  //  output,    width = 1,               .bvalid
		.s1_axi4_bready  (s1_axi4_bready),  //   input,    width = 1,               .bready
		.s1_axi4_arid    (s1_axi4_arid),    //   input,    width = 7,               .arid
		.s1_axi4_araddr  (s1_axi4_araddr),  //   input,   width = 44,               .araddr
		.s1_axi4_arlen   (s1_axi4_arlen),   //   input,    width = 8,               .arlen
		.s1_axi4_arsize  (s1_axi4_arsize),  //   input,    width = 3,               .arsize
		.s1_axi4_arburst (s1_axi4_arburst), //   input,    width = 2,               .arburst
		.s1_axi4_arlock  (s1_axi4_arlock),  //   input,    width = 1,               .arlock
		.s1_axi4_arprot  (s1_axi4_arprot),  //   input,    width = 3,               .arprot
		.s1_axi4_aruser  (s1_axi4_aruser),  //   input,   width = 11,               .aruser
		.s1_axi4_arqos   (s1_axi4_arqos),   //   input,    width = 4,               .arqos
		.s1_axi4_arvalid (s1_axi4_arvalid), //   input,    width = 1,               .arvalid
		.s1_axi4_arready (s1_axi4_arready), //  output,    width = 1,               .arready
		.s1_axi4_rid     (s1_axi4_rid),     //  output,    width = 7,               .rid
		.s1_axi4_rdata   (s1_axi4_rdata),   //  output,  width = 256,               .rdata
		.s1_axi4_rresp   (s1_axi4_rresp),   //  output,    width = 2,               .rresp
		.s1_axi4_rlast   (s1_axi4_rlast),   //  output,    width = 1,               .rlast
		.s1_axi4_rvalid  (s1_axi4_rvalid),  //  output,    width = 1,               .rvalid
		.s1_axi4_rready  (s1_axi4_rready),  //   input,    width = 1,               .rready
		.s1_axi4_ruser   (s1_axi4_ruser),   //  output,   width = 32,               .ruser
		.s_axi4_aclk     (s_axi4_aclk),     //   input,    width = 1,    s_axi4_aclk.clk
		.s_axi4_aresetn  (s_axi4_aresetn)   //   input,    width = 1, s_axi4_aresetn.reset_n
	);

endmodule
