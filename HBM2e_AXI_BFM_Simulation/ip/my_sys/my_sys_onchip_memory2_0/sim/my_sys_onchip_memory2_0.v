// my_sys_onchip_memory2_0.v

// Generated using ACDS version 22.3 104

`timescale 1 ps / 1 ps
module my_sys_onchip_memory2_0 (
		input  wire         clk,        //   clk1.clk
		input  wire [6:0]   address,    //     s1.address
		input  wire         clken,      //       .clken
		input  wire         chipselect, //       .chipselect
		input  wire         write,      //       .write
		output wire [255:0] readdata,   //       .readdata
		input  wire [255:0] writedata,  //       .writedata
		input  wire [31:0]  byteenable, //       .byteenable
		input  wire         reset,      // reset1.reset
		input  wire         reset_req   //       .reset_req
	);

	my_sys_onchip_memory2_0_altera_avalon_onchip_memory2_1936_goynkaa #(
		.INIT_FILE ("my_sys_onchip_memory2_0_onchip_memory2_0.hex")
	) onchip_memory2_0 (
		.clk        (clk),        //   input,    width = 1,   clk1.clk
		.address    (address),    //   input,    width = 7,     s1.address
		.clken      (clken),      //   input,    width = 1,       .clken
		.chipselect (chipselect), //   input,    width = 1,       .chipselect
		.write      (write),      //   input,    width = 1,       .write
		.readdata   (readdata),   //  output,  width = 256,       .readdata
		.writedata  (writedata),  //   input,  width = 256,       .writedata
		.byteenable (byteenable), //   input,   width = 32,       .byteenable
		.reset      (reset),      //   input,    width = 1, reset1.reset
		.reset_req  (reset_req),  //   input,    width = 1,       .reset_req
		.freeze     (1'b0)        // (terminated),                      
	);

endmodule
