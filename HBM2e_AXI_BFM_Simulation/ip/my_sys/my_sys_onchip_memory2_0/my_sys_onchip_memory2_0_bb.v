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
endmodule

