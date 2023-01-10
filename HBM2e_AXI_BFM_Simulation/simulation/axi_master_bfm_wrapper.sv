// Kevin Weldon - 11/15/22
// Wrapper file for AXI BFM 

import mgc_axi4_pkg::*;
module axi_master_bfm_wrapper 
  #(
    int AXI4_ADDRESS_WIDTH = 32, 
    int AXI4_RDATA_WIDTH = 1024, 
    int AXI4_WDATA_WIDTH = 1024, 
    int AXI4_ID_WIDTH = 18, 
    int AXI4_USER_WIDTH = 8, 
    int AXI4_REGION_MAP_SIZE = 16
    )
   (
    mgc_axi4_master bfm,
    input verbose
    );
   
   task automatic axi_write;
      input [AXI4_ADDRESS_WIDTH-1:0] address;
      input [AXI4_WDATA_WIDTH-1:0]   data;
      input [AXI4_WDATA_WIDTH/8-1:0] wstrobe;
      input [31:0] 		     transaction_id;
      axi4_transaction trans;
      trans = bfm.create_write_transaction(address);
      trans.set_data_words(data, 0);
      trans.set_write_strobes(wstrobe, transaction_id);
      // By default it will run in Blocking mode
      bfm.execute_transaction(trans); 
      if (verbose==1)
	begin
	   $display ( "%m: %t: Wrote data 0x%h to address 0x%h.", 
		      $time, data, address);
	end
      // Implicit destruction of object
      trans = null;
   endtask // axi_write
   
   task automatic axi_write_burst;
      input [AXI4_ADDRESS_WIDTH-1:0] address;
      input [AXI4_WDATA_WIDTH-1:0]   data [256];
      input [AXI4_WDATA_WIDTH/8-1:0] wstrobe [256];
      input [31:0] 		     transaction_id;
      input [31:0] 		     burst_length;
      axi4_transaction trans;
      // Write data burst length of 8 to start address 0.
      trans = bfm.create_write_transaction(address, burst_length-1);
      //trans.set_size(AXI4_BYTES_4);
      for (byte i=0; i<burst_length; i++)
	begin
	   trans.set_data_words(data[i], transaction_id + i);
	   trans.set_write_strobes(wstrobe[i], transaction_id + i);
	   if (verbose==1)
	     begin
		$display ( "%m: %t: Wrote burst data 0x%h to starting address 0x%h. Burst index is %d.", 
			   $time, data[i], address, i);
	     end
	end
      bfm.execute_transaction(trans); 
      trans = null;
   endtask // axi_write

   task automatic axi_read;
      input [AXI4_ADDRESS_WIDTH-1:0] address;
      output [AXI4_RDATA_WIDTH-1:0]  data;
      axi4_transaction trans;
      trans = bfm.create_read_transaction(address);
      // Default is to read a word
      //trans.set_size(AXI4_BYTES_4);
      //trans.set_id(1);
      bfm.execute_transaction(trans);
      data = trans.get_data_words(0);
      if (verbose==1)
	begin
	   $display ( "%m: %t: read data 0x%h at address 0x%h.", 
		      $time, data, address);
	end
      trans = null;
   endtask // axi_read

   task automatic axi_read_burst;
      input [AXI4_ADDRESS_WIDTH-1:0] address;
      input [31:0] 		     burst_length;
      output [AXI4_RDATA_WIDTH-1:0]  data [256];
      axi4_transaction trans;
      trans = bfm.create_read_transaction(address, burst_length-1);
      bfm.execute_transaction(trans);
      for (byte i=0; i<burst_length; i++)
	begin
	   data[i] = trans.get_data_words(i);
	   if (verbose==1)
	     begin
		$display ( "%m: %t: read burst data 0x%h at address 0x%h. Current index is %d.", 
			   $time, data[i], address, i);
	     end
	end
      trans = null;
   endtask // axi_read_burst

endmodule
