// my_sys_mgc_axi4_master_0.v

// Generated using ACDS version 23.1 115

`timescale 1 ps / 1 ps
module my_sys_mgc_axi4_master_0 #(
		parameter AXI4_ADDRESS_WIDTH          = 64,
		parameter AXI4_RDATA_WIDTH            = 256,
		parameter AXI4_WDATA_WIDTH            = 256,
		parameter AXI4_ID_WIDTH               = 7,
		parameter AXI4_USER_WIDTH             = 8,
		parameter AXI4_REGION_MAP_SIZE        = 16,
		parameter index                       = 0,
		parameter READ_ISSUING_CAPABILITY     = 16,
		parameter WRITE_ISSUING_CAPABILITY    = 16,
		parameter COMBINED_ISSUING_CAPABILITY = 16,
		parameter USE_AWID                    = 1,
		parameter USE_AWREGION                = 1,
		parameter USE_AWLEN                   = 1,
		parameter USE_AWSIZE                  = 1,
		parameter USE_AWBURST                 = 1,
		parameter USE_AWLOCK                  = 1,
		parameter USE_AWCACHE                 = 0,
		parameter USE_AWQOS                   = 1,
		parameter USE_WSTRB                   = 1,
		parameter USE_BID                     = 1,
		parameter USE_BRESP                   = 1,
		parameter USE_ARID                    = 1,
		parameter USE_ARREGION                = 1,
		parameter USE_ARLEN                   = 1,
		parameter USE_ARSIZE                  = 1,
		parameter USE_ARBURST                 = 1,
		parameter USE_ARLOCK                  = 1,
		parameter USE_ARCACHE                 = 0,
		parameter USE_ARQOS                   = 1,
		parameter USE_RID                     = 1,
		parameter USE_RRESP                   = 1,
		parameter USE_RLAST                   = 1,
		parameter USE_AWUSER                  = 1,
		parameter USE_ARUSER                  = 1,
		parameter USE_WUSER                   = 1,
		parameter USE_RUSER                   = 1,
		parameter USE_BUSER                   = 0
	) (
		output wire         AWVALID,  // altera_axi4_master.awvalid
		output wire [2:0]   AWPROT,   //                   .awprot
		output wire [3:0]   AWREGION, //                   .awregion
		output wire [7:0]   AWLEN,    //                   .awlen
		output wire [2:0]   AWSIZE,   //                   .awsize
		output wire [1:0]   AWBURST,  //                   .awburst
		output wire         AWLOCK,   //                   .awlock
		output wire [3:0]   AWQOS,    //                   .awqos
		input  wire         AWREADY,  //                   .awready
		output wire         ARVALID,  //                   .arvalid
		output wire [2:0]   ARPROT,   //                   .arprot
		output wire [3:0]   ARREGION, //                   .arregion
		output wire [7:0]   ARLEN,    //                   .arlen
		output wire [2:0]   ARSIZE,   //                   .arsize
		output wire [1:0]   ARBURST,  //                   .arburst
		output wire         ARLOCK,   //                   .arlock
		output wire [3:0]   ARQOS,    //                   .arqos
		input  wire         ARREADY,  //                   .arready
		input  wire         RVALID,   //                   .rvalid
		input  wire [1:0]   RRESP,    //                   .rresp
		input  wire         RLAST,    //                   .rlast
		output wire         RREADY,   //                   .rready
		output wire         WVALID,   //                   .wvalid
		output wire         WLAST,    //                   .wlast
		input  wire         WREADY,   //                   .wready
		input  wire         BVALID,   //                   .bvalid
		input  wire [1:0]   BRESP,    //                   .bresp
		output wire         BREADY,   //                   .bready
		output wire [63:0]  AWADDR,   //                   .awaddr
		output wire [6:0]   AWID,     //                   .awid
		output wire [7:0]   AWUSER,   //                   .awuser
		output wire [63:0]  ARADDR,   //                   .araddr
		output wire [6:0]   ARID,     //                   .arid
		output wire [7:0]   ARUSER,   //                   .aruser
		input  wire [7:0]   RUSER,    //                   .ruser
		output wire [7:0]   WUSER,    //                   .wuser
		input  wire [255:0] RDATA,    //                   .rdata
		input  wire [6:0]   RID,      //                   .rid
		output wire [255:0] WDATA,    //                   .wdata
		output wire [31:0]  WSTRB,    //                   .wstrb
		input  wire [6:0]   BID,      //                   .bid
		input  wire         ACLK,     //         clock_sink.clk
		input  wire         ARESETn   //         reset_sink.reset_n
	);

	mgc_axi4_master #(
		.AXI4_ADDRESS_WIDTH          (AXI4_ADDRESS_WIDTH),
		.AXI4_RDATA_WIDTH            (AXI4_RDATA_WIDTH),
		.AXI4_WDATA_WIDTH            (AXI4_WDATA_WIDTH),
		.AXI4_ID_WIDTH               (AXI4_ID_WIDTH),
		.AXI4_USER_WIDTH             (AXI4_USER_WIDTH),
		.AXI4_REGION_MAP_SIZE        (AXI4_REGION_MAP_SIZE),
		.index                       (index),
		.READ_ISSUING_CAPABILITY     (READ_ISSUING_CAPABILITY),
		.WRITE_ISSUING_CAPABILITY    (WRITE_ISSUING_CAPABILITY),
		.COMBINED_ISSUING_CAPABILITY (COMBINED_ISSUING_CAPABILITY),
		.USE_AWID                    (USE_AWID),
		.USE_AWREGION                (USE_AWREGION),
		.USE_AWLEN                   (USE_AWLEN),
		.USE_AWSIZE                  (USE_AWSIZE),
		.USE_AWBURST                 (USE_AWBURST),
		.USE_AWLOCK                  (USE_AWLOCK),
		.USE_AWCACHE                 (USE_AWCACHE),
		.USE_AWQOS                   (USE_AWQOS),
		.USE_WSTRB                   (USE_WSTRB),
		.USE_BID                     (USE_BID),
		.USE_BRESP                   (USE_BRESP),
		.USE_ARID                    (USE_ARID),
		.USE_ARREGION                (USE_ARREGION),
		.USE_ARLEN                   (USE_ARLEN),
		.USE_ARSIZE                  (USE_ARSIZE),
		.USE_ARBURST                 (USE_ARBURST),
		.USE_ARLOCK                  (USE_ARLOCK),
		.USE_ARCACHE                 (USE_ARCACHE),
		.USE_ARQOS                   (USE_ARQOS),
		.USE_RID                     (USE_RID),
		.USE_RRESP                   (USE_RRESP),
		.USE_RLAST                   (USE_RLAST),
		.USE_AWUSER                  (USE_AWUSER),
		.USE_ARUSER                  (USE_ARUSER),
		.USE_WUSER                   (USE_WUSER),
		.USE_RUSER                   (USE_RUSER),
		.USE_BUSER                   (USE_BUSER)
	) mgc_axi4_master_0 (
		.AWVALID  (AWVALID),     //  output,    width = 1, altera_axi4_master.awvalid
		.AWPROT   (AWPROT),      //  output,    width = 3,                   .awprot
		.AWREGION (AWREGION),    //  output,    width = 4,                   .awregion
		.AWLEN    (AWLEN),       //  output,    width = 8,                   .awlen
		.AWSIZE   (AWSIZE),      //  output,    width = 3,                   .awsize
		.AWBURST  (AWBURST),     //  output,    width = 2,                   .awburst
		.AWLOCK   (AWLOCK),      //  output,    width = 1,                   .awlock
		.AWQOS    (AWQOS),       //  output,    width = 4,                   .awqos
		.AWREADY  (AWREADY),     //   input,    width = 1,                   .awready
		.ARVALID  (ARVALID),     //  output,    width = 1,                   .arvalid
		.ARPROT   (ARPROT),      //  output,    width = 3,                   .arprot
		.ARREGION (ARREGION),    //  output,    width = 4,                   .arregion
		.ARLEN    (ARLEN),       //  output,    width = 8,                   .arlen
		.ARSIZE   (ARSIZE),      //  output,    width = 3,                   .arsize
		.ARBURST  (ARBURST),     //  output,    width = 2,                   .arburst
		.ARLOCK   (ARLOCK),      //  output,    width = 1,                   .arlock
		.ARQOS    (ARQOS),       //  output,    width = 4,                   .arqos
		.ARREADY  (ARREADY),     //   input,    width = 1,                   .arready
		.RVALID   (RVALID),      //   input,    width = 1,                   .rvalid
		.RRESP    (RRESP),       //   input,    width = 2,                   .rresp
		.RLAST    (RLAST),       //   input,    width = 1,                   .rlast
		.RREADY   (RREADY),      //  output,    width = 1,                   .rready
		.WVALID   (WVALID),      //  output,    width = 1,                   .wvalid
		.WLAST    (WLAST),       //  output,    width = 1,                   .wlast
		.WREADY   (WREADY),      //   input,    width = 1,                   .wready
		.BVALID   (BVALID),      //   input,    width = 1,                   .bvalid
		.BRESP    (BRESP),       //   input,    width = 2,                   .bresp
		.BREADY   (BREADY),      //  output,    width = 1,                   .bready
		.AWADDR   (AWADDR),      //  output,   width = 64,                   .awaddr
		.AWID     (AWID),        //  output,    width = 7,                   .awid
		.AWUSER   (AWUSER),      //  output,    width = 8,                   .awuser
		.ARADDR   (ARADDR),      //  output,   width = 64,                   .araddr
		.ARID     (ARID),        //  output,    width = 7,                   .arid
		.ARUSER   (ARUSER),      //  output,    width = 8,                   .aruser
		.RUSER    (RUSER),       //   input,    width = 8,                   .ruser
		.WUSER    (WUSER),       //  output,    width = 8,                   .wuser
		.RDATA    (RDATA),       //   input,  width = 256,                   .rdata
		.RID      (RID),         //   input,    width = 7,                   .rid
		.WDATA    (WDATA),       //  output,  width = 256,                   .wdata
		.WSTRB    (WSTRB),       //  output,   width = 32,                   .wstrb
		.BID      (BID),         //   input,    width = 7,                   .bid
		.ACLK     (ACLK),        //   input,    width = 1,         clock_sink.clk
		.ARESETn  (ARESETn),     //   input,    width = 1,         reset_sink.reset_n
		.AWCACHE  (),            // (terminated),                                  
		.ARCACHE  (),            // (terminated),                                  
		.BUSER    (8'b00000000)  // (terminated),                                  
	);

endmodule
