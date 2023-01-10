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
endmodule

