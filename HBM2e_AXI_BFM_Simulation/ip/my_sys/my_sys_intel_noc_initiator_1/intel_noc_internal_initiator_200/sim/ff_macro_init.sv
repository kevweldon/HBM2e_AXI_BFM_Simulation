// (C) 2001-2023 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


module ff_macro_init # (
 parameter DATA_WIDTH = 256,
 parameter DIRECTION = "INPUT",
 parameter NUM_FLOPS = 1 // based on number of flops you need in 1 dir 
 ) (
 input logic clk,

 input [DATA_WIDTH -1:0] in_data ,

 output [DATA_WIDTH -1:0] out_data

);

    genvar i;

    generate
        if ((DIRECTION == "INPUT") && (NUM_FLOPS == 0)) begin : CORE_TO_PERIPHERY_DIRECT
            assign out_data = in_data;
        end

        else if (DIRECTION == "INPUT") begin : CORE_TO_PERIPHERY_REG
            (* altera_attribute = {"-name PRESERVE_REGISTER ON; -name FORCE_HYPER_REGISTER_FOR_CORE_PERIPHERY_TRANSFER ON; -name HYPER_REGISTER_DELAY_CHAIN 225"} *)
            reg [DATA_WIDTH-1:0] out_data_reg;
            reg [DATA_WIDTH-1:0] in_data_reg [NUM_FLOPS-1:0]; 
        
            assign in_data_reg[0] = in_data;

            for (i=0 ; i<NUM_FLOPS-1 ; i=i+1 ) begin : PIPELINE_REG
                always @(posedge clk) begin
                    in_data_reg[i+1] <= in_data_reg[i];
                end
            end

            always @(posedge clk) begin
                out_data_reg <= in_data_reg[NUM_FLOPS-1];
            end

            assign out_data = out_data_reg;
        
        end

        else begin : PERIPHERY_TO_CORE_REG
            (* altera_attribute = {"-name FORCE_HYPER_REGISTER_FOR_PERIPHERY_CORE_TRANSFER ON"} *)
            reg [DATA_WIDTH-1:0] in_data_reg [NUM_FLOPS:0];
        
            assign in_data_reg[0] = in_data;

            for (i=0 ; i<NUM_FLOPS ; i=i+1 ) begin : PIPELINE_REG
                always @(posedge clk) begin
                in_data_reg[i+1] <= in_data_reg[i];
                end
            end

            assign out_data = in_data_reg[NUM_FLOPS];
        end
    endgenerate 
    
endmodule
