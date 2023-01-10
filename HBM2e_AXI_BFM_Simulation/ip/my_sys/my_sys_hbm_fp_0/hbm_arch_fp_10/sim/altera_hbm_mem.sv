// (C) 2001-2022 Intel Corporation. All rights reserved.
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



`timescale 1 ps / 1 ps

module altera_hbm_mem
    # (parameter
        AXI_CHANNEL_ID       =  0,    
        HBM_MODEL_CHANNEL_ID = "A",
        HBM_MODEL_OPTIONS = 32'b0001,

        HBM_DEVICE       = "HBM_DEVICE_16GB_8HI",

        HBM_TDQSCK_PS     = 1000,
        HBM_TRCDRD        = 16,
        HBM_TRCDWR        = 14,
        HBM_TRTPL_BL4     = 1,
        HBM_TRP           = 1,
        HBM_TWR           = 0,

        HBM_CFG_CA_PAR_EN = 0,
        HBM_CFG_WR_PAR_EN = 0,
        HBM_CFG_RD_PAR_EN = 0,
        HBM_CFG_WR_DBI_EN = 0,
        HBM_CFG_RD_DBI_EN = 0,
        HBM_CFG_RL        = 0,
        HBM_CFG_WL        = 0,
        HBM_CFG_PL        = 0,
        HBM_CFG_MECC_EN   = 0,
        HBM_CFG_WR_DM_EN  = 0,

        HBM_C_WIDTH       = 8,     
        HBM_R_WIDTH       = 6,     
        HBM_DQ_WIDTH      = 128,
        HBM_DBI_WIDTH     = 16,
        HBM_DM_WIDTH      = 16,
        HBM_PAR_WIDTH     = 16,
        HBM_DERR_WIDTH    = 16,
        HBM_RDQS_T_WIDTH  = 16,
        HBM_RDQS_C_WIDTH  = 16,
        HBM_WDQS_T_WIDTH  = 16,
        HBM_WDQS_C_WIDTH  = 16,
        HBM_RD_WIDTH      = 8,

        MEM_DQS_TO_CLK_CAPTURE_DELAY = 100,
        MEM_CLK_TO_DQS_CAPTURE_DELAY = 100000
    )
    (
   input   reset_n,
   input   ck_t,
   input   ck_c,
   input   cke,
   input   [HBM_C_WIDTH - 1:0]      c,
   input   [HBM_R_WIDTH - 1:0]      r,
   inout   [HBM_DQ_WIDTH - 1:0]     dq,
   inout   [HBM_DBI_WIDTH - 1:0]    dbi,
   inout   [HBM_DM_WIDTH - 1:0]     dm,
   inout   [HBM_PAR_WIDTH - 1:0]    par,
   output  [HBM_DERR_WIDTH - 1:0]   derr,
   output  aerr,
   input   [HBM_WDQS_T_WIDTH - 1:0] wdqs_t,
   input   [HBM_WDQS_C_WIDTH - 1:0] wdqs_c,
   output  [HBM_RDQS_T_WIDTH - 1:0] rdqs_t,
   output  [HBM_RDQS_C_WIDTH - 1:0] rdqs_c,
   inout   [HBM_RD_WIDTH - 1:0]     rd,
   input   rr,
   input   rc
);

   localparam NUM_PSEUDO_CHANNELS = 2;

   // Simulation assertions
   // synthesis translate_off
   initial
   begin
      assert ((HBM_DEVICE == "HBM_DEVICE_4GB_4HI") || 
              (HBM_DEVICE == "HBM_DEVICE_8GB_4HI") ||
              (HBM_DEVICE == "HBM_DEVICE_8GB_8HI") ||
              (HBM_DEVICE == "HBM_DEVICE_16GB_8HI")) 
      else $error({"Illegal HBM device type: ",HBM_DEVICE});
      assert ((HBM_DEVICE != "HBM_DEVICE_8GB_4HI" && HBM_DEVICE != "HBM_DEVICE_16GB_8HI") ||
              (HBM_C_WIDTH == 9 && HBM_R_WIDTH == 7)) 
      else $error({"C width must be 9 and R width 7 for HBM devices based on 8Gb dies - device type is ",HBM_DEVICE});  
      assert (HBM_WDQS_T_WIDTH == HBM_WDQS_C_WIDTH && HBM_WDQS_T_WIDTH == HBM_RDQS_T_WIDTH && HBM_WDQS_T_WIDTH == HBM_RDQS_C_WIDTH) else $error("HBM_WDQS_T_WIDTH, HBM_WDQS_C_WIDTH, HBM_RDQS_T_WIDTH and HBM_RDQS_C_WIDTH must all be equal.");
      assert (HBM_PAR_WIDTH == HBM_DERR_WIDTH) else $error("HBM_PAR_WIDTH and HBM_DERR_WIDTH must be equal.");
      assert (HBM_DM_WIDTH == HBM_DBI_WIDTH) else $error("HBM_DM_WIDTH and HBM_DBI_WIDTH must be equal.");
   end
   // synthesis translate_on
   localparam HBM_DQS_WIDTH = HBM_WDQS_T_WIDTH;

   wire [NUM_PSEUDO_CHANNELS-1:0] aerr_per_pc;
   assign aerr = |aerr_per_pc;

   generate
   genvar pseudo_channel;
       for (pseudo_channel = 0; pseudo_channel < NUM_PSEUDO_CHANNELS; pseudo_channel = pseudo_channel + 1)
       begin : pseudo_channel_gen
           mem_pseudo_channel_model # (
               .AXI_CHANNEL_ID              (AXI_CHANNEL_ID),
               .HBM_MODEL_CHANNEL_ID        (HBM_MODEL_CHANNEL_ID),
               .HBM_MODEL_PSEUDOCHANNEL_ID  (pseudo_channel),
               .HBM_MODEL_OPTIONS           (HBM_MODEL_OPTIONS),

               .HBM_DEVICE                  (HBM_DEVICE),

               .HBM_TDQSCK_PS               (HBM_TDQSCK_PS),
               .HBM_TRCDRD                  (HBM_TRCDRD),
               .HBM_TRCDWR                  (HBM_TRCDWR),
               .HBM_TRTPL_BL4               (HBM_TRTPL_BL4),
               .HBM_TRP                     (HBM_TRP),
               .HBM_TWR                     (HBM_TWR),

               .HBM_CFG_CA_PAR_EN           (HBM_CFG_CA_PAR_EN),
               .HBM_CFG_WR_PAR_EN           (HBM_CFG_WR_PAR_EN),
               .HBM_CFG_RD_PAR_EN           (HBM_CFG_RD_PAR_EN),
               .HBM_CFG_WR_DBI_EN           (HBM_CFG_WR_DBI_EN),
               .HBM_CFG_RD_DBI_EN           (HBM_CFG_RD_DBI_EN),
               .HBM_CFG_RL                  (HBM_CFG_RL),
               .HBM_CFG_WL                  (HBM_CFG_WL),
               .HBM_CFG_PL                  (HBM_CFG_PL),
               .HBM_CFG_MECC_EN             (HBM_CFG_MECC_EN),
               .HBM_CFG_WR_DM_EN            (HBM_CFG_WR_DM_EN),

               .MEM_C_WIDTH                 (HBM_C_WIDTH),
               .MEM_R_WIDTH                 (HBM_R_WIDTH),
               .MEM_DQ_WIDTH                (HBM_DQ_WIDTH/NUM_PSEUDO_CHANNELS),
               .MEM_DM_WIDTH                (HBM_DM_WIDTH/NUM_PSEUDO_CHANNELS),
               .MEM_PAR_WIDTH               (HBM_PAR_WIDTH/NUM_PSEUDO_CHANNELS),
               .MEM_DQS_WIDTH               (HBM_DQS_WIDTH/NUM_PSEUDO_CHANNELS),

               .MEM_DQS_TO_CLK_CAPTURE_DELAY(MEM_DQS_TO_CLK_CAPTURE_DELAY),
               .MEM_CLK_TO_DQS_CAPTURE_DELAY(MEM_CLK_TO_DQS_CAPTURE_DELAY)
           ) pseudo_channel_inst (
               .reset_n     (reset_n),
               .mem_c       (c),
               .mem_r       (r),
               .mem_ck_t    (ck_t),
               .mem_ck_c    (ck_c),
               .mem_cke     (cke),
               .mem_dm      (dm[(HBM_DM_WIDTH/NUM_PSEUDO_CHANNELS*(pseudo_channel+1))-1:HBM_DM_WIDTH/NUM_PSEUDO_CHANNELS*pseudo_channel]),
               .mem_dq      (dq[(HBM_DQ_WIDTH/NUM_PSEUDO_CHANNELS*(pseudo_channel+1))-1:HBM_DQ_WIDTH/NUM_PSEUDO_CHANNELS*pseudo_channel]),
               .mem_wdqs_t  (wdqs_t[(HBM_DQS_WIDTH/NUM_PSEUDO_CHANNELS*(pseudo_channel+1))-1:HBM_DQS_WIDTH/NUM_PSEUDO_CHANNELS*pseudo_channel]),
               .mem_wdqs_c  (wdqs_c[(HBM_DQS_WIDTH/NUM_PSEUDO_CHANNELS*(pseudo_channel+1))-1:HBM_DQS_WIDTH/NUM_PSEUDO_CHANNELS*pseudo_channel]),
               .mem_rdqs_t  (rdqs_t[(HBM_DQS_WIDTH/NUM_PSEUDO_CHANNELS*(pseudo_channel+1))-1:HBM_DQS_WIDTH/NUM_PSEUDO_CHANNELS*pseudo_channel]),
               .mem_rdqs_c  (rdqs_c[(HBM_DQS_WIDTH/NUM_PSEUDO_CHANNELS*(pseudo_channel+1))-1:HBM_DQS_WIDTH/NUM_PSEUDO_CHANNELS*pseudo_channel]),
               .mem_derr    (derr[(HBM_PAR_WIDTH/NUM_PSEUDO_CHANNELS*(pseudo_channel+1))-1:HBM_PAR_WIDTH/NUM_PSEUDO_CHANNELS*pseudo_channel]),
               .mem_par     (par[(HBM_PAR_WIDTH/NUM_PSEUDO_CHANNELS*(pseudo_channel+1))-1:HBM_PAR_WIDTH/NUM_PSEUDO_CHANNELS*pseudo_channel]),
               .mem_dbi     (dbi[(HBM_DM_WIDTH/NUM_PSEUDO_CHANNELS*(pseudo_channel+1))-1:HBM_DM_WIDTH/NUM_PSEUDO_CHANNELS*pseudo_channel]),
               .mem_aerr    (aerr_per_pc[pseudo_channel])
           );
       end
   endgenerate
endmodule


module mem_pseudo_channel_model
    # (parameter
        AXI_CHANNEL_ID = 0,
        HBM_MODEL_CHANNEL_ID  = "A",
        HBM_MODEL_PSEUDOCHANNEL_ID = -1,
        HBM_MODEL_OPTIONS = 32'b0001,
        HBM_DEVICE        = "HBM_DEVICE_16GB_8HI",
        HBM_TDQSCK_PS     = 2500,
        HBM_TRCDRD        = 0,
        HBM_TRCDWR        = 0,
        HBM_TRTPL_BL4     = 0,
        HBM_TRP           = 0,
        HBM_TWR           = 1,
        MEM_C_WIDTH       = "",
        MEM_R_WIDTH       = 12,
        MEM_DQ_WIDTH      = 16,
        MEM_DM_WIDTH      = 16,
        MEM_PAR_WIDTH     = 1,
        MEM_DQS_WIDTH     = 2,
        HBM_CFG_CA_PAR_EN = 0,
        HBM_CFG_WR_PAR_EN = 0,
        HBM_CFG_RD_PAR_EN = 0,
        HBM_CFG_WR_DBI_EN = 0,
        HBM_CFG_RD_DBI_EN = 0,
        HBM_CFG_RL        = 0,
        HBM_CFG_WL        = 0,
        HBM_CFG_PL        = 0,
        HBM_CFG_MECC_EN   = 0,
        HBM_CFG_WR_DM_EN  = 0,
        MEM_DQS_TO_CLK_CAPTURE_DELAY = 0,
        MEM_CLK_TO_DQS_CAPTURE_DELAY = 0
    )
    (
   input        [MEM_R_WIDTH-1:0]   mem_r,
   input        [MEM_C_WIDTH-1:0]   mem_c,
   input                            reset_n,
   input                            mem_ck_t,
   input                            mem_ck_c,
   input                            mem_cke,
   inout        [MEM_DM_WIDTH-1:0]  mem_dm,
   inout        [MEM_DM_WIDTH-1:0]  mem_dbi,
   inout        [MEM_DQ_WIDTH-1:0]  mem_dq,
   input        [MEM_DQS_WIDTH-1:0] mem_wdqs_t,
   input        [MEM_DQS_WIDTH-1:0] mem_wdqs_c,
   output       [MEM_DQS_WIDTH-1:0] mem_rdqs_t,
   output       [MEM_DQS_WIDTH-1:0] mem_rdqs_c,
   output logic [MEM_PAR_WIDTH-1:0] mem_derr,
   inout        [MEM_PAR_WIDTH-1:0] mem_par,
   output logic                     mem_aerr
);

localparam HBM_MODEL_VERBOSE     = (HBM_MODEL_OPTIONS & 32'h00000001) ? 1 : 0;
localparam HBM_MODEL_WR_PAR_DIAG = (HBM_MODEL_OPTIONS & 32'h00000002) ? 1 : 0;
localparam HBM_MODEL_RD_PAR_DIAG = (HBM_MODEL_OPTIONS & 32'h00000004) ? 1 : 0;
localparam HBM_MODEL_SBE_DIAG    = (HBM_MODEL_OPTIONS & 32'h00000008) ? 1 : 0;

localparam EFFECTIVE_BA_WIDTH = ((HBM_DEVICE == "HBM_DEVICE_4GB_4HI") || (HBM_DEVICE == "HBM_DEVICE_8GB_4HI")) ? 4 : 5;
localparam RA_WIDTH = ((HBM_DEVICE == "HBM_DEVICE_4GB_4HI") || (HBM_DEVICE == "HBM_DEVICE_8GB_8HI")) ? 14 : 15; 
localparam CA_WIDTH = 6;

localparam NUM_BANKS          = 2**EFFECTIVE_BA_WIDTH;
localparam MEM_DQS_GROUP_SIZE = MEM_DQ_WIDTH / MEM_DQS_WIDTH;
localparam MEM_DM_GROUP_SIZE  = MEM_DQ_WIDTH / MEM_DM_WIDTH;
localparam DM_PER_DQS         = MEM_DQS_GROUP_SIZE / MEM_DM_GROUP_SIZE;
localparam PORT_MECC_DQ_WIDTH = MEM_DQ_WIDTH + MEM_DM_WIDTH;
localparam DISABLE_NOP_DISPLAY = 1;
localparam CHECK_VIOLATIONS    = 1;
localparam MAX_LATENCY         = 50;
localparam MAX_BURST           = 8;
   
localparam UNUSED_ADDR_SHIFT   = 1;
localparam PAR_SIZE_IN         = MEM_DM_WIDTH/MEM_DQS_WIDTH;


wire [MEM_DQS_WIDTH - 1:0] mem_wdqs_t_shifted;
wire [MEM_DQS_WIDTH - 1:0] mem_wdqs_c_shifted;

reg [MEM_R_WIDTH-1:0] mem_r_pos, mem_r_neg;
reg [MEM_R_WIDTH-1:0] mem_r_pos_r, mem_r_neg_r;
reg [MEM_C_WIDTH-1:0] mem_c_pos, mem_c_neg;

wire [MEM_DQ_WIDTH-1:0] mem_dq_write_dbi;
wire [MEM_DM_WIDTH-1:0] mem_dbi_read;

typedef enum logic[3:0] {
    OPCODE_NOP          = 4'b1111,
    OPCODE_ACTIVATE     = 4'b101x,
    OPCODE_PRECHARGE    = 4'b1110,
    OPCODE_REFRESH      = 4'b1001,

    OPCODE_READ         = 4'b1101,
    OPCODE_WRITE        = 4'b1100,
    OPCODE_MRS          = 4'b1000
} OPCODE_TYPE;

typedef enum {
    DDR_BURST_TYPE_BL2,
    DDR_BURST_TYPE_BL4
} DDR_BURST_TYPE;

typedef enum {
    DDR_AL_TYPE_ZERO,
    DDR_AL_TYPE_CL_MINUS_1,
    DDR_AL_TYPE_CL_MINUS_2
} DDR_AL_TYPE;

DDR_BURST_TYPE burst_type;
int rl;
int wl;
reg [1:0] pl;
reg [4:0] trp;
int dm_en;
int ecc_en;
int ca_par_en;
int wr_par_en;
int rd_par_en;
int wr_dbi_en;
int rd_dbi_en;
DDR_AL_TYPE al_type;

int tRTP_cycles = HBM_TRTPL_BL4;

int clock_cycle;
int compare_latency;
int compare_read_latency[$];
int compare_write_latency[$];
int last_all_read_cmd_cycle;
int last_all_write_cmd_cycle;

reg clock_stable;

typedef struct {
    bit [RA_WIDTH - 1:0] opened_row;
    bit row_is_active; 
    time last_ref_time;
    int last_ref_cycle;
    int last_activate_cycle;
    int last_precharge_cycle;
    int last_write_cmd_cycle;
    int last_write_access_cycle;
    int last_read_cmd_cycle;
    int last_read_access_cycle;
    int last_mrs_cmd_cycle;
} bank_struct;

bit [MEM_DQ_WIDTH - 1:0] mem_data[*];
bit [PORT_MECC_DQ_WIDTH - 1:0] mecc_mem_data[*];
bank_struct banks [NUM_BANKS - 1:0];

typedef enum {
    DDR_CMD_TYPE_PRECHARGE,
    DDR_CMD_TYPE_ACTIVATE,
    DDR_CMD_TYPE_WRITE,
    DDR_CMD_TYPE_READ,
    DDR_CMD_TYPE_REFRESH,
    DDR_CMD_TYPE_NOP,
    DDR_CMD_TYPE_MRS
} DDR_CMD_TYPE;

typedef struct {
    DDR_CMD_TYPE cmd_type;
    int word_count;
    int burst_length;
    bit [EFFECTIVE_BA_WIDTH - 1:0] bank;
    bit [RA_WIDTH - 1:0]           address;
    bit [RA_WIDTH - 1:0]           row;
    bit [3:0] opcode;
} command_struct;

typedef enum {
   RTT_DISABLED,
   RTT_RZQ_2,
   RTT_RZQ_3,
   RTT_RZQ_4,
   RTT_RZQ_5,
   RTT_RZQ_6,
   RTT_RZQ_7,
   RTT_RZQ_8,
   RTT_RZQ_9,
   RTT_RZQ_10,
   RTT_RZQ_11,
   RTT_RZQ_12,
   RTT_RESERVED,
   RTT_UNKNOWN
} RTT_TERM_TYPE;

typedef struct {
   RTT_TERM_TYPE rtt_nom;
   RTT_TERM_TYPE rtt_drv;
   RTT_TERM_TYPE rtt_wr;
} rtt_struct;


DDR_CMD_TYPE write_command_queue[$];
int write_word_count_queue[$];
int write_burst_length_queue[$];
bit [CA_WIDTH - 1:0] write_address_queue[$];
bit [RA_WIDTH - 1:0] write_row_queue[$];
bit [EFFECTIVE_BA_WIDTH - 1:0] write_bank_queue[$];

DDR_CMD_TYPE read_command_queue[$];
int read_word_count_queue[$];
int read_burst_length_queue[$];
bit [CA_WIDTH - 1:0] read_address_queue[$];
bit [RA_WIDTH - 1:0] read_row_queue[$];
bit [EFFECTIVE_BA_WIDTH - 1:0] read_bank_queue[$];

DDR_CMD_TYPE precharge_command_queue[$];
bit [EFFECTIVE_BA_WIDTH - 1:0] precharge_bank_queue[$];
DDR_CMD_TYPE rd_precharge_command_queue[$];
bit [EFFECTIVE_BA_WIDTH - 1:0] rd_precharge_bank_queue[$];

DDR_CMD_TYPE activate_command_queue[$];
bit [EFFECTIVE_BA_WIDTH-1:0] activate_bank_queue[$];
bit [RA_WIDTH-1:0] activate_row_queue[$];

command_struct active_command;
command_struct new_row_command;
command_struct new_col_command;
command_struct precharge_command;
command_struct rd_precharge_command;
command_struct activate_command;
rtt_struct rtt_values;

bit [2 * MAX_LATENCY + 1:0] read_command_pipeline;
bit [2 * MAX_LATENCY + 1:0] write_command_pipeline;
bit [2 * MAX_LATENCY + 1:0] precharge_command_pipeline;
bit [2 * MAX_LATENCY + 1:0] rd_precharge_command_pipeline;
bit [2 * MAX_LATENCY + 1:0] activate_command_pipeline;
bit [2 * MAX_LATENCY + 1:0] activate_impre_command_pipeline;
bit [2 * MAX_LATENCY + 1:0] bst_command_pipeline;

reg [MEM_DQ_WIDTH - 1:0]    mem_dq_int;
reg [MEM_DQS_WIDTH- 1:0]    mem_par_int;
reg [MEM_DM_WIDTH - 1:0]    mem_cb_int;
reg [MEM_DQ_WIDTH - 1:0]    mem_dq_captured;
reg [MEM_DM_WIDTH - 1:0]    mem_dm_captured;
bit mem_dq_en;
bit mem_rdqs_en;
bit mem_rdqs_preamble;
wire [MEM_DQ_WIDTH - 1:0] full_mask;

time mem_wdqs_t_time[MEM_DQS_WIDTH];
time mem_ck_time;

reg [7:0] mode_reg;
logic [31:0]imPRE;

function automatic int min;
    input int a;
    input int b;
    int result = (a < b) ? a : b;
    return result;
endfunction

task automatic initialize_db;
    while (write_command_queue.size() > 0)
        write_command_queue.delete(0);
    while (write_word_count_queue.size() > 0)
        write_word_count_queue.delete(0);
    while (write_burst_length_queue.size() > 0)
        write_burst_length_queue.delete(0);
    while (write_address_queue.size() > 0)
        write_address_queue.delete(0);
    while (write_row_queue.size() > 0)
        write_row_queue.delete(0);
    while (write_bank_queue.size() > 0)
        write_bank_queue.delete(0);

    while (read_command_queue.size() > 0)
        read_command_queue.delete(0);
    while (read_word_count_queue.size() > 0)
        read_word_count_queue.delete(0);
    while (read_burst_length_queue.size() > 0)
        read_burst_length_queue.delete(0);
    while (read_address_queue.size() > 0)
        read_address_queue.delete(0);
    while (read_row_queue.size() > 0)
        read_row_queue.delete(0);
    while (read_bank_queue.size() > 0)
        read_bank_queue.delete(0);

    while (precharge_command_queue.size() > 0)
        precharge_command_queue.delete(0);
    while (precharge_bank_queue.size() > 0)
        precharge_bank_queue.delete(0);

    while (activate_command_queue.size() > 0)
        activate_command_queue.delete(0);
    while (activate_bank_queue.size() > 0)
        activate_bank_queue.delete(0);
    while (activate_row_queue.size() > 0)
        activate_row_queue.delete(0);

    mem_data.delete();
    mecc_mem_data.delete();
endtask

task automatic set_rl_by_mrs (input bit [4:0] code);
   rl = code + 5'h2;
   if (HBM_MODEL_VERBOSE) begin
      $display("   Read LATENCY set to : %0d", get_read_latency());
   end
endtask

task automatic set_wl_by_mrs (input bit [2:0] code);
   wl = code + 3'h1;
   if (HBM_MODEL_VERBOSE) begin
      $display("   Write LATENCY set to : %0d", get_write_latency());
   end
endtask

task automatic set_ca_par_by_mrs (input bit code);
   ca_par_en = code;
   if (HBM_MODEL_VERBOSE) begin
      if (code) $display("   Enable Address, Command Bus Parity for Row, Column Bus   ");
      else $display("   Disable Address, Command Bus Parity for Row, Column Bus   ");
   end
endtask

task automatic set_wr_par_by_mrs (input bit code);
   wr_par_en = code;
   if (HBM_MODEL_VERBOSE) begin
      if (code) $display("   Enable DQ bus Write Parity   ");
      else $display("   Disable DQ bus Write Parity   ");
   end
endtask

task automatic set_rd_par_by_mrs (input bit code);
   rd_par_en = code;
   if (HBM_MODEL_VERBOSE) begin
      if (code) $display("   Enable DQ bus Read Parity   ");
      else $display("   Disable DQ bus Read Parity   ");
   end
endtask

task automatic set_wr_dbi_by_mrs (input bit code);
   wr_dbi_en = code;
   if (HBM_MODEL_VERBOSE) begin
      if (code) $display("   Enable Write DBIac   ");
      else $display("   Disable Write DBIac   ");
   end
endtask

task automatic set_rd_dbi_by_mrs (input bit code);
   rd_dbi_en = code;
   if (HBM_MODEL_VERBOSE) begin
      if (code) $display("   Enable Read DBIac   ");
      else $display("   Disable Read DBIac   ");
   end
endtask

task automatic set_dm_by_mrs (input bit code);
   dm_en = !code;
   if (HBM_MODEL_VERBOSE) begin
      if (!code) $display("   Enable Write Data Mask   ");
      else $display("   Disable Write Data Mask   ");
   end
endtask

task automatic set_ecc_by_mrs (input bit code);
   ecc_en = code;
   if (HBM_MODEL_VERBOSE) begin
      if (code) $display("   Enable ECC   ");
      else $display("   Disable ECC   ");
   end
endtask


task automatic set_pl_by_mrs (input bit [1:0] code);
   pl = code;
   if (HBM_MODEL_VERBOSE) begin
      $display("   Parity Latency set to : %0d", code);
   end
endtask

task automatic set_trp_by_mrs (input bit [4:0] code);
   trp = code;
   if (HBM_MODEL_VERBOSE) begin
      $display("   Set imPRE tRP value : %0d", code);
   end
endtask

function automatic int get_additive_latency;
    return 0;
endfunction

function automatic int get_read_latency;
    int read_latency = rl + get_additive_latency();
    return read_latency;
endfunction

function automatic int get_write_latency;
    return wl;
endfunction

function automatic int get_precharge_latency;
    return tRTP_cycles + get_additive_latency();
endfunction

task automatic reset_dll (input bit code);
    if(code == 1'b1) begin
        if (HBM_MODEL_VERBOSE)
            $display("   Resetting DLL");
    end
endtask

task automatic set_burst_type (input bit burst_mode);
   if (burst_mode) begin
      if (HBM_MODEL_VERBOSE)
         $display("   Setting burst length Fixed BL4");
      burst_type = DDR_BURST_TYPE_BL4;
   end else begin
      if (HBM_MODEL_VERBOSE)
         $display("   Setting burst length Fixed BL2");
      burst_type = DDR_BURST_TYPE_BL2;
   end
endtask

task automatic display_prefix;
    $write("[%0t] [HBM %0s[%0d] AXI ch%0d_u%0d]:  ", $time, HBM_MODEL_CHANNEL_ID, HBM_MODEL_PSEUDOCHANNEL_ID, AXI_CHANNEL_ID, HBM_MODEL_PSEUDOCHANNEL_ID);
endtask

task automatic cmd_nop;
    if (HBM_MODEL_VERBOSE && !DISABLE_NOP_DISPLAY) begin
        display_prefix();
        $write("NOP Command\n");
    end
endtask

task automatic cmd_set_activate;

    activate_command_queue.push_back(DDR_CMD_TYPE_ACTIVATE);
    activate_bank_queue.push_back(new_row_command.bank);
    activate_row_queue.push_back(new_row_command.address);
    if (banks[new_row_command.bank].row_is_active) begin
       activate_impre_command_pipeline[ 2 * (HBM_TRP-1) ] = 1;
       if (HBM_MODEL_VERBOSE) begin
           display_prefix();
           $write("ACTIVATE (imPRE) - BANK [ %0d ] - ROW [ %0h ]\n", new_row_command.bank, new_row_command.address);
       end
    end else begin
       activate_command_pipeline[ 0 ] = 1;
       if (HBM_MODEL_VERBOSE) begin
           display_prefix();
           $write("ACTIVATE - BANK [ %0d ] - ROW [ %0h ]\n", new_row_command.bank, new_row_command.address);
       end
    end
    banks[new_row_command.bank].last_activate_cycle = clock_cycle;
endtask

task automatic cmd_activate(bit [EFFECTIVE_BA_WIDTH-1:0] bank, bit [RA_WIDTH-1:0] address);
    banks[bank].opened_row = address;
    banks[bank].row_is_active = 1'b1;
endtask

task automatic cmd_precharge(bit [EFFECTIVE_BA_WIDTH-1:0] bank, bit all_banks);
    if (HBM_MODEL_VERBOSE) begin
        display_prefix();
        if(all_banks)
            $write("PRECHARGE - ALL BANKS\n");
        else
            $write("PRECHARGE - BANK [ %0d ]\n", bank);
    end
    if (all_banks) begin
       for (int b = 0; b < NUM_BANKS; b++)
       begin
          banks[b].last_precharge_cycle = clock_cycle;
          banks[b].row_is_active = 1'b0;
       end
    end else begin
       banks[bank].last_precharge_cycle = clock_cycle;
       banks[bank].row_is_active = 1'b0;
    end

endtask

task automatic cmd_mrs;
    if (HBM_MODEL_VERBOSE) begin
        display_prefix();
        $write("MRS Command - MRS [ %0d ] -> %0h\n", new_col_command.address[3:0], mode_reg);
    end
    case(new_col_command.address[3:0])
       4'h0 : begin
          $write("WARNING: Set test mode by MRS%h is not supported\n", new_col_command.address[3:0]);
          set_ca_par_by_mrs(mode_reg[6]);
          set_wr_par_by_mrs(mode_reg[5]);
          set_rd_par_by_mrs(mode_reg[4]);
          $write("WARNING: Set TCSR by MRS%h is not supported\n", new_col_command.address[3:0]);
          set_wr_dbi_by_mrs(mode_reg[1]);
          set_rd_dbi_by_mrs(mode_reg[0]);
       end
       4'h1 : $write("WARNING: MRS%h is not supported\n", new_col_command.address[3:0]);
       4'h2 : begin
          set_rl_by_mrs(mode_reg[7:3]);
          set_wl_by_mrs(mode_reg[2:0]);
       end
       4'h3 : set_burst_type(mode_reg[7]);
       4'h4 : begin
           set_pl_by_mrs(mode_reg[3:2]);
           set_dm_by_mrs(mode_reg[1]);
           set_ecc_by_mrs(mode_reg[0]);
       end
       4'h6 : set_trp_by_mrs (mode_reg[7:3]);
       default : $write("WARNING: MRS%h is not supported\n", new_col_command.address[3:0]);
    endcase
    banks[new_col_command.bank].last_mrs_cmd_cycle = clock_cycle;
endtask

task automatic cmd_refresh(bit [EFFECTIVE_BA_WIDTH-1:0] bank, bit all_banks);
    if (HBM_MODEL_VERBOSE) begin
        display_prefix();
        if(all_banks)
            $write("REFRESH - ALL BANKS\n");
        else
            $write("REFRESH - BANK [ %0d ]\n", bank);
    end

    if (all_banks)
        begin
            for (int b = 0; b < NUM_BANKS; b++)
                begin
                    refresh_bank(b);
                end
        end
    else
        refresh_bank(bank);
endtask

task automatic cmd_read;
    int read_latency = get_read_latency();
    int precharge_latency = get_precharge_latency();

    if (HBM_MODEL_VERBOSE) begin
        display_prefix;
        if(mem_c_pos[3])
            $write("READ with AP (BL%0d) - BANK [ %0d ] - COL [ %0h ]\n", new_col_command.burst_length, new_col_command.bank, new_col_command.address);
        else
            $write("READ (BL%0d) - BANK [ %0d ] - COL [ %0h ]\n", new_col_command.burst_length, new_col_command.bank, new_col_command.address);
    end

    new_col_command.word_count = 0;
    new_col_command.row = banks[new_col_command.bank].opened_row;
    read_command_queue.push_back(new_col_command.cmd_type);
    read_word_count_queue.push_back(new_col_command.word_count);
    read_burst_length_queue.push_back(new_col_command.burst_length);
    read_address_queue.push_back(new_col_command.address);
    read_row_queue.push_back(new_col_command.row);
    read_bank_queue.push_back(new_col_command.bank);
    read_command_pipeline[ 2 * (read_latency-1) ] = 1;
    banks[new_col_command.bank].last_read_cmd_cycle = clock_cycle;
    last_all_read_cmd_cycle = clock_cycle;

    if(mem_c_pos[3]) begin
        rd_precharge_command_queue.push_back(DDR_CMD_TYPE_PRECHARGE);
        rd_precharge_bank_queue.push_back(new_col_command.bank);
        rd_precharge_command_pipeline[ 2 * precharge_latency ] = 1;
    end
endtask

task automatic cmd_write;
    int write_latency = get_write_latency();

    if (HBM_MODEL_VERBOSE) begin
        display_prefix();
        if(mem_c_pos[3])
            $write("WRITE with AP (BL%0d) - BANK [ %0d ] - COL [ %0h ]\n", new_col_command.burst_length, new_col_command.bank, new_col_command.address);
        else
            $write("WRITE (BL%0d) - BANK [ %0d ] - COL [ %0h ]\n", new_col_command.burst_length, new_col_command.bank, new_col_command.address);
    end

    new_col_command.word_count = 0;
    new_col_command.row = banks[new_col_command.bank].opened_row;
    write_command_queue.push_back(new_col_command.cmd_type);
    write_word_count_queue.push_back(new_col_command.word_count);
    write_burst_length_queue.push_back(new_col_command.burst_length);
    write_address_queue.push_back(new_col_command.address);
    write_row_queue.push_back(new_col_command.row);
    write_bank_queue.push_back(new_col_command.bank);
    write_command_pipeline[2 * (write_latency-1)] = 1'b1;
    banks[new_col_command.bank].last_write_cmd_cycle = clock_cycle;
    last_all_write_cmd_cycle = clock_cycle;

    if(mem_c_pos[3]) begin
        precharge_command_queue.push_back(DDR_CMD_TYPE_PRECHARGE);
        precharge_bank_queue.push_back(new_col_command.bank);
        precharge_command_pipeline[ 2 * (HBM_CFG_WL + new_col_command.burst_length/2 + HBM_TWR) ] = 1;
    end
endtask

task automatic refresh_bank(input int bank_num);
    if (HBM_MODEL_VERBOSE) begin
        display_prefix();
        $write("Refreshing bank %0d\n", bank_num);
    end
    banks[bank_num].last_ref_time = $time;
    banks[bank_num].last_ref_cycle = clock_cycle;
endtask

task automatic init_banks;
    int i;
    for (i = 0; i < NUM_BANKS; i++) begin
        if (HBM_MODEL_VERBOSE) begin
            display_prefix();
            $write("Initializing bank %0d\n", i);
        end
        banks[i].opened_row = '0;
        banks[i].row_is_active = '0;
        banks[i].last_ref_time = 0;
        banks[i].last_ref_cycle = 0;
        banks[i].last_activate_cycle = 0;
        banks[i].last_precharge_cycle = 0;
        banks[i].last_read_cmd_cycle = 0;
        banks[i].last_read_access_cycle = 0;
        banks[i].last_write_cmd_cycle = 0;
        banks[i].last_write_access_cycle = 0;
    end
endtask

task automatic check_violations;

    /* **** *
     * tRCD *
     * **** */

    if(new_col_command.cmd_type == DDR_CMD_TYPE_READ) begin
        if(banks[new_col_command.bank].last_activate_cycle > banks[new_col_command.bank].last_read_cmd_cycle + get_additive_latency() - HBM_TRCDRD - imPRE) begin
            display_prefix();
            $write  ("ERROR: tRCD violation (READ) on bank %0d @ cycle %0d", new_col_command.bank, clock_cycle);
            $display("    tRCDRD = %0d", HBM_TRCDRD);
            $display("    Last ACTIVATE @ %0d", banks[new_col_command.bank].last_activate_cycle);
            $display("    Last READ CMD @ %0d", banks[new_col_command.bank].last_read_cmd_cycle);
            $finish(1);
        end
    end
    if(new_col_command.cmd_type == DDR_CMD_TYPE_WRITE) begin
        if(banks[new_col_command.bank].last_activate_cycle > banks[new_col_command.bank].last_write_cmd_cycle + get_additive_latency() - HBM_TRCDWR - imPRE) begin
            display_prefix();
            $write  ("ERROR: tRCD violation (WRITE) on bank %0d @ cycle %0d", new_col_command.bank, clock_cycle);
            $display("    tRCDWR = %0d", HBM_TRCDWR);
            $display("    Last ACTIVATE @ %0d", banks[new_col_command.bank].last_activate_cycle);
            $display("    Last WRITE CMD @ %0d", banks[new_col_command.bank].last_write_cmd_cycle);
            $finish(1);
        end
    end
    if(new_col_command.cmd_type == DDR_CMD_TYPE_MRS) begin
        if(banks[new_col_command.bank].last_precharge_cycle > banks[new_col_command.bank].last_mrs_cmd_cycle + get_additive_latency() - imPRE) begin
            display_prefix();
            $write  ("ERROR: tRP violation (MRS) on bank %0d @ cycle %0d", new_col_command.bank, clock_cycle);
            $display("    tRP = %0d", trp);
            $display("    Last PRECHARGE @ %0d", banks[new_col_command.bank].last_precharge_cycle);
            $display("    Last MRS CMD @ %0d", banks[new_col_command.bank].last_mrs_cmd_cycle);
            $finish(1);
        end
    end
endtask

task write_memory(
    input command_struct command,
    input [MEM_DQ_WIDTH - 1:0] write_data,
    input [MEM_DQ_WIDTH - 1:0] data_mask);

    bit [EFFECTIVE_BA_WIDTH - 1:0] bank_address;
    bit [RA_WIDTH - 1:0] row_address;
    bit [CA_WIDTH - 1:0] col_address;
    bit [EFFECTIVE_BA_WIDTH + RA_WIDTH + CA_WIDTH + UNUSED_ADDR_SHIFT - 1 : 0] address;
    bit [MEM_DQ_WIDTH - 1:0] masked_data;

    integer i;

    bank_address = command.bank;
    row_address = command.row;
    col_address = command.address;
    address = {bank_address, row_address, col_address, {UNUSED_ADDR_SHIFT{1'b0}}} + command.word_count;

    for(i = 0; i < MEM_DQ_WIDTH; i = i + 1) begin
        if (data_mask[i] !== 0 && data_mask[i] !== 1)
            masked_data[i] = 'x;
        else if (data_mask[i])
        begin
            if (mem_data.exists(address))
                masked_data[i] = mem_data[address][i];
            else
                masked_data[i] = 'x;
        end
        else
            masked_data[i] = write_data[i];
    end

    if (HBM_MODEL_VERBOSE) begin
        display_prefix();
        $write("Writing data %h (%h/%h) @ %0h (BRC=%0d/%0h/%0h ) burst %0d\n", 
                 masked_data, write_data, ~data_mask, address, bank_address, row_address, col_address, command.word_count);
    end
    mem_data[address] = masked_data;
    banks[bank_address].last_write_access_cycle = clock_cycle;
endtask

task write_memory_cb(
    input command_struct command,
    input [MEM_DQ_WIDTH - 1:0] write_data,
    input [MEM_DM_WIDTH - 1:0] ecc_cb);

    bit [EFFECTIVE_BA_WIDTH - 1:0] bank_address;
    bit [RA_WIDTH - 1:0] row_address;
    bit [CA_WIDTH - 1:0] col_address;
    bit [EFFECTIVE_BA_WIDTH + RA_WIDTH + CA_WIDTH + UNUSED_ADDR_SHIFT - 1 : 0] address;

    bank_address = command.bank;
    row_address = command.row;
    col_address = command.address;
    address = {bank_address, row_address, col_address, {UNUSED_ADDR_SHIFT{1'b0}}} + command.word_count;

    if (HBM_MODEL_VERBOSE) begin
        display_prefix();
        $write("Writing data %h with ECC_CB %h @ %0h (BRC=%0d/%0h/%0h ) burst %0d\n",
                 write_data,ecc_cb, address, bank_address, row_address, col_address, command.word_count);
    end
    mecc_mem_data[address] = {write_data,ecc_cb};
    banks[bank_address].last_write_access_cycle = clock_cycle;
endtask

task read_memory(
    input command_struct command,
    output [MEM_DQ_WIDTH - 1:0] read_data);

    bit [EFFECTIVE_BA_WIDTH - 1:0] bank_address;
    bit [RA_WIDTH - 1:0] row_address;
    bit [CA_WIDTH - 1:0] col_address;
    bit [EFFECTIVE_BA_WIDTH + RA_WIDTH + CA_WIDTH + UNUSED_ADDR_SHIFT - 1 : 0] address;

    bank_address = command.bank;
    row_address = command.row;
    col_address = command.address;
    address = {bank_address, row_address, col_address, {UNUSED_ADDR_SHIFT{1'b0}}} + command.word_count;


    if (mem_data.exists(address)) begin
        read_data = mem_data[address];        
        if (HBM_MODEL_VERBOSE) begin
            display_prefix();
            $write("Reading data %h @ %0h (BRC=%0d/%0h/%0h ) burst %0d\n",
                     read_data, address, bank_address, row_address, col_address, command.word_count);
        end
    end
    else begin
        if (HBM_MODEL_VERBOSE) begin
            display_prefix();
            $write("WARNING: Attempting to read from uninitialized location @ %0h (BRC=%0d/%0h/%0h) burst %0d\n",
                     address, bank_address, row_address, col_address, command.word_count);
        end
        read_data = 'X;
    end

    banks[bank_address].last_read_access_cycle = clock_cycle;
endtask

task read_memory_cb(
    input command_struct command,
    output [MEM_DQ_WIDTH - 1:0] read_data,
    output [MEM_DM_WIDTH - 1:0] ecc_cb);

    bit [EFFECTIVE_BA_WIDTH - 1:0] bank_address;
    bit [RA_WIDTH - 1:0] row_address;
    bit [CA_WIDTH - 1:0] col_address;
    bit [EFFECTIVE_BA_WIDTH + RA_WIDTH + CA_WIDTH + UNUSED_ADDR_SHIFT - 1 : 0] address;

    bank_address = command.bank;
    row_address = command.row;
    col_address = command.address;
    address = {bank_address, row_address, col_address, {UNUSED_ADDR_SHIFT{1'b0}}} + command.word_count;


    if (mecc_mem_data.exists(address)) begin
        {read_data,ecc_cb} = mecc_mem_data[address];
        if (HBM_MODEL_VERBOSE) begin
            display_prefix();
            $write("Reading data %h @ %0h (BRC=%0d/%0h/%0h ) burst %0d\n",
                     read_data, address, bank_address, row_address, col_address, command.word_count);
        end
    end
    else begin
        if (HBM_MODEL_VERBOSE) begin
            display_prefix();
            $write("WARNING: Attempting to read from uninitialized location @ %0h (BRC=%0d/%0h/%0h) burst %0d\n",
                     address, bank_address, row_address, col_address, command.word_count);
        end
        read_data = 'X;
        ecc_cb ='X;
    end

    banks[bank_address].last_read_access_cycle = clock_cycle;
endtask

logic mem_ck_diff;
always @(posedge mem_ck_t)
begin
    if (mem_cke == 1'b1)
    begin
        #8 mem_ck_diff <= mem_ck_t;
    end
end

always @(posedge mem_ck_c)
begin
    if (mem_cke == 1'b1)
    begin
        #8 mem_ck_diff <= ~mem_ck_c;
    end
end

logic   prev_cycle_rd;
logic   ddr_cmd_type_activate_r;
initial begin
    int i;

    $display("Intel Generic HBM Memory Model");

    clock_cycle = 0;
    clock_stable = 1'b0;
    prev_cycle_rd = 1'b0;
    initialize_db;

    rl = HBM_CFG_RL;
    wl = HBM_CFG_WL;
    set_burst_type(1'b1);
    init_banks();

    pl  = HBM_CFG_PL;
    trp = HBM_TRP;
    ecc_en    = HBM_CFG_MECC_EN;
    dm_en     = HBM_CFG_WR_DM_EN;
    ca_par_en = HBM_CFG_CA_PAR_EN;
    wr_par_en = HBM_CFG_WR_PAR_EN;
    rd_par_en = HBM_CFG_RD_PAR_EN;
    wr_dbi_en = HBM_CFG_WR_DBI_EN;
    rd_dbi_en = HBM_CFG_RD_DBI_EN;
    mem_data.delete();
    mecc_mem_data.delete();

    active_command.cmd_type <= DDR_CMD_TYPE_NOP;
    ddr_cmd_type_activate_r = 0;

    for (i = 0; i < 2 * MAX_LATENCY; i++) begin
        read_command_pipeline[i] = 0;
        write_command_pipeline[i] = 0;
        bst_command_pipeline[i] = 0;
    end

end

always @ (posedge mem_ck_t) begin
    clock_cycle <= clock_cycle + 1;
    if (clock_cycle == 4) clock_stable <= 1'b1;
end

genvar k;
generate
for ( k = 0; k < MEM_DM_WIDTH; k = k+1 )
begin : gene_write_dbi
     mem_dbi_write_model #(
        .LOCAL_DQ_WIDTH   (MEM_DM_GROUP_SIZE)
     )dbi_process(
        .dbi_en     (wr_dbi_en?1'b1:1'b0),
        .dq_in      (mem_dq[MEM_DM_GROUP_SIZE*(k+1)-1:MEM_DM_GROUP_SIZE*k]),
        .dbi        (mem_dbi[k]),
        .dq_out     ( mem_dq_write_dbi[MEM_DM_GROUP_SIZE*(k+1)-1:MEM_DM_GROUP_SIZE*k])
    );

end
endgenerate


wire [CA_WIDTH-1:0] col_addr;
logic       activate_other_ps;
logic [2:0] rdqs_ext_cnt;
always @ (posedge mem_ck_diff or negedge mem_ck_diff) begin

   mem_ck_time = $time;
   read_command_pipeline = read_command_pipeline >> 1;
   write_command_pipeline = write_command_pipeline >> 1;
   activate_command_pipeline = activate_command_pipeline >> 1;
   activate_impre_command_pipeline = activate_impre_command_pipeline >> 1;
   precharge_command_pipeline = precharge_command_pipeline >> 1;
   rd_precharge_command_pipeline = rd_precharge_command_pipeline >> 1;
   bst_command_pipeline = bst_command_pipeline >> 1;


   if(mem_ck_diff && clock_stable) begin

      if (ddr_cmd_type_activate_r) begin

         bit [EFFECTIVE_BA_WIDTH - 1:0] prev_row_command_bank;
         prev_row_command_bank = new_row_command.bank;
         if (RA_WIDTH == 14) begin
            new_row_command.bank = {mem_r_pos_r[2], mem_r_neg_r[5], mem_r_pos_r[5:3]};
            new_row_command.address = {mem_r_neg_r[4],mem_r_neg_r[1:0],mem_r_pos[5:0],mem_r_neg[5:3],mem_r_neg[1:0]};
         end else begin
            new_row_command.bank = {mem_r_pos_r[2], mem_r_neg_r[5], mem_r_pos_r[5:3]}; 
            new_row_command.address = {mem_r_pos_r[6],mem_r_neg_r[4],mem_r_neg_r[1:0],mem_r_pos[5:0],mem_r_neg[5:3],mem_r_neg[1:0]};
         end
         imPRE = (new_row_command.bank == prev_row_command_bank) ? 0 : 0;
         cmd_set_activate();
         ddr_cmd_type_activate_r =   0;

      end else begin

         bit [EFFECTIVE_BA_WIDTH - 1:0] precharge_and_refresh_command_bank;
         precharge_and_refresh_command_bank = {mem_r_neg[1],mem_r_neg[5],mem_r_pos[5:3]};

         activate_other_ps <= 0;

         case (new_row_command.cmd_type)
            DDR_CMD_TYPE_NOP : cmd_nop();
            DDR_CMD_TYPE_ACTIVATE :
              begin
                  if (mem_r_neg[3] == HBM_MODEL_PSEUDOCHANNEL_ID && !(ddr_cmd_type_activate_r || activate_other_ps))
                      ddr_cmd_type_activate_r = 1;
                  else if (mem_r_neg[3] != HBM_MODEL_PSEUDOCHANNEL_ID && !(ddr_cmd_type_activate_r || activate_other_ps))
                      activate_other_ps <= 1;
              end
            DDR_CMD_TYPE_PRECHARGE :
              begin
                  if (mem_r_neg[3] == HBM_MODEL_PSEUDOCHANNEL_ID && !(ddr_cmd_type_activate_r || activate_other_ps))
                      begin
                          new_row_command.bank = precharge_and_refresh_command_bank;
                          cmd_precharge(new_row_command.bank, mem_r_neg[4]);
                      end
              end
            DDR_CMD_TYPE_REFRESH :
              begin
                  if (mem_r_neg[3] == HBM_MODEL_PSEUDOCHANNEL_ID && !(ddr_cmd_type_activate_r || activate_other_ps))
                      begin
                          new_row_command.bank = precharge_and_refresh_command_bank;
                          cmd_refresh(new_row_command.bank, mem_r_neg[4]);
                      end
              end
            default: cmd_nop();
         endcase
      end

      case (new_col_command.cmd_type)
         DDR_CMD_TYPE_NOP : cmd_nop();
         DDR_CMD_TYPE_WRITE :
             begin
                 if (mem_c_neg[7] == HBM_MODEL_PSEUDOCHANNEL_ID)
                     begin
                         new_col_command.bank = {mem_c_neg[0],mem_c_pos[7:4]};
                         new_col_command.address = {mem_c_neg[6:3],mem_c_neg[1:0]};
                         new_col_command.row = banks[new_col_command.bank].opened_row;
                         cmd_write();
                         if(CHECK_VIOLATIONS)
                             check_violations();
                     end
             end
         DDR_CMD_TYPE_READ :
             begin
                 if (mem_c_neg[7] == HBM_MODEL_PSEUDOCHANNEL_ID)
                     begin
                         new_col_command.bank = {mem_c_neg[0],mem_c_pos[7:4]};
                         new_col_command.address = {mem_c_neg[6:3],mem_c_neg[1:0]};
                         new_col_command.row = banks[new_col_command.bank].opened_row;
                         cmd_read();
                         if(CHECK_VIOLATIONS)
                             check_violations();
                     end
             end
         DDR_CMD_TYPE_MRS :
             begin 
                 mode_reg = {mem_c_pos[3],mem_c_neg[7:3],mem_c_neg[1:0]};
                 new_col_command.address = {mem_c_pos[7:4]};
                 cmd_mrs();
                 if(CHECK_VIOLATIONS)
                             check_violations();
             end
         default: cmd_nop();
      endcase

      mem_aerr = ca_par_en ? ^{mem_r_neg, mem_r_pos} | ^{mem_c_neg, mem_c_pos} : '0;

      new_col_command.word_count = 0;
      mem_c_pos = mem_c;
      mem_r_pos_r = mem_r_pos;
      mem_r_pos = mem_r;
      new_row_command.opcode = {mem_cke,mem_r[0],mem_r[1],mem_r[2]};

      casex (new_row_command.opcode)
          OPCODE_PRECHARGE : new_row_command.cmd_type = DDR_CMD_TYPE_PRECHARGE;
          OPCODE_ACTIVATE : new_row_command.cmd_type = DDR_CMD_TYPE_ACTIVATE;
          OPCODE_REFRESH : new_row_command.cmd_type = DDR_CMD_TYPE_REFRESH;
          OPCODE_NOP : new_row_command.cmd_type = DDR_CMD_TYPE_NOP;
          default: new_row_command.cmd_type = DDR_CMD_TYPE_NOP;
      endcase

      new_col_command.opcode = {mem_cke,mem_c[0],mem_c[1],mem_c[2]};

      casex (new_col_command.opcode)
          OPCODE_WRITE : new_col_command.cmd_type = DDR_CMD_TYPE_WRITE;
          OPCODE_READ : new_col_command.cmd_type = DDR_CMD_TYPE_READ;
          OPCODE_MRS : new_col_command.cmd_type = DDR_CMD_TYPE_MRS;
          OPCODE_NOP : new_col_command.cmd_type = DDR_CMD_TYPE_NOP;
          default: new_col_command.cmd_type = DDR_CMD_TYPE_NOP;
      endcase

      case (burst_type)
          DDR_BURST_TYPE_BL4 : new_col_command.burst_length = 4;
          DDR_BURST_TYPE_BL2 : new_col_command.burst_length = 2;
      endcase

   end

   if (!mem_ck_diff && clock_stable) begin
       mem_c_neg = mem_c;
       mem_r_neg_r = mem_r_neg;
       mem_r_neg = mem_r;
   end

   if (read_command_pipeline[0]) begin
       if (read_command_queue.size() == 0) begin
           display_prefix();
           $write("Internal Error: READ command queue empty but READ commands expected!\n");
           $stop(1);
       end
   end

   if (write_command_pipeline[0]) begin
       if (write_command_queue.size() == 0) begin
           display_prefix();
           $write("Internal Error: WRITE command queue empty but WRITE commands expected!\n");
           $stop(1);
       end
   end

   if (active_command.cmd_type != DDR_CMD_TYPE_NOP) begin
       if (active_command.word_count == active_command.burst_length) begin
           active_command.cmd_type = DDR_CMD_TYPE_NOP;
       end
   end

   if (read_command_pipeline[0])
       begin
           if (bst_command_pipeline[0]==0)
               begin
                   active_command.burst_length = read_burst_length_queue.pop_front();
               end
           else
               begin
                   active_command.burst_length = 2 * compare_read_latency.pop_front();  
               end
       end
   else if (write_command_pipeline[0])
       begin
           if (bst_command_pipeline[0]==0)
               begin
                   active_command.burst_length = write_burst_length_queue.pop_front();
               end
           else
               begin
                   active_command.burst_length = 2 * compare_write_latency.pop_front();  
               end
       end

   if (read_command_pipeline[0]) begin
       active_command.cmd_type = read_command_queue.pop_front();
       active_command.word_count = read_word_count_queue.pop_front();
       active_command.address = read_address_queue.pop_front();
       active_command.row = read_row_queue.pop_front();
       active_command.bank = read_bank_queue.pop_front();

       if (active_command.cmd_type != DDR_CMD_TYPE_READ) begin
           display_prefix();
           $write("Internal Error: Expected READ command not in queue!\n");
           $stop(1);
       end
   end
   else if (write_command_pipeline[0]) begin
       active_command.cmd_type = write_command_queue.pop_front();
       active_command.word_count = write_word_count_queue.pop_front();
       active_command.address = write_address_queue.pop_front();
       active_command.row = write_row_queue.pop_front();
       active_command.bank = write_bank_queue.pop_front();

       if (active_command.cmd_type != DDR_CMD_TYPE_WRITE) begin
           display_prefix();
           $write("Internal Error: Expected WRITE command not in queue!\n");
           $stop(1);
       end
   end

   if (precharge_command_pipeline[0]) begin
       precharge_command.cmd_type = precharge_command_queue.pop_front();
       precharge_command.bank = precharge_bank_queue.pop_front();
       cmd_precharge(precharge_command.bank, 1'b0);
   end

   if (rd_precharge_command_pipeline[0]) begin
       rd_precharge_command.cmd_type = rd_precharge_command_queue.pop_front();
       rd_precharge_command.bank = rd_precharge_bank_queue.pop_front();
       cmd_precharge(rd_precharge_command.bank, 1'b0);
   end

   if (activate_command_pipeline[0]) begin
       activate_command.cmd_type = activate_command_queue.pop_front();
       activate_command.bank = activate_bank_queue.pop_front();
       activate_command.address = activate_row_queue.pop_front();
       cmd_activate(activate_command.bank, activate_command.address);
   end
   if (activate_impre_command_pipeline[0]) begin
       activate_command.cmd_type = activate_command_queue.pop_front();
       activate_command.bank = activate_bank_queue.pop_front();
       activate_command.address = activate_row_queue.pop_front();
       cmd_activate(activate_command.bank, activate_command.address);
   end

   mem_dq_en = 1'b0;
   mem_rdqs_en = 1'b0;
   mem_rdqs_preamble = 1'b0;
   if (active_command.cmd_type == DDR_CMD_TYPE_WRITE) begin
      integer mem_ck_dqs_diff;
      integer dqs;
      logic [MEM_DQ_WIDTH - 1:0]    mem_dq_write;
      #(MEM_DQS_TO_CLK_CAPTURE_DELAY);
      mem_dq_write = '0;
      for (dqs = 0; dqs < MEM_DQS_WIDTH; dqs = dqs + 1) begin
         if (mem_ck_time > mem_wdqs_t_time[dqs]) begin
            mem_ck_dqs_diff = -(mem_ck_time - mem_wdqs_t_time[dqs]);
         end else begin
            mem_ck_dqs_diff = mem_wdqs_t_time[dqs] - mem_ck_time;
         end

         if (mem_ck_dqs_diff >= -(MEM_CLK_TO_DQS_CAPTURE_DELAY)) begin
            mem_dq_write = mem_dq_write | (mem_dq_captured & ({MEM_DQS_GROUP_SIZE{1'b1}} << (dqs*MEM_DQS_GROUP_SIZE)));
         end else begin
            display_prefix();
            $write("%s Write: mem_ck_t=%0t mem_wdqs_t=%0t delta=%0d min=%0d\n",
                     mem_ck_dqs_diff >= -(MEM_CLK_TO_DQS_CAPTURE_DELAY) ? "GOOD" : "BAD",
                     mem_ck_time, mem_wdqs_t_time[dqs], mem_ck_dqs_diff, -(MEM_CLK_TO_DQS_CAPTURE_DELAY));
                     mem_dq_write = mem_dq_write | ({MEM_DQS_GROUP_SIZE{1'bx}} << (dqs*MEM_DQS_GROUP_SIZE));
         end
      end
      if (ecc_en == 0)
         write_memory(active_command, mem_dq_write, full_mask);
      else
         write_memory_cb(active_command, mem_dq_write, mem_dm_captured);

      active_command.word_count = active_command.word_count+1;
   end else if (active_command.cmd_type == DDR_CMD_TYPE_READ) begin
      if (ecc_en == 0)
         read_memory(active_command, mem_dq_int);
      else
         read_memory_cb(active_command, mem_dq_int,mem_cb_int);
      mem_dq_en = 1'b1;
      mem_rdqs_en = 1'b1;
      active_command.word_count = active_command.word_count+1;
   end

   if (!mem_rdqs_en & (read_command_pipeline[2] | read_command_pipeline[1] | prev_cycle_rd)) begin
       mem_rdqs_en = 1'b1;
       mem_rdqs_preamble = 1'b1;
   end

   if (mem_rdqs_en) begin
       rdqs_ext_cnt = rd_par_en ? pl[1:0]+pl [1:0] : 0;
   end
   else begin
       if (rdqs_ext_cnt != 0) begin
           rdqs_ext_cnt = rdqs_ext_cnt -1'b1;
           mem_rdqs_en =1'b1;
       end
       else rdqs_ext_cnt =0;
   end

   prev_cycle_rd = (active_command.cmd_type == DDR_CMD_TYPE_READ);
end

generate
genvar dm_count;
    for (dm_count = 0; dm_count < MEM_DM_WIDTH; dm_count = dm_count + 1)
    begin: dm_mapping
        assign full_mask [(dm_count + 1) * MEM_DM_GROUP_SIZE - 1 : dm_count * MEM_DM_GROUP_SIZE] = dm_en ? {MEM_DM_GROUP_SIZE{mem_dm_captured[dm_count]}} : {MEM_DM_GROUP_SIZE{1'b0}};
    end
endgenerate

    assign #1 mem_wdqs_t_shifted = mem_wdqs_t;
    assign #1 mem_wdqs_c_shifted = mem_wdqs_c;

genvar dqs;
generate
for (dqs = 0; dqs < MEM_DQS_WIDTH; dqs = dqs + 1)
begin
    always @(posedge mem_wdqs_t_shifted[dqs] or posedge mem_wdqs_c_shifted[dqs]) begin
        mem_wdqs_t_time[dqs] <= $time;
        mem_dq_captured[((dqs+1)*MEM_DQS_GROUP_SIZE)-1:dqs*MEM_DQS_GROUP_SIZE] <= mem_dq_write_dbi[((dqs+1)*MEM_DQS_GROUP_SIZE)-1:dqs*MEM_DQS_GROUP_SIZE];
        mem_dm_captured[((dqs+1)*DM_PER_DQS)-1:dqs*DM_PER_DQS] <= mem_dm[((dqs+1)*DM_PER_DQS)-1:dqs*DM_PER_DQS];
    end
end
endgenerate

wire  [MEM_DQ_WIDTH-1:0] mem_dq_txpar;
wire  [MEM_DM_WIDTH-1:0] mem_dm_txpar;
wire  [MEM_DM_WIDTH-1:0] mem_dbi_txpar;
wire  [31:0]delayed_cmd;

txpar_delay_model #(
    .DQ_WIDTH (MEM_DQ_WIDTH),
    .DM_WIDTH (MEM_DM_WIDTH)
    )txpar_delay(
        .pl  (pl),
        .mem_dq (mem_dq),
        .mem_dbi(mem_dbi),
        .mem_dm (mem_dm),
        .cmd    (active_command.cmd_type),
        .mem_ck (mem_ck_t),
        .mem_dq_txpar (mem_dq_txpar),
        .mem_dbi_txpar(mem_dbi_txpar),
        .mem_dm_txpar (mem_dm_txpar),
        .delayed_cmd  (delayed_cmd)
    );

logic [MEM_PAR_WIDTH-1:0]     mem_derr_dq;
logic [MEM_PAR_WIDTH-1:0]     mem_derr_dbi;
logic [MEM_PAR_WIDTH-1:0]     mem_derr_dm;
logic [MEM_DQS_WIDTH-1:0]    mem_par_dq;
logic [MEM_DQS_WIDTH-1:0]    mem_par_dbi;


logic [MEM_DM_WIDTH-1:0] mem_dm_before_tdqsck;
logic [MEM_DM_WIDTH-1:0] mem_dbi_before_tdqsck;
logic [MEM_DQ_WIDTH-1:0] mem_dq_before_tdqsck;
logic [MEM_DQS_WIDTH-1:0]     mem_rdqs_t_before_tdqsck;
logic [MEM_DQS_WIDTH-1:0]     mem_rdqs_c_before_tdqsck;
logic [MEM_PAR_WIDTH-1:0]     mem_derr_before_tdqsck;
logic [MEM_PAR_WIDTH-1:0]     mem_par_before_tdqsck;

generate
for (dqs = 0; dqs < MEM_DQS_WIDTH; dqs = dqs + 1) begin
   always @ (posedge mem_ck_diff or negedge mem_ck_diff) begin
      mem_derr_dbi[dqs]=wr_dbi_en ? (^(mem_dbi_txpar[((dqs+1)*PAR_SIZE_IN)-1:dqs*PAR_SIZE_IN])):1'b0;
      mem_derr_dm [dqs]=dm_en  ?(^(mem_dm_txpar[((dqs+1)*PAR_SIZE_IN)-1:dqs*PAR_SIZE_IN])):1'b0;
      mem_derr_dq [dqs]=HBM_MODEL_WR_PAR_DIAG ? ~(^(mem_dq_txpar [((dqs+1)*MEM_DQS_GROUP_SIZE)-1:dqs*MEM_DQS_GROUP_SIZE])):(^(mem_dq_txpar [((dqs+1)*MEM_DQS_GROUP_SIZE)-1:dqs*MEM_DQS_GROUP_SIZE]));
      mem_derr_before_tdqsck[dqs] = wr_par_en ? (delayed_cmd == DDR_CMD_TYPE_WRITE) ? (mem_par[dqs] ^ mem_derr_dq [dqs]^mem_derr_dm [dqs]^mem_derr_dbi [dqs]) : 1'b0 : 1'b0;
   end
   always@(*) begin
      mem_par_dq[dqs]=(^(mem_dq_int[((dqs+1)*MEM_DQS_GROUP_SIZE)-1:dqs*MEM_DQS_GROUP_SIZE]));
      mem_par_dbi[dqs]= rd_dbi_en? (^(mem_dbi_before_tdqsck[((dqs+1)*PAR_SIZE_IN)-1:dqs*PAR_SIZE_IN])):1'b0;
      mem_par_int[dqs] = (active_command.cmd_type == DDR_CMD_TYPE_READ) ? (mem_par_dq [dqs]^mem_par_dbi [dqs]) : 1'b0;
   end
end
endgenerate

wire [MEM_DQ_WIDTH - 1:0]   mem_dq_read_dbi;

wire [MEM_DQ_WIDTH - 1:0]   mem_dq_out;
wire [MEM_DQS_WIDTH- 1:0]        mem_par_delay;
wire                             mem_dq_en_delay;
rdpar_delay_model #(
    .PAR_WIDTH (MEM_DQS_WIDTH)
    )rdpar_delay(
    .pl (pl),
    .mem_par_in (mem_par_int),
    .enable_in  (mem_dq_en),
    .mem_ck     (mem_ck_t),
    .mem_par_out(mem_par_delay),
    .enable_out (mem_dq_en_delay)
);

assign mem_dq_out = (active_command.word_count == 1 & HBM_MODEL_SBE_DIAG == 1) ? {mem_dq_read_dbi [MEM_DQ_WIDTH - 1:1],~mem_dq_read_dbi[0]} :mem_dq_read_dbi;
assign mem_dq_before_tdqsck  = (mem_dq_en) ? mem_dq_out : 'z;
assign mem_par_before_tdqsck = (mem_dq_en_delay & rd_par_en) ? (HBM_MODEL_RD_PAR_DIAG ? ~mem_par_delay:mem_par_delay ): 'z;
assign mem_dm_before_tdqsck  = (mem_dq_en & ecc_en) ? mem_cb_int: 'z;
assign mem_rdqs_t_before_tdqsck = mem_rdqs_en ? {MEM_DQS_WIDTH{mem_ck_diff}} : '0;
assign mem_rdqs_c_before_tdqsck = mem_rdqs_en ? {MEM_DQS_WIDTH{~mem_ck_diff}} : '1;

logic [MEM_DM_WIDTH-1:0] mem_dm_after_tdqsck;
logic [MEM_DM_WIDTH-1:0] mem_dbi_after_tdqsck;
logic [MEM_DQ_WIDTH-1:0] mem_dq_after_tdqsck;
logic [MEM_DQS_WIDTH-1:0]     mem_rdqs_t_after_tdqsck;
logic [MEM_DQS_WIDTH-1:0]     mem_rdqs_c_after_tdqsck;
logic [MEM_PAR_WIDTH-1:0]     mem_derr_after_tdqsck;
logic [MEM_PAR_WIDTH-1:0]     mem_par_after_tdqsck;

always_comb begin
   mem_dm_after_tdqsck <= #(HBM_TDQSCK_PS) mem_dm_before_tdqsck;
   mem_dbi_after_tdqsck <= #(HBM_TDQSCK_PS) mem_dbi_before_tdqsck;
   mem_dq_after_tdqsck <= #(HBM_TDQSCK_PS) mem_dq_before_tdqsck;
   mem_rdqs_t_after_tdqsck <= #(HBM_TDQSCK_PS) mem_rdqs_t_before_tdqsck;
   mem_rdqs_c_after_tdqsck <= #(HBM_TDQSCK_PS) mem_rdqs_c_before_tdqsck;
   mem_derr_after_tdqsck <= #(HBM_TDQSCK_PS) mem_derr_before_tdqsck;
   mem_par_after_tdqsck <= #(HBM_TDQSCK_PS) mem_par_before_tdqsck;
end

   assign mem_dm = mem_dm_after_tdqsck;
   assign mem_dbi = mem_dbi_after_tdqsck;
   assign mem_dq = mem_dq_after_tdqsck;
   assign mem_rdqs_t = mem_rdqs_t_after_tdqsck;
   assign mem_rdqs_c = mem_rdqs_c_after_tdqsck; 
   assign mem_derr = mem_derr_after_tdqsck;
   assign mem_par = mem_par_after_tdqsck;

genvar j;
generate
for ( j = 0; j < MEM_DM_WIDTH; j = j+1 )
begin : gene_dbi

     mem_dbi_generate_model #(
        .LOCAL_DQ_WIDTH   (MEM_DM_GROUP_SIZE),
        .LOCAL_DBI_WIDTH  (1)
    )dbi_process(
        .read_clk   (mem_rdqs_t[0]),
        .dbi_en     (rd_dbi_en?1'b1:1'b0),
        .read_reset (reset_n),
        .dq_in      (mem_dq_int[MEM_DM_GROUP_SIZE*(j+1)-1:MEM_DM_GROUP_SIZE*j]),
        .dbi_in     (mem_dbi[j]),
        .dbi_out    (mem_dbi_read[j]),
        .dq_out     (mem_dq_read_dbi[MEM_DM_GROUP_SIZE*(j+1)-1:MEM_DM_GROUP_SIZE*j])
    );
end
endgenerate

assign mem_dbi_before_tdqsck = (rd_dbi_en & mem_dq_en) ? mem_dbi_read : 'z;

endmodule


module mem_dbi_generate_model
    #(parameter
        LOCAL_DQ_WIDTH = 8,
        LOCAL_DBI_WIDTH = 1
    )
    (
        input  read_clk,
        input  dbi_en,
        input  read_reset,
        input  [LOCAL_DQ_WIDTH-1:0] dq_in,
        input  [LOCAL_DBI_WIDTH-1:0]dbi_in,
        output [LOCAL_DBI_WIDTH-1:0]dbi_out,
        output [LOCAL_DQ_WIDTH-1:0] dq_out
    );
    wire comp_result;

    reg [LOCAL_DQ_WIDTH+LOCAL_DBI_WIDTH-1:0]old_dq;
    reg [LOCAL_DQ_WIDTH+LOCAL_DBI_WIDTH-1:0]pst_dq;
    assign pst_dq = {dbi_in,dq_in};
    always@(posedge read_clk)
        old_dq <= {dbi_in,dq_in};

    mem_dbi_comparator_model # (
        .DQ_WIDTH(LOCAL_DQ_WIDTH+LOCAL_DBI_WIDTH)
    ) comparator_inst (
        .old_dq            (old_dq),
        .new_dq            (pst_dq),
        .compare_result    (comp_result)
    );

    assign dbi_out = dbi_en & comp_result;
    assign dq_out = dbi_out ? ~dq_in : dq_in;
endmodule


module mem_dbi_comparator_model
# (parameter
        DQ_WIDTH    = 9,
        DIFF_RANGE  = 4
    )
    (
   input        [DQ_WIDTH-1:0] old_dq,
   input        [DQ_WIDTH-1:0] new_dq,
   output       compare_result
);

reg [DQ_WIDTH-1:0]count;
integer i;
   always@(*)
   begin
   count=0;
   for ( i = 0; i < DQ_WIDTH-1; i = i+1 )
      if(old_dq[i]!=new_dq[i])
         count++;
   if(new_dq[DQ_WIDTH-1]==1)
      count++;
   end

assign compare_result = (count > DIFF_RANGE) ? 1'b1 : 1'b0;

endmodule

module mem_dbi_write_model #(
   parameter LOCAL_DQ_WIDTH = 8
   )
   (
   input dbi_en,
   input  [LOCAL_DQ_WIDTH-1:0]dq_in,
   input  dbi,
   output reg [LOCAL_DQ_WIDTH-1:0]dq_out
   );
   always @ (*)
      if(dbi_en)
         dq_out = {LOCAL_DQ_WIDTH{dbi}} ^ dq_in;
      else
         dq_out = dq_in;
endmodule

module rdpar_delay_model #(
    parameter PAR_WIDTH = 0
    )
    (
    input [1:0]            pl,
    input [PAR_WIDTH-1:0]  mem_par_in,
    input                  enable_in,
    input                  mem_ck,
    output [PAR_WIDTH-1:0] mem_par_out,
    output                 enable_out
);
    data_delay_model #(
    .EXT_DELAY (0),
    .DQ_WIDTH (PAR_WIDTH)
    )txpar_delay_par(
        .pl (pl),
        .dq_in (mem_par_in),
        .clk (mem_ck),
        .dq_out (mem_par_out)
    );
    data_delay_model #(
    .EXT_DELAY (0),
    .DQ_WIDTH  (1)
    )txpar_delay_en(
        .pl (pl),
        .dq_in (enable_in),
        .clk (mem_ck),
        .dq_out (enable_out)
    );

endmodule

module txpar_delay_model #(
    parameter DQ_WIDTH = 0,
    parameter DM_WIDTH = 0
    )
    (
        input [1:0]         pl,
        input [DQ_WIDTH-1:0]mem_dq,
        input [DM_WIDTH-1:0]mem_dbi,
        input [DM_WIDTH-1:0]mem_dm,
        input [31:0]        cmd,
        input               mem_ck,
        output[DQ_WIDTH-1:0]mem_dq_txpar,
        output[DM_WIDTH-1:0]mem_dbi_txpar,
        output[DM_WIDTH-1:0]mem_dm_txpar,
        output[31:0]        delayed_cmd
    );
 data_delay_model #(
    .EXT_DELAY (1),
    .DQ_WIDTH (DQ_WIDTH)
    )txpar_delay_dq(
        .pl (pl),
        .dq_in (mem_dq),
        .clk (mem_ck),
        .dq_out (mem_dq_txpar)
    );
 data_delay_model #(
    .EXT_DELAY (1),
    .DQ_WIDTH  (DM_WIDTH)
    )txpar_delay_dbi(
        .pl (pl),
        .dq_in (mem_dbi),
        .clk (mem_ck),
        .dq_out (mem_dbi_txpar)
    );
 data_delay_model #(
    .EXT_DELAY (1),
    .DQ_WIDTH (DM_WIDTH)
    )txpar_delay_dm(
        .pl (pl),
        .dq_in (mem_dm),
        .clk (mem_ck),
        .dq_out (mem_dm_txpar)
    );
 data_delay_model #(
    .EXT_DELAY (0),
    .DQ_WIDTH (32)
    )txpar_delay_cmd(
        .pl (pl),
        .dq_in (cmd),
        .clk (mem_ck),
        .dq_out (delayed_cmd)
    );
endmodule

module data_delay_model #(
    parameter EXT_DELAY =0,
    parameter DQ_WIDTH = 0
    )
    (
        input [1:0] pl,
        input [DQ_WIDTH-1:0]dq_in,
        input clk,
        output reg [DQ_WIDTH-1:0]dq_out
    );
    reg [DQ_WIDTH-1:0]dq_delay1;
    reg [DQ_WIDTH-1:0]dq_delay2;
    reg [DQ_WIDTH-1:0]dq_delay3;
    reg [DQ_WIDTH-1:0]dq_delay4;
    reg [DQ_WIDTH-1:0]dq_delay5;
    reg [DQ_WIDTH-1:0]dq_delay6;
    reg [DQ_WIDTH-1:0]dq_delay7;
    wire [2:0]par_delay;
    assign par_delay = pl[1:0]+pl[1:0]+EXT_DELAY[0];
    always@(posedge clk or negedge clk)
    begin
    dq_delay1 <= dq_in;
    dq_delay2 <= dq_delay1;
    dq_delay3 <= dq_delay2;
    dq_delay4 <= dq_delay3;
    dq_delay5 <= dq_delay4;
    dq_delay6 <= dq_delay5;
    dq_delay7 <= dq_delay6;
    end

    always@(*)
    case(par_delay)
    3'b000:   dq_out <= dq_in;
    3'b001:   dq_out <= dq_delay1;
    3'b010:   dq_out <= dq_delay2;
    3'b011:   dq_out <= dq_delay3;
    3'b100:   dq_out <= dq_delay4;
    3'b101:   dq_out <= dq_delay5;
    3'b110:   dq_out <= dq_delay6;
    3'b111:   dq_out <= dq_delay7;
    default: dq_out <= dq_in;
    endcase
endmodule
