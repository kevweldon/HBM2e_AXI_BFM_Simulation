
module top_tb;
   
   timeunit 1ns;
   timeprecision 10ps;

   localparam DATA_WIDTH = 256;
   localparam ADDR_WIDTH = 64;

   logic       axi_reset_in_reset;
   logic       clk100_in_clk;
   logic       hbm_fp_0_cattrip_i_conduit;
   logic [2:0] hbm_fp_0_temp_i_conduit;
   logic       hbm_local_cal_success_local_cal_success;
   logic       hbm_local_cal_fail_local_cal_fail;
   logic       iopll_locked_export;
   logic       iopll_reset_reset;
   logic       noc_reset_in_reset;

   logic [DATA_WIDTH-1:0] read_data [256];

   localparam INITIATOR0_CH0_BASE = 44'h000_0000_0000;
   localparam INITIATOR0_CH1_BASE = 44'h000_4000_0000;
   localparam INITIATOR1_CH0_BASE = 44'h000_0000_0000;
   localparam INITIATOR1_CH1_BASE = 44'h000_4000_0000;

   initial
     begin
	clk100_in_clk = 0;
	#0;
	forever #5 clk100_in_clk = ~clk100_in_clk;
     end

   // Add NoC connectivity and address mapping
   initial begin
      #1;
      // Create a 2x2 crossbar
      // Connecting NoC initiator 0 to HBM channel 0
      dut.intel_noc_initiator_0.intel_noc_initiator_0.iniu_0.initiator_inst_0.register_if
	(dut.hbm_fp_0.hbm_fp_0.tniu_ch0_u0.target_0.target_inst_0.get_if(), INITIATOR0_CH0_BASE, 32'h4000_0000);
      
      // Connecting NoC initiator 0 to HBM channel 1
      dut.intel_noc_initiator_0.intel_noc_initiator_0.iniu_0.initiator_inst_0.register_if
	(dut.hbm_fp_0.hbm_fp_0.tniu_ch0_u1.target_0.target_inst_0.get_if(), INITIATOR0_CH1_BASE, 32'h4000_0000);

      // Connecting NoC initiator 1 to HBM channel 0
      dut.intel_noc_initiator_0.intel_noc_initiator_0.iniu_1.initiator_inst_0.register_if
	(dut.hbm_fp_0.hbm_fp_0.tniu_ch0_u0.target_0.target_inst_0.get_if(), INITIATOR1_CH0_BASE, 32'h4000_0000);

      // Connecting NoC initiator 1 to HBM channel 1
      dut.intel_noc_initiator_0.intel_noc_initiator_0.iniu_1.initiator_inst_0.register_if
	(dut.hbm_fp_0.hbm_fp_0.tniu_ch0_u1.target_0.target_inst_0.get_if(), INITIATOR1_CH1_BASE, 32'h4000_0000);

      // AXI Lite
      dut.intel_noc_initiator_0.intel_noc_initiator_0.iniu_0.initiator_inst_0.register_if
	(dut.hbm_fp_0.hbm_fp_0.tniu_ch0_ch1_sb.target_0.target_lite_inst_0.target_inst_0.get_if(), 44'h400_0000_0000, 44'h800_0000_0000);
   end

   initial
     begin
	$display("top_tb:Starting the simulation");
	$timeformat(-9, 2, "ns", 1);
	axi_reset_in_reset = 1;
	hbm_fp_0_cattrip_i_conduit = 0;
	hbm_fp_0_temp_i_conduit = {2{1'b0}};
	iopll_reset_reset = 1;
	noc_reset_in_reset = 1;

	repeat (20) @(posedge clk100_in_clk);
	iopll_reset_reset = 0;
	$display("top_tb: Waiting for hbm_local_cal_success");
	wait (hbm_local_cal_success_local_cal_success);
	$display("top_tb: Found hbm_local_cal_success");

	repeat (20) @(posedge clk100_in_clk);
	noc_reset_in_reset = 0;
	repeat (20) @(posedge clk100_in_clk);
	axi_reset_in_reset = 0;
	repeat (20) @(posedge clk100_in_clk);

	fork
	   begin
	      initiator0_sim;
	   end
	   begin
	      initiator1_sim;
	   end
	join

	repeat (20) @(posedge clk100_in_clk);

	 // Read data burst of length 8 from ch0 that was that was writen by Initiator 0.
	 initiator1.axi_read_burst
	   (
	    .address(INITIATOR1_CH0_BASE), 
	    .burst_length(8), 
	    .data(read_data)
	    );
	 for (int i=0; i<8; i++)
	   begin
	      if (read_data[i] == i)
		$display ( "top_tb:initiator1: %t: Read correct data 0x%h at address 0x%h",
			   $time, read_data[i], {{20{1'b0}},INITIATOR1_CH0_BASE} + (i * (DATA_WIDTH/8)));
	      else
		$display ( "top_tb:initiator1: %t: Error: Expected data 0x%h at address 0x%h, recieved 0x%h",
			   $time, i, {{20{1'b0}},INITIATOR1_CH0_BASE} + (i * (DATA_WIDTH/8)), read_data[i]);
	   end

	$display("top_tb: Simulation stopped at %t", $time);
	//$stop;
	$finish;

     end // initial begin


  axi_master_bfm_wrapper
    #(
      .AXI4_ADDRESS_WIDTH (64),
      .AXI4_RDATA_WIDTH   (256),
      .AXI4_WDATA_WIDTH   (256),
      .AXI4_ID_WIDTH      (7),
      .AXI4_USER_WIDTH    (8),
      .AXI4_REGION_MAP_SIZE(16)
      ) initiator0  
      (
       .bfm(dut.mgc_axi4_master_0.mgc_axi4_master_0),
       .verbose(1'b0)
       );

  axi_master_bfm_wrapper 
    #(
      .AXI4_ADDRESS_WIDTH (64),
      .AXI4_RDATA_WIDTH   (256),
      .AXI4_WDATA_WIDTH   (256),
      .AXI4_ID_WIDTH      (7),
      .AXI4_USER_WIDTH    (8),
      .AXI4_REGION_MAP_SIZE(16)
      ) initiator1
      (
       .bfm(dut.mgc_axi4_master_1.mgc_axi4_master_0),
       .verbose(1'b0)
       );

   my_sys dut
     (
      .axi_reset_in_reset                      (axi_reset_in_reset),
      .clk100_in_clk                           (clk100_in_clk),
      .hbm_fp_0_cattrip_i_conduit              (hbm_fp_0_cattrip_i_conduit),
      .hbm_fp_0_temp_i_conduit                 (hbm_fp_0_temp_i_conduit),
      .hbm_local_cal_success_local_cal_success (hbm_local_cal_success_local_cal_success),
      .hbm_local_cal_fail_local_cal_fail       (hbm_local_cal_fail_local_cal_fail),
      .iopll_locked_export                     (iopll_locked_export),
      .iopll_reset_reset                       (iopll_reset_reset),
      .noc_reset_in_reset                      (noc_reset_in_reset)
      );


   task initiator0_sim;
      logic [DATA_WIDTH-1:0] write_data [256];
      logic [DATA_WIDTH/8-1:0] write_strobe [256];
      logic [DATA_WIDTH-1:0]   read_data [256];
      logic [ADDR_WIDTH-1:0]   word_address;
      logic [ADDR_WIDTH-1:0]   address;
      logic [7:0] 	       byte_data;
      logic [31:0] 	       burst_length;
      begin
	 // Write repeating 8'h01 to address 0.
	 word_address = 0;
	 address = INITIATOR0_CH0_BASE + (word_address * (DATA_WIDTH/8));
	 byte_data = 8'h01;
	 initiator0.axi_write
	   (
	    .address(address),
	    .data({(DATA_WIDTH/8){byte_data}}),
	    .wstrobe({(DATA_WIDTH/8){1'b1}}),
	    .transaction_id(0)
	    );
         $display ( "top_tb:initiator0: %t: Wrote data 0x%h at address 0x%h", 
		    $time, {(DATA_WIDTH/8){byte_data}}, address);
	 
	 // Write repeating 8'h02 to next word address
	 word_address = 1;
	 address = INITIATOR0_CH0_BASE + (word_address * (DATA_WIDTH/8));
	 byte_data = 8'h02;
	 initiator0.axi_write
	   (
	    .address(address),
	    .data({(DATA_WIDTH/8){byte_data}}), 
	    .wstrobe({(DATA_WIDTH/8){1'b1}}),
	    .transaction_id(0)
	    );
         $display ( "top_tb:initiator0: %t: Wrote data 0x%h at address 0x%h", 
		    $time, {(DATA_WIDTH/8){byte_data}}, address);
	 
	 // Read data from address 0.
	 word_address = 0;
	 address = INITIATOR0_CH0_BASE + (word_address * (DATA_WIDTH/8));
	 byte_data = 8'h01;
	 initiator0.axi_read
	   (
	    .address(address),
	    .data(read_data[0])
	    );
	 if (read_data[0] == {(DATA_WIDTH/8){byte_data}})
           $display ( "top_tb:initiator0: %t: Read correct data 0x%h at address 0x%h", 
		      $time, {(DATA_WIDTH/8){byte_data}}, address);
	 else
           $display ( "top_tb:initiator0: %t: Error: Expected data 0x%h at address 0x%h, received 0x%h", 
		      $time,  {(DATA_WIDTH/8){byte_data}}, address, read_data[0]);
	 
	 // Read data from address 1.
	 word_address = 1;
	 address = INITIATOR0_CH0_BASE + (word_address * (DATA_WIDTH/8));
	 byte_data = 8'h02;
	 initiator0.axi_read
	   (
	    .address(address),
	    .data(read_data[0])
	    );
	 if (read_data[0] == {(DATA_WIDTH/8){byte_data}})
           $display ( "top_tb:initiator0: %t: Read correct data 0x%h at address 0x%h", 
		      $time, {(DATA_WIDTH/8){byte_data}}, address);
	 else
           $display ( "top_tb:initiator0: %t: Error: Expected data 0x%h at address 0x%h, received 0x%h", 
		      $time,  {(DATA_WIDTH/8){byte_data}}, address, read_data[0]);
	 
	 // Write data burst length of 8 to start address 0.
	 // Transaction ID is starting ID and will automatically increment for each 
	 // transaction in the burst.
	 word_address = 0;
	 address = INITIATOR0_CH0_BASE + (word_address * (DATA_WIDTH/8));
	 burst_length = 8;
	 for (logic[DATA_WIDTH-1:0] i=0; i<burst_length; i++)
	   begin
	      write_data[i] = i;
	      write_strobe[i] = {(DATA_WIDTH/8){1'b1}};
	   end
	 initiator0.axi_write_burst
	   (
	    .address(address), 
	    .data(write_data),
	    .wstrobe(write_strobe),
	    .transaction_id(0),
	    .burst_length(burst_length)
	    );
         $display ( "top_tb:initiator0: %t: Wrote burst of %d of incrementing data at address 0x%h", 
		    $time, burst_length, address);
	 
	 // Read data burst of length 8 from address 0.
	 word_address = 0;
	 address = INITIATOR0_CH0_BASE + (word_address * (DATA_WIDTH/8));
	 burst_length = 8;
	 initiator0.axi_read_burst
	   (
	    .address(address), 
	    .burst_length(burst_length), 
	    .data(read_data)
	    );
	 for (int i=0; i<burst_length; i++)
	   begin
	      if (read_data[i] == i)
		$display ( "top_tb:initiator0: %t: Read correct data 0x%h at address 0x%h", 
			   $time, read_data[i], address + (i * (DATA_WIDTH/8)));
	      else
		$display ( "top_tb:initiator0: %t: Error: Expected data 0x%h at address 0x%h, recieved 0x%h",
			   $time, i, address + (i * (DATA_WIDTH/8)), read_data[i]);
	   end
      end
   endtask // initiator0_sim
      
   task initiator1_sim;
      logic [DATA_WIDTH-1:0] write_data [256];
      logic [DATA_WIDTH/8-1:0] write_strobe [256];
      logic [DATA_WIDTH-1:0]   read_data [256];
      logic [ADDR_WIDTH-1:0]   word_address;
      logic [ADDR_WIDTH-1:0]   address;
      logic [7:0] 	       byte_data;
      logic [31:0] 	       burst_length;
      begin
	 // Write repeating 8'h03 to word address 33,544,432.
	 word_address = 0;
	 address = INITIATOR1_CH1_BASE + (word_address * (DATA_WIDTH/8));
	 byte_data = 8'h03;
	 initiator1.axi_write
	   (
	    .address(address),
	    .data({(DATA_WIDTH/8){byte_data}}),
	    .wstrobe({(DATA_WIDTH/8){1'b1}}),
	    .transaction_id(0)
	    );
         $display ( "top_tb:initiator1: %t: Wrote data 0x%h at address 0x%h", 
		    $time, {(DATA_WIDTH/8){byte_data}}, address);
	 
	 // Write repeating 8'h04 to next word address
	 word_address = 1;
	 address = INITIATOR1_CH1_BASE + (word_address * (DATA_WIDTH/8));
	 byte_data = 8'h04;
	 initiator1.axi_write
	   (
	    .address(address),
	    .data({(DATA_WIDTH/8){byte_data}}), 
	    .wstrobe({(DATA_WIDTH/8){1'b1}}),
	    .transaction_id(0)
	    );
         $display ( "top_tb:initiator1: %t: Wrote data 0x%h at address 0x%h", 
		    $time, {(DATA_WIDTH/8){byte_data}}, address);
	 
	 // Read data from address 0.
	 word_address = 0;
	 address = INITIATOR1_CH1_BASE + (word_address * (DATA_WIDTH/8));
	 byte_data = 8'h03;
	 initiator1.axi_read
	   (
	    .address(address),
	    .data(read_data[0])
	    );
	 if (read_data[0] == {(DATA_WIDTH/8){byte_data}})
           $display ( "top_tb:initiator1: %t: Read correct data 0x%h at address 0x%h", 
		      $time, {(DATA_WIDTH/8){byte_data}}, address);
	 else
           $display ( "top_tb:initiator1: %t: Error: Expected data 0x%h at address 0x%h, received 0x%h", 
		      $time,  {(DATA_WIDTH/8){byte_data}}, address, read_data[0]);
	 
	 // Read data from address 1.
	 word_address = 1;
	 address = INITIATOR1_CH1_BASE + (word_address * (DATA_WIDTH/8));
	 byte_data = 8'h04;
	 initiator1.axi_read
	   (
	    .address(address),
	    .data(read_data[0])
	    );
	 if (read_data[0] == {(DATA_WIDTH/8){byte_data}})
           $display ( "top_tb:initiator1: %t: Read correct data 0x%h at address 0x%h", 
		      $time, {(DATA_WIDTH/8){byte_data}}, address);
	 else
           $display ( "top_tb:initiator1: %t: Error: Expected data 0x%h at address 0x%h, received 0x%h", 
		      $time,  {(DATA_WIDTH/8){byte_data}}, address, read_data[0]);
	 
	 // Write data burst length of 8 to start address 0.
	 // Transaction ID is starting ID and will automatically increment for each 
	 // transaction in the burst.
	 word_address = 0;
	 address = INITIATOR1_CH1_BASE + (word_address * (DATA_WIDTH/8));
	 burst_length = 8;
	 for (logic[DATA_WIDTH-1:0] i=0; i<burst_length; i++)
	   begin
	      write_data[i] = i*2;
	      write_strobe[i] = {(DATA_WIDTH/8){1'b1}};
	   end
	 initiator1.axi_write_burst
	   (
	    .address(address),
	    .data(write_data),
	    .wstrobe(write_strobe),
	    .transaction_id(0),
	    .burst_length(burst_length)
	    );
	 $display ( "top_tb:initiator1: %t: Wrote burst of %d of incrementing even data at address 0x%h", 
		    $time, burst_length, address);
		    
	 // Read data burst of length 8 from address 0.
	 word_address = 0;
	 address = INITIATOR1_CH1_BASE + (word_address * (DATA_WIDTH/8));
	 burst_length = 8;
	 initiator1.axi_read_burst
	   (
	    .address(address),
	    .burst_length(burst_length), 
	    .data(read_data)
	    );
	 for (int i=0; i<burst_length; i++)
	   begin
	      if (read_data[i] == i*2)
		$display ( "top_tb:initiator1: %t: Read correct data 0x%h at address 0x%h", 
			   $time, read_data[i], address + (i * (DATA_WIDTH/8)));
	      else
		$display ( "top_tb:initiator1: %t: Error: Expected data 0x%h at address 0x%h, recieved 0x%h",
			   $time, i*2, address + (i * (DATA_WIDTH/8)), read_data[i]);
	   end
      end
   endtask // initiator1_sim

endmodule: top_tb
