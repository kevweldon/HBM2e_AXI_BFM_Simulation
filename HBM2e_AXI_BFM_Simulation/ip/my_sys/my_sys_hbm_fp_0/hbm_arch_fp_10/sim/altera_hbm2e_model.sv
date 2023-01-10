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

`define ALTERA_HBM2E_MODEL_DECL_CH_PORTS(CH) \
   input  ck_t_``CH, \
   input  ck_c_``CH, \
   input  cke_``CH,  \
   input  [HBM_C_WIDTH - 1:0]      c_``CH, \
   input  [HBM_R_WIDTH - 1:0]      r_``CH, \
   inout  [HBM_DQ_WIDTH - 1:0]     dq_``CH, \
   inout  [HBM_DBI_WIDTH - 1:0]    dbi_``CH, \
   inout  [HBM_DM_WIDTH - 1:0]     dm_``CH, \
   inout  [HBM_PAR_WIDTH - 1:0]    par_``CH, \
   output [HBM_DERR_WIDTH - 1:0]   derr_``CH, \
   output aerr_``CH, \
   input  [HBM_WDQS_T_WIDTH - 1:0] wdqs_t_``CH, \
   input  [HBM_WDQS_C_WIDTH - 1:0] wdqs_c_``CH, \
   output [HBM_RDQS_T_WIDTH - 1:0] rdqs_t_``CH, \
   output [HBM_RDQS_C_WIDTH - 1:0] rdqs_c_``CH, \
   inout  [8 - 1:0] rd_``CH, \
   input  rr_``CH, \
   input  rc_``CH, 


`define ALTERA_HBM2E_MODEL_CH_INST(AXI_CH_ID, MEM_CH_ID, MEM_CH_NUM, PARITY_LATENCY, WR_DM_EN, MECC_EN) \
    altera_hbm_mem # (\
        .AXI_CHANNEL_ID          (AXI_CH_ID),           \
        .HBM_MODEL_CHANNEL_ID    (MEM_CH_ID),           \
        .HBM_MODEL_OPTIONS       (ma_hbm_model_options),\
        .HBM_DEVICE              (ma_hbm_device),       \
                                                        \
        .HBM_TDQSCK_PS           (ma_hbm_tdqsck_ps),    \
        .HBM_TRCDRD              (ma_hbm_trcdrd),       \
        .HBM_TRCDWR              (ma_hbm_trcdwr),       \
        .HBM_TRTPL_BL4           (ma_hbm_trtpl_bl4),    \
        .HBM_TRP                 (ma_hbm_trp),          \
        .HBM_TWR                 (ma_hbm_twr),          \
                                                        \
        .HBM_CFG_CA_PAR_EN       (HBM_CFG_CA_PAR_EN),   \
        .HBM_CFG_WR_PAR_EN       (HBM_CFG_WR_PAR_EN),   \
        .HBM_CFG_RD_PAR_EN       (HBM_CFG_RD_PAR_EN),   \
        .HBM_CFG_WR_DBI_EN       (HBM_CFG_WR_DBI_EN),   \
        .HBM_CFG_RD_DBI_EN       (HBM_CFG_RD_DBI_EN),   \
        .HBM_CFG_RL              (ma_cfg_hbmc_pc0_rl),  \
        .HBM_CFG_WL              (ma_cfg_hbmc_pc0_wl),  \
        .HBM_CFG_PL              (PARITY_LATENCY),      \
        .HBM_CFG_MECC_EN         (MECC_EN  == "ENABLE"),\
        .HBM_CFG_WR_DM_EN        (WR_DM_EN == "ENABLE"),\
                                                        \
        .HBM_C_WIDTH             (HBM_C_WIDTH),         \
        .HBM_R_WIDTH             (HBM_R_WIDTH),         \
        .HBM_DQ_WIDTH            (HBM_DQ_WIDTH),        \
        .HBM_DBI_WIDTH           (HBM_DBI_WIDTH),       \
        .HBM_DM_WIDTH            (HBM_DM_WIDTH),        \
        .HBM_PAR_WIDTH           (HBM_PAR_WIDTH),       \
        .HBM_DERR_WIDTH          (HBM_DERR_WIDTH),      \
        .HBM_WDQS_T_WIDTH        (HBM_WDQS_T_WIDTH),    \
        .HBM_WDQS_C_WIDTH        (HBM_WDQS_C_WIDTH),    \
        .HBM_RDQS_T_WIDTH        (HBM_RDQS_T_WIDTH),    \
        .HBM_RDQS_C_WIDTH        (HBM_RDQS_C_WIDTH),    \
        .HBM_RD_WIDTH            (HBM_RD_WIDTH)         \
    ) altera_hbm_mem_``MEM_CH_NUM (                     \
       .reset_n(reset_n),                               \
       .ck_t  (ck_t_``MEM_CH_NUM),                      \
       .ck_c  (ck_c_``MEM_CH_NUM),                      \
       .cke   (cke_``MEM_CH_NUM),                       \
       .c     (c_``MEM_CH_NUM),                         \
       .r     (r_``MEM_CH_NUM),                         \
       .dq    (dq_``MEM_CH_NUM),                        \
       .dbi   (dbi_``MEM_CH_NUM),                       \
       .dm    (dm_``MEM_CH_NUM),                        \
       .par   (par_``MEM_CH_NUM),                       \
       .derr  (derr_``MEM_CH_NUM),                      \
       .aerr  (aerr_``MEM_CH_NUM),                      \
       .wdqs_t(wdqs_t_``MEM_CH_NUM),                    \
       .wdqs_c(wdqs_c_``MEM_CH_NUM),                    \
       .rdqs_t(rdqs_t_``MEM_CH_NUM),                    \
       .rdqs_c(rdqs_c_``MEM_CH_NUM),                    \
       .rd    (rd_``MEM_CH_NUM),                        \
       .rr    (rr_``MEM_CH_NUM),                        \
       .rc    (rc_``MEM_CH_NUM)                         \
    );

module altera_hbm2e_model
    # (parameter
        ma_hbm_model_options  = 32'b0001,

        ma_hbm_device      = "HBM_DEVICE_16GB_8HI",

        ma_hbm_tdqsck_ps   = 1000, 
        ma_hbm_trcdrd      = 16,
        ma_hbm_trcdwr      = 14,
        ma_hbm_trtpl_bl4   = 1,
        ma_hbm_trp         = 1,
        ma_hbm_twr         = 0,
        ma_cfg_hbmc_pc0_rl = 15, 
        ma_cfg_hbmc_pc0_wl = 6, 
        ma_cfg_hbmc_pc1_rl = 15, 
        ma_cfg_hbmc_pc1_wl = 6, 
        ma_cha_par_lat  = 4, 
        ma_chb_par_lat  = 4, 
        ma_chc_par_lat  = 4, 
        ma_chd_par_lat  = 4, 
        ma_che_par_lat  = 4, 
        ma_chf_par_lat  = 4, 
        ma_chg_par_lat  = 4, 
        ma_chh_par_lat  = 4, 
        ma_cha_cfg_wr_dm_en = "DISABLE", 
        ma_chb_cfg_wr_dm_en = "DISABLE", 
        ma_chc_cfg_wr_dm_en = "DISABLE", 
        ma_chd_cfg_wr_dm_en = "DISABLE", 
        ma_che_cfg_wr_dm_en = "DISABLE", 
        ma_chf_cfg_wr_dm_en = "DISABLE", 
        ma_chg_cfg_wr_dm_en = "DISABLE", 
        ma_chh_cfg_wr_dm_en = "DISABLE", 
        ma_cha_cfg_mecc_en  = "DISABLE", 
        ma_chb_cfg_mecc_en  = "DISABLE", 
        ma_chc_cfg_mecc_en  = "DISABLE", 
        ma_chd_cfg_mecc_en  = "DISABLE", 
        ma_che_cfg_mecc_en  = "DISABLE", 
        ma_chf_cfg_mecc_en  = "DISABLE", 
        ma_chg_cfg_mecc_en  = "DISABLE", 
        ma_chh_cfg_mecc_en  = "DISABLE", 
        localparam 
        HBM_CFG_CA_PAR_EN = 1,
        HBM_CFG_WR_PAR_EN = 1,
        HBM_CFG_RD_PAR_EN = 1,
        HBM_CFG_WR_DBI_EN = 1,
        HBM_CFG_RD_DBI_EN = 1,        
        parameter
        HBM_C_WIDTH       = 9,       
        HBM_R_WIDTH       = 7,       
        localparam 
        HBM_DQ_WIDTH      = 128,
        HBM_DBI_WIDTH     = 16,
        HBM_DM_WIDTH      = 16,
        HBM_PAR_WIDTH     = 4,
        HBM_DERR_WIDTH    = 4,
        HBM_RDQS_T_WIDTH  = 4,
        HBM_RDQS_C_WIDTH  = 4,
        HBM_WDQS_T_WIDTH  = 4,
        HBM_WDQS_C_WIDTH  = 4,
        HBM_RD_WIDTH      = 8,      
        HBM_WSO_WIDTH     = 8, 
        HBM_TEMP_WIDTH    = 3
    )
    (
   `ALTERA_HBM2E_MODEL_DECL_CH_PORTS(0)
   `ALTERA_HBM2E_MODEL_DECL_CH_PORTS(1)
   `ALTERA_HBM2E_MODEL_DECL_CH_PORTS(2)
   `ALTERA_HBM2E_MODEL_DECL_CH_PORTS(3)
   `ALTERA_HBM2E_MODEL_DECL_CH_PORTS(4)
   `ALTERA_HBM2E_MODEL_DECL_CH_PORTS(5)
   `ALTERA_HBM2E_MODEL_DECL_CH_PORTS(6)
   `ALTERA_HBM2E_MODEL_DECL_CH_PORTS(7)

   input  reset_n,
   output cattrip,
   output [HBM_WSO_WIDTH - 1:0]  wso,
   output [HBM_TEMP_WIDTH - 1:0] temp,

   input wrst_n,
   input wrck,
   input shiftwr,
   input capturewr,
   input updatewr,
   input selectwir,
   input wsi
);

   // Simulation assertions
   // synthesis translate_off
   initial
   begin
      assert ((ma_hbm_device == "HBM_DEVICE_4GB_4HI") || 
              (ma_hbm_device == "HBM_DEVICE_8GB_4HI") ||
              (ma_hbm_device == "HBM_DEVICE_8GB_8HI") ||
              (ma_hbm_device == "HBM_DEVICE_16GB_8HI")) 
      else $error({"Illegal HBM device type: ",ma_hbm_device});
      assert ((ma_hbm_device != "HBM_DEVICE_8GB_4HI" && ma_hbm_device != "HBM_DEVICE_16GB_8HI") ||
              (HBM_C_WIDTH == 9 && HBM_R_WIDTH == 7)) 
      else $error({"C width must be 9 and R width 7 for HBM devices based on 8Gb dies - device type is ",ma_hbm_device});  
      assert (ma_cfg_hbmc_pc0_rl == ma_cfg_hbmc_pc1_rl) else $error("HBM read latency must be the same for both pseudo-channels");
      assert (ma_cfg_hbmc_pc0_wl == ma_cfg_hbmc_pc1_wl) else $error("HBM write latency must be the same for both pseudo-channels");
      assert (ma_cha_cfg_wr_dm_en == "ENABLE" || ma_cha_cfg_wr_dm_en == "DISABLE") else $error({"invalid ma_cha_cfg_wr_dm_en value: ",ma_cha_cfg_wr_dm_en});
      assert (ma_chb_cfg_wr_dm_en == "ENABLE" || ma_chb_cfg_wr_dm_en == "DISABLE") else $error({"invalid ma_chb_cfg_wr_dm_en value: ",ma_chb_cfg_wr_dm_en});
      assert (ma_chc_cfg_wr_dm_en == "ENABLE" || ma_chc_cfg_wr_dm_en == "DISABLE") else $error({"invalid ma_chc_cfg_wr_dm_en value: ",ma_chc_cfg_wr_dm_en});
      assert (ma_chd_cfg_wr_dm_en == "ENABLE" || ma_chd_cfg_wr_dm_en == "DISABLE") else $error({"invalid ma_chd_cfg_wr_dm_en value: ",ma_chd_cfg_wr_dm_en});
      assert (ma_che_cfg_wr_dm_en == "ENABLE" || ma_che_cfg_wr_dm_en == "DISABLE") else $error({"invalid ma_che_cfg_wr_dm_en value: ",ma_che_cfg_wr_dm_en});
      assert (ma_chf_cfg_wr_dm_en == "ENABLE" || ma_chf_cfg_wr_dm_en == "DISABLE") else $error({"invalid ma_chf_cfg_wr_dm_en value: ",ma_chf_cfg_wr_dm_en});
      assert (ma_chg_cfg_wr_dm_en == "ENABLE" || ma_chg_cfg_wr_dm_en == "DISABLE") else $error({"invalid ma_chg_cfg_wr_dm_en value: ",ma_chg_cfg_wr_dm_en});
      assert (ma_chh_cfg_wr_dm_en == "ENABLE" || ma_chh_cfg_wr_dm_en == "DISABLE") else $error({"invalid ma_chh_cfg_wr_dm_en value: ",ma_chh_cfg_wr_dm_en});
      assert (ma_cha_cfg_mecc_en == "ENABLE" || ma_cha_cfg_mecc_en == "DISABLE")   else $error({"invalid ma_cha_cfg_mecc_en value: ",ma_cha_cfg_mecc_en});
      assert (ma_chb_cfg_mecc_en == "ENABLE" || ma_chb_cfg_mecc_en == "DISABLE")   else $error({"invalid ma_chb_cfg_mecc_en value: ",ma_chb_cfg_mecc_en});
      assert (ma_chc_cfg_mecc_en == "ENABLE" || ma_chc_cfg_mecc_en == "DISABLE")   else $error({"invalid ma_chc_cfg_mecc_en value: ",ma_chc_cfg_mecc_en});
      assert (ma_chd_cfg_mecc_en == "ENABLE" || ma_chd_cfg_mecc_en == "DISABLE")   else $error({"invalid ma_chd_cfg_mecc_en value: ",ma_chd_cfg_mecc_en});
      assert (ma_che_cfg_mecc_en == "ENABLE" || ma_che_cfg_mecc_en == "DISABLE")   else $error({"invalid ma_che_cfg_mecc_en value: ",ma_che_cfg_mecc_en});
      assert (ma_chf_cfg_mecc_en == "ENABLE" || ma_chf_cfg_mecc_en == "DISABLE")   else $error({"invalid ma_chf_cfg_mecc_en value: ",ma_chf_cfg_mecc_en});
      assert (ma_chg_cfg_mecc_en == "ENABLE" || ma_chg_cfg_mecc_en == "DISABLE")   else $error({"invalid ma_chg_cfg_mecc_en value: ",ma_chg_cfg_mecc_en});
      assert (ma_chh_cfg_mecc_en == "ENABLE" || ma_chh_cfg_mecc_en == "DISABLE")   else $error({"invalid ma_chh_cfg_mecc_en value: ",ma_chh_cfg_mecc_en});
   end
   // synthesis translate_on

   assign cattrip = 1'b0;
   assign temp    = 3'b011;
   assign wso     = '0;

   `ALTERA_HBM2E_MODEL_CH_INST(2, "A",0, ma_cha_par_lat, ma_cha_cfg_wr_dm_en, ma_cha_cfg_mecc_en)
   `ALTERA_HBM2E_MODEL_CH_INST(3, "B",1, ma_chb_par_lat, ma_chb_cfg_wr_dm_en, ma_chb_cfg_mecc_en)
   `ALTERA_HBM2E_MODEL_CH_INST(6, "C",2, ma_chc_par_lat, ma_chc_cfg_wr_dm_en, ma_chc_cfg_mecc_en)
   `ALTERA_HBM2E_MODEL_CH_INST(7, "D",3, ma_chd_par_lat, ma_chd_cfg_wr_dm_en, ma_chd_cfg_mecc_en)
   `ALTERA_HBM2E_MODEL_CH_INST(0, "E",4, ma_che_par_lat, ma_che_cfg_wr_dm_en, ma_che_cfg_mecc_en)
   `ALTERA_HBM2E_MODEL_CH_INST(1, "F",5, ma_chf_par_lat, ma_chf_cfg_wr_dm_en, ma_chf_cfg_mecc_en)
   `ALTERA_HBM2E_MODEL_CH_INST(4, "G",6, ma_chg_par_lat, ma_chg_cfg_wr_dm_en, ma_chg_cfg_mecc_en)
   `ALTERA_HBM2E_MODEL_CH_INST(5, "H",7, ma_chh_par_lat, ma_chh_cfg_wr_dm_en, ma_chh_cfg_mecc_en)
endmodule
