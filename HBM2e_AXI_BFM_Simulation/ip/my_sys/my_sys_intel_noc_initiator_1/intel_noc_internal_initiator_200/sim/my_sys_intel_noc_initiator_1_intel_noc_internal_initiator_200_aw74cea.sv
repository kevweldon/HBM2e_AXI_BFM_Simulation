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


module my_sys_intel_noc_initiator_1_intel_noc_internal_initiator_200_aw74cea # (

    parameter NOC_QOS_MODE = "Socket" ,
    // parameter NOC_PERFMON_VALID_T2
    parameter NOC_QOS_WRITE_PRIORITY = 0 ,
    parameter NOC_QOS_READ_PRIORITY = 0 ,
    parameter NOC_INIU_ADAPTER_DATA_WIDTH = "NOC_INIU_ADAPTER_DATA_WIDTH_32_BITS",
    
    parameter NOC_INIU_WUSER_ECC_EN = "NOC_INIU_WUSER_ECC_EN_ENABLE" ,
    parameter NOC_AXI_PIPELINE_CNT = 2,
    parameter NOC_INIU_UNOC_EN = "NOC_INIU_UNOC_EN_DISABLE",
    parameter NOC_INIU_UNOC_CLK_SEL ="NOC_INIU_UNOC_CLK_SEL_UNOC_CLK",
    // AXI parameters 
    parameter AXI_ADDR_WIDTH = 44,
    parameter AXI_WSTRB_WIDTH = 32,
    parameter AXI_AUSER_WIDTH = 8,
    parameter AXI_USER_WIDTH = 32,
    parameter AXI_ID_WIDTH = 7,

    //security parameters
    parameter ENABLE_SECURITY = "OFF",
    parameter MAJOR_WRITE_PRV = 0,
    parameter MAJOR_READ_PRV= 0,

    parameter NOC_INIU_PEND_TRANS_RD_VAL =128,
    parameter NOC_INIU_PEND_TRANS_WR_VAL =64,

    // unoc parameters
    parameter NOC_INIU_UNOC_ONLY_AXI_READ = "NOC_INIU_UNOC_ONLY_AXI_READ_DISABLE",

    parameter NOC_RRB_0_CS = "NOC_RRB_0_CS_ENABLE",
    parameter NOC_RRB_0_M20K_ID = 0,
    parameter NOC_RRB_0_NUM_M20K = "NOC_RRB_0_NUM_M20K_8_M20K",
    parameter NOC_RRB_0_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_0_START_ADDR =0,
    parameter NOC_RRB_0_USE_START_ADDR = "NOC_RRB_0_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_0_VALID = "NOC_RRB_0_VALID_INVALID",


    parameter NOC_RRB_1_CS = "NOC_RRB_1_CS_ENABLE",
    parameter NOC_RRB_1_M20K_ID = 0,
    parameter NOC_RRB_1_NUM_M20K = "NOC_RRB_1_NUM_M20K_8_M20K",
    parameter NOC_RRB_1_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_1_START_ADDR =0,
    parameter NOC_RRB_1_USE_START_ADDR = "NOC_RRB_1_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_1_VALID = "NOC_RRB_1_VALID_INVALID",

    parameter NOC_RRB_2_CS = "NOC_RRB_2_CS_ENABLE",
    parameter NOC_RRB_2_M20K_ID = 0,
    parameter NOC_RRB_2_NUM_M20K = "NOC_RRB_2_NUM_M20K_8_M20K",
    parameter NOC_RRB_2_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_2_START_ADDR =0,
    parameter NOC_RRB_2_USE_START_ADDR = "NOC_RRB_2_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_2_VALID = "NOC_RRB_2_VALID_INVALID",


    parameter NOC_RRB_3_CS = "NOC_RRB_3_CS_ENABLE",
    parameter NOC_RRB_3_M20K_ID = 0,
    parameter NOC_RRB_3_NUM_M20K = "NOC_RRB_3_NUM_M20K_8_M20K",
    parameter NOC_RRB_3_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_3_START_ADDR =0,
    parameter NOC_RRB_3_USE_START_ADDR = "NOC_RRB_3_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_3_VALID = "NOC_RRB_3_VALID_INVALID",


    parameter NOC_RRB_4_CS = "NOC_RRB_4_CS_ENABLE",
    parameter NOC_RRB_4_M20K_ID = 0,
    parameter NOC_RRB_4_NUM_M20K = "NOC_RRB_4_NUM_M20K_8_M20K",
    parameter NOC_RRB_4_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_4_START_ADDR =0,
    parameter NOC_RRB_4_USE_START_ADDR = "NOC_RRB_4_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_4_VALID = "NOC_RRB_4_VALID_INVALID",


    parameter NOC_RRB_5_CS = "NOC_RRB_5_CS_ENABLE",
    parameter NOC_RRB_5_M20K_ID = 0,
    parameter NOC_RRB_5_NUM_M20K = "NOC_RRB_5_NUM_M20K_8_M20K",
    parameter NOC_RRB_5_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_5_START_ADDR =0,
    parameter NOC_RRB_5_USE_START_ADDR = "NOC_RRB_5_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_5_VALID = "NOC_RRB_5_VALID_INVALID",

    parameter NOC_RRB_6_CS = "NOC_RRB_6_CS_ENABLE",
    parameter NOC_RRB_6_M20K_ID = 0,
    parameter NOC_RRB_6_NUM_M20K = "NOC_RRB_6_NUM_M20K_8_M20K",
    parameter NOC_RRB_6_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_6_START_ADDR =0,
    parameter NOC_RRB_6_USE_START_ADDR = "NOC_RRB_6_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_6_VALID = "NOC_RRB_6_VALID_INVALID",


    parameter NOC_RRB_7_CS = "NOC_RRB_7_CS_ENABLE",
    parameter NOC_RRB_7_M20K_ID = 0,
    parameter NOC_RRB_7_NUM_M20K = "NOC_RRB_7_NUM_M20K_8_M20K",
    parameter NOC_RRB_7_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_7_START_ADDR =0,
    parameter NOC_RRB_7_USE_START_ADDR = "NOC_RRB_7_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_7_VALID = "NOC_RRB_7_VALID_INVALID",

    parameter NOC_RRB_8_CS = "NOC_RRB_8_CS_ENABLE",
    parameter NOC_RRB_8_M20K_ID = 0,
    parameter NOC_RRB_8_NUM_M20K = "NOC_RRB_8_NUM_M20K_8_M20K",
    parameter NOC_RRB_8_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_8_START_ADDR =0,
    parameter NOC_RRB_8_USE_START_ADDR = "NOC_RRB_8_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_8_VALID = "NOC_RRB_8_VALID_INVALID",


    parameter NOC_RRB_9_CS = "NOC_RRB_9_CS_ENABLE",
    parameter NOC_RRB_9_M20K_ID = 0,
    parameter NOC_RRB_9_NUM_M20K = "NOC_RRB_9_NUM_M20K_8_M20K",
    parameter NOC_RRB_9_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_9_START_ADDR =0,
    parameter NOC_RRB_9_USE_START_ADDR = "NOC_RRB_9_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_9_VALID = "NOC_RRB_9_VALID_INVALID",

    parameter NOC_RRB_10_CS = "NOC_RRB_10_CS_ENABLE",
    parameter NOC_RRB_10_M20K_ID = 0,
    parameter NOC_RRB_10_NUM_M20K = "NOC_RRB_10_NUM_M20K_8_M20K",
    parameter NOC_RRB_10_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_10_START_ADDR =0,
    parameter NOC_RRB_10_USE_START_ADDR = "NOC_RRB_10_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_10_VALID = "NOC_RRB_10_VALID_INVALID",


    parameter NOC_RRB_11_CS = "NOC_RRB_11_CS_ENABLE",
    parameter NOC_RRB_11_M20K_ID = 0,
    parameter NOC_RRB_11_NUM_M20K = "NOC_RRB_11_NUM_M20K_8_M20K",
    parameter NOC_RRB_11_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_11_START_ADDR =0,
    parameter NOC_RRB_11_USE_START_ADDR = "NOC_RRB_11_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_11_VALID = "NOC_RRB_11_VALID_INVALID",


    parameter NOC_RRB_12_CS = "NOC_RRB_12_CS_ENABLE",
    parameter NOC_RRB_12_M20K_ID = 0,
    parameter NOC_RRB_12_NUM_M20K = "NOC_RRB_12_NUM_M20K_8_M20K",
    parameter NOC_RRB_12_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_12_START_ADDR =0,
    parameter NOC_RRB_12_USE_START_ADDR = "NOC_RRB_12_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_12_VALID = "NOC_RRB_12_VALID_INVALID",


    parameter NOC_RRB_13_CS = "NOC_RRB_13_CS_ENABLE",
    parameter NOC_RRB_13_M20K_ID = 0,
    parameter NOC_RRB_13_NUM_M20K = "NOC_RRB_13_NUM_M20K_8_M20K",
    parameter NOC_RRB_13_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_13_START_ADDR =0,
    parameter NOC_RRB_13_USE_START_ADDR = "NOC_RRB_13_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_13_VALID = "NOC_RRB_13_VALID_INVALID",

    parameter NOC_RRB_14_CS = "NOC_RRB_14_CS_ENABLE",
    parameter NOC_RRB_14_M20K_ID = 0,
    parameter NOC_RRB_14_NUM_M20K = "NOC_RRB_14_NUM_M20K_8_M20K",
    parameter NOC_RRB_14_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_14_START_ADDR =0,
    parameter NOC_RRB_14_USE_START_ADDR = "NOC_RRB_14_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_14_VALID = "NOC_RRB_14_VALID_INVALID",


    parameter NOC_RRB_15_CS = "NOC_RRB_15_CS_ENABLE",
    parameter NOC_RRB_15_M20K_ID = 0,
    parameter NOC_RRB_15_NUM_M20K = "NOC_RRB_15_NUM_M20K_8_M20K",
    parameter NOC_RRB_15_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_15_START_ADDR =0,
    parameter NOC_RRB_15_USE_START_ADDR = "NOC_RRB_15_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_15_VALID = "NOC_RRB_15_VALID_INVALID",


    parameter NOC_RRB_16_CS = "NOC_RRB_16_CS_ENABLE",
    parameter NOC_RRB_16_M20K_ID = 0,
    parameter NOC_RRB_16_NUM_M20K = "NOC_RRB_16_NUM_M20K_8_M20K",
    parameter NOC_RRB_16_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_16_START_ADDR =0,
    parameter NOC_RRB_16_USE_START_ADDR = "NOC_RRB_16_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_16_VALID = "NOC_RRB_16_VALID_INVALID",


    parameter NOC_RRB_17_CS = "NOC_RRB_17_CS_ENABLE",
    parameter NOC_RRB_17_M20K_ID = 0,
    parameter NOC_RRB_17_NUM_M20K = "NOC_RRB_17_NUM_M20K_8_M20K",
    parameter NOC_RRB_17_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_17_START_ADDR =0,
    parameter NOC_RRB_17_USE_START_ADDR = "NOC_RRB_17_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_17_VALID = "NOC_RRB_17_VALID_INVALID",


    parameter NOC_RRB_18_CS = "NOC_RRB_18_CS_ENABLE",
    parameter NOC_RRB_18_M20K_ID = 0,
    parameter NOC_RRB_18_NUM_M20K = "NOC_RRB_18_NUM_M20K_8_M20K",
    parameter NOC_RRB_18_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_18_START_ADDR =0,
    parameter NOC_RRB_18_USE_START_ADDR = "NOC_RRB_18_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_18_VALID = "NOC_RRB_18_VALID_INVALID",


    parameter NOC_RRB_19_CS = "NOC_RRB_19_CS_ENABLE",
    parameter NOC_RRB_19_M20K_ID = 0,
    parameter NOC_RRB_19_NUM_M20K = "NOC_RRB_19_NUM_M20K_8_M20K",
    parameter NOC_RRB_19_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_19_START_ADDR =0,
    parameter NOC_RRB_19_USE_START_ADDR = "NOC_RRB_19_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_19_VALID = "NOC_RRB_19_VALID_INVALID",

    parameter NOC_RRB_20_CS = "NOC_RRB_20_CS_ENABLE",
    parameter NOC_RRB_20_M20K_ID = 0,
    parameter NOC_RRB_20_NUM_M20K = "NOC_RRB_20_NUM_M20K_8_M20K",
    parameter NOC_RRB_20_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_20_START_ADDR =0,
    parameter NOC_RRB_20_USE_START_ADDR = "NOC_RRB_20_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_20_VALID = "NOC_RRB_20_VALID_INVALID",


    parameter NOC_RRB_21_CS = "NOC_RRB_21_CS_ENABLE",
    parameter NOC_RRB_21_M20K_ID = 0,
    parameter NOC_RRB_21_NUM_M20K = "NOC_RRB_21_NUM_M20K_8_M20K",
    parameter NOC_RRB_21_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_21_START_ADDR =0,
    parameter NOC_RRB_21_USE_START_ADDR = "NOC_RRB_21_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_21_VALID = "NOC_RRB_21_VALID_INVALID",

    parameter NOC_RRB_22_CS = "NOC_RRB_22_CS_ENABLE",
    parameter NOC_RRB_22_M20K_ID = 0,
    parameter NOC_RRB_22_NUM_M20K = "NOC_RRB_22_NUM_M20K_8_M20K",
    parameter NOC_RRB_22_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_22_START_ADDR =0,
    parameter NOC_RRB_22_USE_START_ADDR = "NOC_RRB_22_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_22_VALID = "NOC_RRB_22_VALID_INVALID",


    parameter NOC_RRB_23_CS = "NOC_RRB_23_CS_ENABLE",
    parameter NOC_RRB_23_M20K_ID = 0,
    parameter NOC_RRB_23_NUM_M20K = "NOC_RRB_23_NUM_M20K_8_M20K",
    parameter NOC_RRB_23_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_23_START_ADDR =0,
    parameter NOC_RRB_23_USE_START_ADDR = "NOC_RRB_23_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_23_VALID = "NOC_RRB_23_VALID_INVALID",

    parameter NOC_RRB_24_CS = "NOC_RRB_24_CS_ENABLE",
    parameter NOC_RRB_24_M20K_ID = 0,
    parameter NOC_RRB_24_NUM_M20K = "NOC_RRB_24_NUM_M20K_8_M20K",
    parameter NOC_RRB_24_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_24_START_ADDR =0,
    parameter NOC_RRB_24_USE_START_ADDR = "NOC_RRB_24_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_24_VALID = "NOC_RRB_24_VALID_INVALID",


    parameter NOC_RRB_25_CS = "NOC_RRB_25_CS_ENABLE",
    parameter NOC_RRB_25_M20K_ID = 0,
    parameter NOC_RRB_25_NUM_M20K = "NOC_RRB_25_NUM_M20K_8_M20K",
    parameter NOC_RRB_25_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_25_START_ADDR =0,
    parameter NOC_RRB_25_USE_START_ADDR = "NOC_RRB_25_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_25_VALID = "NOC_RRB_25_VALID_INVALID",

    parameter NOC_RRB_26_CS = "NOC_RRB_26_CS_ENABLE",
    parameter NOC_RRB_26_M20K_ID = 0,
    parameter NOC_RRB_26_NUM_M20K = "NOC_RRB_26_NUM_M20K_8_M20K",
    parameter NOC_RRB_26_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_26_START_ADDR =0,
    parameter NOC_RRB_26_USE_START_ADDR = "NOC_RRB_26_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_26_VALID = "NOC_RRB_26_VALID_INVALID",


    parameter NOC_RRB_27_CS = "NOC_RRB_27_CS_ENABLE",
    parameter NOC_RRB_27_M20K_ID = 0,
    parameter NOC_RRB_27_NUM_M20K = "NOC_RRB_27_NUM_M20K_8_M20K",
    parameter NOC_RRB_27_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_27_START_ADDR =0,
    parameter NOC_RRB_27_USE_START_ADDR = "NOC_RRB_27_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_27_VALID = "NOC_RRB_27_VALID_INVALID",

    parameter NOC_RRB_28_CS = "NOC_RRB_28_CS_ENABLE",
    parameter NOC_RRB_28_M20K_ID = 0,
    parameter NOC_RRB_28_NUM_M20K = "NOC_RRB_28_NUM_M20K_8_M20K",
    parameter NOC_RRB_28_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_28_START_ADDR =0,
    parameter NOC_RRB_28_USE_START_ADDR = "NOC_RRB_28_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_28_VALID = "NOC_RRB_28_VALID_INVALID",


    parameter NOC_RRB_29_CS = "NOC_RRB_29_CS_ENABLE",
    parameter NOC_RRB_29_M20K_ID = 0,
    parameter NOC_RRB_29_NUM_M20K = "NOC_RRB_29_NUM_M20K_8_M20K",
    parameter NOC_RRB_29_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_29_START_ADDR =0,
    parameter NOC_RRB_29_USE_START_ADDR = "NOC_RRB_29_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_29_VALID = "NOC_RRB_29_VALID_INVALID",

    parameter NOC_RRB_30_CS = "NOC_RRB_30_CS_ENABLE",
    parameter NOC_RRB_30_M20K_ID = 0,
    parameter NOC_RRB_30_NUM_M20K = "NOC_RRB_30_NUM_M20K_8_M20K",
    parameter NOC_RRB_30_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_30_START_ADDR =0,
    parameter NOC_RRB_30_USE_START_ADDR = "NOC_RRB_30_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_30_VALID = "NOC_RRB_30_VALID_INVALID",

    parameter NOC_RRB_31_CS = "NOC_RRB_31_CS_ENABLE",
    parameter NOC_RRB_31_M20K_ID = 0,
    parameter NOC_RRB_31_NUM_M20K = "NOC_RRB_31_NUM_M20K_8_M20K",
    parameter NOC_RRB_31_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_31_START_ADDR =0,
    parameter NOC_RRB_31_USE_START_ADDR = "NOC_RRB_31_USE_START_ADDR_DISABLE",
    parameter NOC_RRB_31_VALID = "NOC_RRB_31_VALID_INVALID",

    parameter NOC_RRB_32_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_33_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_34_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_35_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_36_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_37_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_38_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_39_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_40_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_41_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_42_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_43_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_44_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_45_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_46_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_47_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_48_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_49_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_50_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_51_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_52_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_53_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_54_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_55_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_56_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_57_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_58_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_59_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_60_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_61_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_62_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_RRB_63_NUM_M20K_WIDE = "DISABLED",

    parameter NOC_WRB_0_CS = "NOC_WRB_0_CS_ENABLE",
    parameter NOC_WRB_0_M20K_ID = 0,
    parameter NOC_WRB_0_NUM_M20K = "NOC_WRB_0_NUM_M20K_8_M20K",
    parameter NOC_WRB_0_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_0_START_ADDR =0,
    parameter NOC_WRB_0_USE_START_ADDR = "NOC_WRB_0_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_0_VALID = "NOC_WRB_0_VALID_INVALID",

    parameter NOC_WRB_1_CS = "NOC_WRB_1_CS_ENABLE",
    parameter NOC_WRB_1_M20K_ID = 0,
    parameter NOC_WRB_1_NUM_M20K = "NOC_WRB_1_NUM_M20K_8_M20K",
    parameter NOC_WRB_1_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_1_START_ADDR =0,
    parameter NOC_WRB_1_USE_START_ADDR = "NOC_WRB_1_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_1_VALID = "NOC_WRB_1_VALID_INVALID",

    parameter NOC_WRB_2_CS = "NOC_WRB_2_CS_ENABLE",
    parameter NOC_WRB_2_M20K_ID = 0,
    parameter NOC_WRB_2_NUM_M20K = "NOC_WRB_2_NUM_M20K_8_M20K",
    parameter NOC_WRB_2_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_2_START_ADDR =0,
    parameter NOC_WRB_2_USE_START_ADDR = "NOC_WRB_2_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_2_VALID = "NOC_WRB_2_VALID_INVALID",


    parameter NOC_WRB_3_CS = "NOC_WRB_3_CS_ENABLE",
    parameter NOC_WRB_3_M20K_ID = 0,
    parameter NOC_WRB_3_NUM_M20K = "NOC_WRB_3_NUM_M20K_8_M20K",
    parameter NOC_WRB_3_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_3_START_ADDR =0,
    parameter NOC_WRB_3_USE_START_ADDR = "NOC_WRB_3_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_3_VALID = "NOC_WRB_3_VALID_INVALID",


    parameter NOC_WRB_4_CS = "NOC_WRB_4_CS_ENABLE",
    parameter NOC_WRB_4_M20K_ID = 0,
    parameter NOC_WRB_4_NUM_M20K = "NOC_WRB_4_NUM_M20K_8_M20K",
    parameter NOC_WRB_4_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_4_START_ADDR =0,
    parameter NOC_WRB_4_USE_START_ADDR = "NOC_WRB_4_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_4_VALID = "NOC_WRB_4_VALID_INVALID",


    parameter NOC_WRB_5_CS = "NOC_WRB_5_CS_ENABLE",
    parameter NOC_WRB_5_M20K_ID = 0,
    parameter NOC_WRB_5_NUM_M20K = "NOC_WRB_5_NUM_M20K_8_M20K",
    parameter NOC_WRB_5_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_5_START_ADDR =0,
    parameter NOC_WRB_5_USE_START_ADDR = "NOC_WRB_5_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_5_VALID = "NOC_WRB_5_VALID_INVALID",

    parameter NOC_WRB_6_CS = "NOC_WRB_6_CS_ENABLE",
    parameter NOC_WRB_6_M20K_ID = 0,
    parameter NOC_WRB_6_NUM_M20K = "NOC_WRB_6_NUM_M20K_8_M20K",
    parameter NOC_WRB_6_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_6_START_ADDR =0,
    parameter NOC_WRB_6_USE_START_ADDR = "NOC_WRB_6_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_6_VALID = "NOC_WRB_6_VALID_INVALID",


    parameter NOC_WRB_7_CS = "NOC_WRB_7_CS_ENABLE",
    parameter NOC_WRB_7_M20K_ID = 0,
    parameter NOC_WRB_7_NUM_M20K = "NOC_WRB_7_NUM_M20K_8_M20K",
    parameter NOC_WRB_7_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_7_START_ADDR =0,
    parameter NOC_WRB_7_USE_START_ADDR = "NOC_WRB_7_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_7_VALID = "NOC_WRB_7_VALID_INVALID",

    parameter NOC_WRB_8_CS = "NOC_WRB_8_CS_ENABLE",
    parameter NOC_WRB_8_M20K_ID = 0,
    parameter NOC_WRB_8_NUM_M20K = "NOC_WRB_8_NUM_M20K_8_M20K",
    parameter NOC_WRB_8_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_8_START_ADDR =0,
    parameter NOC_WRB_8_USE_START_ADDR = "NOC_WRB_8_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_8_VALID = "NOC_WRB_8_VALID_INVALID",


    parameter NOC_WRB_9_CS = "NOC_WRB_9_CS_ENABLE",
    parameter NOC_WRB_9_M20K_ID = 0,
    parameter NOC_WRB_9_NUM_M20K = "NOC_WRB_9_NUM_M20K_8_M20K",
    parameter NOC_WRB_9_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_9_START_ADDR =0,
    parameter NOC_WRB_9_USE_START_ADDR = "NOC_WRB_9_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_9_VALID = "NOC_WRB_9_VALID_INVALID",

    parameter NOC_WRB_10_CS = "NOC_WRB_10_CS_ENABLE",
    parameter NOC_WRB_10_M20K_ID = 0,
    parameter NOC_WRB_10_NUM_M20K = "NOC_WRB_10_NUM_M20K_8_M20K",
    parameter NOC_WRB_10_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_10_START_ADDR =0,
    parameter NOC_WRB_10_USE_START_ADDR = "NOC_WRB_10_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_10_VALID = "NOC_WRB_10_VALID_INVALID",


    parameter NOC_WRB_11_CS = "NOC_WRB_11_CS_ENABLE",
    parameter NOC_WRB_11_M20K_ID = 0,
    parameter NOC_WRB_11_NUM_M20K = "NOC_WRB_11_NUM_M20K_8_M20K",
    parameter NOC_WRB_11_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_11_START_ADDR =0,
    parameter NOC_WRB_11_USE_START_ADDR = "NOC_WRB_11_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_11_VALID = "NOC_WRB_11_VALID_INVALID",


    parameter NOC_WRB_12_CS = "NOC_WRB_12_CS_ENABLE",
    parameter NOC_WRB_12_M20K_ID = 0,
    parameter NOC_WRB_12_NUM_M20K = "NOC_WRB_12_NUM_M20K_8_M20K",
    parameter NOC_WRB_12_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_12_START_ADDR =0,
    parameter NOC_WRB_12_USE_START_ADDR = "NOC_WRB_12_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_12_VALID = "NOC_WRB_12_VALID_INVALID",


    parameter NOC_WRB_13_CS = "NOC_WRB_13_CS_ENABLE",
    parameter NOC_WRB_13_M20K_ID = 0,
    parameter NOC_WRB_13_NUM_M20K = "NOC_WRB_13_NUM_M20K_8_M20K",
    parameter NOC_WRB_13_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_13_START_ADDR =0,
    parameter NOC_WRB_13_USE_START_ADDR = "NOC_WRB_13_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_13_VALID = "NOC_WRB_13_VALID_INVALID",

    parameter NOC_WRB_14_CS = "NOC_WRB_14_CS_ENABLE",
    parameter NOC_WRB_14_M20K_ID = 0,
    parameter NOC_WRB_14_NUM_M20K = "NOC_WRB_14_NUM_M20K_8_M20K",
    parameter NOC_WRB_14_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_14_START_ADDR =0,
    parameter NOC_WRB_14_USE_START_ADDR = "NOC_WRB_14_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_14_VALID = "NOC_WRB_14_VALID_INVALID",


    parameter NOC_WRB_15_CS = "NOC_WRB_15_CS_ENABLE",
    parameter NOC_WRB_15_M20K_ID = 0,
    parameter NOC_WRB_15_NUM_M20K = "NOC_WRB_15_NUM_M20K_8_M20K",
    parameter NOC_WRB_15_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_15_START_ADDR =0,
    parameter NOC_WRB_15_USE_START_ADDR = "NOC_WRB_15_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_15_VALID = "NOC_WRB_15_VALID_INVALID",


    parameter NOC_WRB_16_CS = "NOC_WRB_16_CS_ENABLE",
    parameter NOC_WRB_16_M20K_ID = 0,
    parameter NOC_WRB_16_NUM_M20K = "NOC_WRB_16_NUM_M20K_8_M20K",
    parameter NOC_WRB_16_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_16_START_ADDR =0,
    parameter NOC_WRB_16_USE_START_ADDR = "NOC_WRB_16_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_16_VALID = "NOC_WRB_16_VALID_INVALID",


    parameter NOC_WRB_17_CS = "NOC_WRB_17_CS_ENABLE",
    parameter NOC_WRB_17_M20K_ID = 0,
    parameter NOC_WRB_17_NUM_M20K = "NOC_WRB_17_NUM_M20K_8_M20K",
    parameter NOC_WRB_17_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_17_START_ADDR =0,
    parameter NOC_WRB_17_USE_START_ADDR = "NOC_WRB_17_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_17_VALID = "NOC_WRB_17_VALID_INVALID",


    parameter NOC_WRB_18_CS = "NOC_WRB_18_CS_ENABLE",
    parameter NOC_WRB_18_M20K_ID = 0,
    parameter NOC_WRB_18_NUM_M20K = "NOC_WRB_18_NUM_M20K_8_M20K",
    parameter NOC_WRB_18_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_18_START_ADDR =0,
    parameter NOC_WRB_18_USE_START_ADDR = "NOC_WRB_18_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_18_VALID = "NOC_WRB_18_VALID_INVALID",


    parameter NOC_WRB_19_CS = "NOC_WRB_19_CS_ENABLE",
    parameter NOC_WRB_19_M20K_ID = 0,
    parameter NOC_WRB_19_NUM_M20K = "NOC_WRB_19_NUM_M20K_8_M20K",
    parameter NOC_WRB_19_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_19_START_ADDR =0,
    parameter NOC_WRB_19_USE_START_ADDR = "NOC_WRB_19_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_19_VALID = "NOC_WRB_19_VALID_INVALID",

    parameter NOC_WRB_20_CS = "NOC_WRB_20_CS_ENABLE",
    parameter NOC_WRB_20_M20K_ID = 0,
    parameter NOC_WRB_20_NUM_M20K = "NOC_WRB_20_NUM_M20K_8_M20K",
    parameter NOC_WRB_20_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_20_START_ADDR =0,
    parameter NOC_WRB_20_USE_START_ADDR = "NOC_WRB_20_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_20_VALID = "NOC_WRB_20_VALID_INVALID",


    parameter NOC_WRB_21_CS = "NOC_WRB_21_CS_ENABLE",
    parameter NOC_WRB_21_M20K_ID = 0,
    parameter NOC_WRB_21_NUM_M20K = "NOC_WRB_21_NUM_M20K_8_M20K",
    parameter NOC_WRB_21_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_21_START_ADDR =0,
    parameter NOC_WRB_21_USE_START_ADDR = "NOC_WRB_21_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_21_VALID = "NOC_WRB_21_VALID_INVALID",

    parameter NOC_WRB_22_CS = "NOC_WRB_22_CS_ENABLE",
    parameter NOC_WRB_22_M20K_ID = 0,
    parameter NOC_WRB_22_NUM_M20K = "NOC_WRB_22_NUM_M20K_8_M20K",
    parameter NOC_WRB_22_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_22_START_ADDR =0,
    parameter NOC_WRB_22_USE_START_ADDR = "NOC_WRB_22_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_22_VALID = "NOC_WRB_22_VALID_INVALID",


    parameter NOC_WRB_23_CS = "NOC_WRB_23_CS_ENABLE",
    parameter NOC_WRB_23_M20K_ID = 0,
    parameter NOC_WRB_23_NUM_M20K = "NOC_WRB_23_NUM_M20K_8_M20K",
    parameter NOC_WRB_23_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_23_START_ADDR =0,
    parameter NOC_WRB_23_USE_START_ADDR = "NOC_WRB_23_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_23_VALID = "NOC_WRB_23_VALID_INVALID",

    parameter NOC_WRB_24_CS = "NOC_WRB_24_CS_ENABLE",
    parameter NOC_WRB_24_M20K_ID = 0,
    parameter NOC_WRB_24_NUM_M20K = "NOC_WRB_24_NUM_M20K_8_M20K",
    parameter NOC_WRB_24_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_24_START_ADDR =0,
    parameter NOC_WRB_24_USE_START_ADDR = "NOC_WRB_24_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_24_VALID = "NOC_WRB_24_VALID_INVALID",


    parameter NOC_WRB_25_CS = "NOC_WRB_25_CS_ENABLE",
    parameter NOC_WRB_25_M20K_ID = 0,
    parameter NOC_WRB_25_NUM_M20K = "NOC_WRB_25_NUM_M20K_8_M20K",
    parameter NOC_WRB_25_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_25_START_ADDR =0,
    parameter NOC_WRB_25_USE_START_ADDR = "NOC_WRB_25_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_25_VALID = "NOC_WRB_25_VALID_INVALID",

    parameter NOC_WRB_26_CS = "NOC_WRB_26_CS_ENABLE",
    parameter NOC_WRB_26_M20K_ID = 0,
    parameter NOC_WRB_26_NUM_M20K = "NOC_WRB_26_NUM_M20K_8_M20K",
    parameter NOC_WRB_26_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_26_START_ADDR =0,
    parameter NOC_WRB_26_USE_START_ADDR = "NOC_WRB_26_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_26_VALID = "NOC_WRB_26_VALID_INVALID",


    parameter NOC_WRB_27_CS = "NOC_WRB_27_CS_ENABLE",
    parameter NOC_WRB_27_M20K_ID = 0,
    parameter NOC_WRB_27_NUM_M20K = "NOC_WRB_27_NUM_M20K_8_M20K",
    parameter NOC_WRB_27_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_27_START_ADDR =0,
    parameter NOC_WRB_27_USE_START_ADDR = "NOC_WRB_27_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_27_VALID = "NOC_WRB_27_VALID_INVALID",

    parameter NOC_WRB_28_CS = "NOC_WRB_28_CS_ENABLE",
    parameter NOC_WRB_28_M20K_ID = 0,
    parameter NOC_WRB_28_NUM_M20K = "NOC_WRB_28_NUM_M20K_8_M20K",
    parameter NOC_WRB_28_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_28_START_ADDR =0,
    parameter NOC_WRB_28_USE_START_ADDR = "NOC_WRB_28_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_28_VALID = "NOC_WRB_28_VALID_INVALID",


    parameter NOC_WRB_29_CS = "NOC_WRB_29_CS_ENABLE",
    parameter NOC_WRB_29_M20K_ID = 0,
    parameter NOC_WRB_29_NUM_M20K = "NOC_WRB_29_NUM_M20K_8_M20K",
    parameter NOC_WRB_29_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_29_START_ADDR =0,
    parameter NOC_WRB_29_USE_START_ADDR = "NOC_WRB_29_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_29_VALID = "NOC_WRB_29_VALID_INVALID",

    parameter NOC_WRB_30_CS = "NOC_WRB_30_CS_ENABLE",
    parameter NOC_WRB_30_M20K_ID = 0,
    parameter NOC_WRB_30_NUM_M20K = "NOC_WRB_30_NUM_M20K_8_M20K",
    parameter NOC_WRB_30_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_30_START_ADDR =0,
    parameter NOC_WRB_30_USE_START_ADDR = "NOC_WRB_30_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_30_VALID = "NOC_WRB_30_VALID_INVALID",

    parameter NOC_WRB_31_CS = "NOC_WRB_31_CS_ENABLE",
    parameter NOC_WRB_31_M20K_ID = 0,
    parameter NOC_WRB_31_NUM_M20K = "NOC_WRB_31_NUM_M20K_8_M20K",
    parameter NOC_WRB_31_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_31_START_ADDR =0,
    parameter NOC_WRB_31_USE_START_ADDR = "NOC_WRB_31_USE_START_ADDR_DISABLE",
    parameter NOC_WRB_31_VALID = "NOC_WRB_31_VALID_INVALID",

    parameter NOC_WRB_32_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_33_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_34_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_35_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_36_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_37_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_38_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_39_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_40_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_41_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_42_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_43_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_44_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_45_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_46_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_47_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_48_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_49_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_50_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_51_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_52_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_53_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_54_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_55_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_56_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_57_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_58_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_59_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_60_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_61_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_62_NUM_M20K_WIDE = "DISABLED",
    parameter NOC_WRB_63_NUM_M20K_WIDE = "DISABLED",

    parameter NUM_UNOC_GROUPS = 0,

    parameter NUM_M20K_GROUP_0 = 8,
    parameter NUM_M20K_GROUP_1 = 8,
    parameter NUM_M20K_GROUP_2 = 8,
    parameter NUM_M20K_GROUP_3 = 8,
    parameter NUM_M20K_GROUP_4 = 8,
    parameter NUM_M20K_GROUP_5 = 8,
    parameter NUM_M20K_GROUP_6 = 8,
    parameter NUM_M20K_GROUP_7 = 8,
    parameter NUM_M20K_GROUP_8 = 8,
    parameter NUM_M20K_GROUP_9 = 8,
    parameter NUM_M20K_GROUP_10 = 8,
    parameter NUM_M20K_GROUP_11 = 8,
    parameter NUM_M20K_GROUP_12 = 8,
    parameter NUM_M20K_GROUP_13 = 8,
    parameter NUM_M20K_GROUP_14 = 8,
    parameter NUM_M20K_GROUP_15 = 8,
    parameter NUM_M20K_GROUP_16 = 8,
    parameter NUM_M20K_GROUP_17 = 8,
    parameter NUM_M20K_GROUP_18 = 8,
    parameter NUM_M20K_GROUP_19 = 8,
    parameter NUM_M20K_GROUP_20 = 8,
    parameter NUM_M20K_GROUP_21 = 8,
    parameter NUM_M20K_GROUP_22 = 8,
    parameter NUM_M20K_GROUP_23 = 8,
    parameter NUM_M20K_GROUP_24 = 8,
    parameter NUM_M20K_GROUP_25 = 8,
    parameter NUM_M20K_GROUP_26 = 8,
    parameter NUM_M20K_GROUP_27 = 8,
    parameter NUM_M20K_GROUP_28 = 8,
    parameter NUM_M20K_GROUP_29 = 8,
    parameter NUM_M20K_GROUP_30 = 8,
    parameter NUM_M20K_GROUP_31 = 8,
    
    parameter NUM_SUBGROUP_UNOC_GROUP_0 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_1 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_2 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_3 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_4 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_5 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_6 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_7 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_8 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_9 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_10 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_11 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_12 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_13 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_14 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_15 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_16 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_17 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_18 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_19 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_20 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_21 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_22 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_23 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_24 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_25 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_26 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_27 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_28 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_29 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_30 = 1,
    parameter NUM_SUBGROUP_UNOC_GROUP_31 = 1,

    //local parameters
    localparam NOC_INIU_ADAPTER_DATA_WIDTH_INT = (NOC_INIU_ADAPTER_DATA_WIDTH == "NOC_INIU_ADAPTER_DATA_WIDTH_32_BITS") ? 32 : 
                                                 (NOC_INIU_ADAPTER_DATA_WIDTH == "NOC_INIU_ADAPTER_DATA_WIDTH_64_BITS") ? 64 :
                                                 (NOC_INIU_ADAPTER_DATA_WIDTH == "NOC_INIU_ADAPTER_DATA_WIDTH_128_BITS") ? 128 :
                                                 (NOC_INIU_ADAPTER_DATA_WIDTH == "NOC_INIU_ADAPTER_DATA_WIDTH_256_BITS") ? 256 : 32
)(

    input logic clk,
    input logic reset,
    // AXI Slave Interface 
    input logic [AXI_WSTRB_WIDTH-1:0] request_wstrb,
    input logic request_arvalid,
    input logic [AXI_ADDR_WIDTH-1:0] request_araddr,
    input logic request_awvalid,
    input logic [AXI_AUSER_WIDTH-1:0] request_aruser,
    input logic request_wlast,
    input logic [7:0] request_awlen,
    input logic request_arlock,
    input logic [2:0] request_arprot,
    input logic request_wvalid,
    input logic [2:0] request_arsize,
    input logic [2:0] request_awsize,
    input logic [AXI_ID_WIDTH-1:0] request_awid,
    input logic [3:0] request_awqos,
    input logic [AXI_ADDR_WIDTH-1:0] request_awaddr,
    input logic [3:0] request_arqos,
    input logic [AXI_ID_WIDTH-1:0] request_arid,
    input logic request_awlock,
    input logic [2:0] request_awprot,
    input logic request_rready,
    input logic [NOC_INIU_ADAPTER_DATA_WIDTH_INT-1:0] request_wdata,
    input logic request_bready,
    input logic [1:0] request_arburst,
    input logic [7:0] request_arlen,
    input logic [AXI_USER_WIDTH -1:0] request_wuser,
    input logic [AXI_AUSER_WIDTH-1:0] request_awuser,
    input logic [1:0] request_awburst,

    output logic request_rlast,
    output logic [1:0] request_rresp,
    output logic request_awready,
    output logic [AXI_ID_WIDTH-1:0] request_bid,
    output logic request_rvalid,
    output logic request_wready,
    output logic [AXI_USER_WIDTH-1:0] request_ruser,
    output logic [AXI_ID_WIDTH-1:0] request_rid,
    output logic [1:0] request_bresp,
    output logic [NOC_INIU_ADAPTER_DATA_WIDTH_INT-1:0] request_rdata,
    output logic request_bvalid,
    output logic request_arready
);

    // When ENABLE_SECURITY == "OFF", Quartus legality checks require that bits 11-13 (otherwise used for SAI) are NOT connected
    // Note that if security is enabled and AXI_AUSER_WIDTH < 11, the necessary padding logic needs to be added below
    localparam AXI_AUSER_WIDTH_CHOSEN = (ENABLE_SECURITY != "OFF") ? (14) : AXI_AUSER_WIDTH;
    localparam int NUM_M20K_ARRAY [31:0] = {
        NUM_M20K_GROUP_31,
        NUM_M20K_GROUP_30,
        NUM_M20K_GROUP_29,
        NUM_M20K_GROUP_28,
        NUM_M20K_GROUP_27,
        NUM_M20K_GROUP_26,
        NUM_M20K_GROUP_25,
        NUM_M20K_GROUP_24,
        NUM_M20K_GROUP_23,
        NUM_M20K_GROUP_22,
        NUM_M20K_GROUP_21,
        NUM_M20K_GROUP_20,
        NUM_M20K_GROUP_19,
        NUM_M20K_GROUP_18,
        NUM_M20K_GROUP_17,
        NUM_M20K_GROUP_16,
        NUM_M20K_GROUP_15,
        NUM_M20K_GROUP_14,
        NUM_M20K_GROUP_13,
        NUM_M20K_GROUP_12,
        NUM_M20K_GROUP_11,
        NUM_M20K_GROUP_10,
        NUM_M20K_GROUP_9,
        NUM_M20K_GROUP_8,
        NUM_M20K_GROUP_7,
        NUM_M20K_GROUP_6,
        NUM_M20K_GROUP_5,
        NUM_M20K_GROUP_4,
        NUM_M20K_GROUP_3,
        NUM_M20K_GROUP_2,
        NUM_M20K_GROUP_1,
        NUM_M20K_GROUP_0
    };

    localparam int NUM_SUBGR_ARRAY [31:0] = {
        NUM_SUBGROUP_UNOC_GROUP_31,
        NUM_SUBGROUP_UNOC_GROUP_30,
        NUM_SUBGROUP_UNOC_GROUP_29,
        NUM_SUBGROUP_UNOC_GROUP_28,
        NUM_SUBGROUP_UNOC_GROUP_27,
        NUM_SUBGROUP_UNOC_GROUP_26,
        NUM_SUBGROUP_UNOC_GROUP_25,
        NUM_SUBGROUP_UNOC_GROUP_24,
        NUM_SUBGROUP_UNOC_GROUP_23,
        NUM_SUBGROUP_UNOC_GROUP_22,
        NUM_SUBGROUP_UNOC_GROUP_21,
        NUM_SUBGROUP_UNOC_GROUP_20,
        NUM_SUBGROUP_UNOC_GROUP_19,
        NUM_SUBGROUP_UNOC_GROUP_18,
        NUM_SUBGROUP_UNOC_GROUP_17,
        NUM_SUBGROUP_UNOC_GROUP_16,
        NUM_SUBGROUP_UNOC_GROUP_15,
        NUM_SUBGROUP_UNOC_GROUP_14,
        NUM_SUBGROUP_UNOC_GROUP_13,
        NUM_SUBGROUP_UNOC_GROUP_12,
        NUM_SUBGROUP_UNOC_GROUP_11,
        NUM_SUBGROUP_UNOC_GROUP_10,
        NUM_SUBGROUP_UNOC_GROUP_9,
        NUM_SUBGROUP_UNOC_GROUP_8,
        NUM_SUBGROUP_UNOC_GROUP_7,
        NUM_SUBGROUP_UNOC_GROUP_6,
        NUM_SUBGROUP_UNOC_GROUP_5,
        NUM_SUBGROUP_UNOC_GROUP_4,
        NUM_SUBGROUP_UNOC_GROUP_3,
        NUM_SUBGROUP_UNOC_GROUP_2,
        NUM_SUBGROUP_UNOC_GROUP_1,
        NUM_SUBGROUP_UNOC_GROUP_0
    };


    logic reset_i;
    logic [AXI_WSTRB_WIDTH-1:0] request_wstrb_i;
    logic request_arvalid_i;
    logic [AXI_ADDR_WIDTH-1:0] request_araddr_i;
    logic request_awvalid_i;
    logic [AXI_AUSER_WIDTH_CHOSEN-1:0] request_aruser_i;
    logic request_wlast_i;
    logic [7:0] request_awlen_i;
    logic request_arlock_i;
    logic request_wvalid_i;
    logic [2:0] request_arsize_i;
    logic [2:0] request_awsize_i;
    logic [AXI_ID_WIDTH-1:0] request_awid_i;
    logic [1:0] request_awqos_i;
    logic [AXI_ADDR_WIDTH-1:0] request_awaddr_i;
    logic [1:0] request_arqos_i;
    logic [AXI_ID_WIDTH-1:0] request_arid_i;
    logic request_awlock_i;
    logic request_rready_i;
    logic [NOC_INIU_ADAPTER_DATA_WIDTH_INT-1:0] request_wdata_i;
    logic request_bready_i;
    logic [1:0] request_arburst_i;
    logic [7:0] request_arlen_i;
    logic [AXI_USER_WIDTH -1:0] request_wuser_i;
    logic [AXI_AUSER_WIDTH_CHOSEN-1:0] request_awuser_i;
    logic [1:0] request_awburst_i;

    logic request_rlast_i;
    logic [1:0] request_rresp_i;
    logic request_awready_i;
    logic [AXI_ID_WIDTH-1:0] request_bid_i;
    logic request_rvalid_i;
    logic request_wready_i;
    logic [AXI_USER_WIDTH-1:0] request_ruser_i;
    logic [AXI_ID_WIDTH-1:0] request_rid_i;
    logic [1:0] request_bresp_i;
    logic [NOC_INIU_ADAPTER_DATA_WIDTH_INT-1:0] request_rdata_i;
    logic request_bvalid_i;
    logic request_arready_i;

    logic unoc_clk;

    // to backbone atom
    logic [31:0] ch0_unoc_wr_data_from_iniu;
    logic [31:0] ch1_unoc_wr_data_from_iniu;
    logic [31:0] ch2_unoc_wr_data_from_iniu;
    logic [31:0] ch3_unoc_wr_data_from_iniu;
    logic [31:0] ch4_unoc_wr_data_from_iniu;
    logic [31:0] ch5_unoc_wr_data_from_iniu;
    logic [31:0] ch6_unoc_wr_data_from_iniu;
    logic [31:0] ch7_unoc_wr_data_from_iniu;
    
    logic ch0_unoc_wr_enable_from_iniu;
    logic ch1_unoc_wr_enable_from_iniu;
    logic ch2_unoc_wr_enable_from_iniu;
    logic ch3_unoc_wr_enable_from_iniu;
    logic ch4_unoc_wr_enable_from_iniu;
    logic ch5_unoc_wr_enable_from_iniu;
    logic ch6_unoc_wr_enable_from_iniu;
    logic ch7_unoc_wr_enable_from_iniu;
    
    logic [8:0] ch0_unoc_wr_address_from_iniu;
    logic [8:0] ch1_unoc_wr_address_from_iniu;
    logic [8:0] ch2_unoc_wr_address_from_iniu;
    logic [8:0] ch3_unoc_wr_address_from_iniu;
    logic [8:0] ch4_unoc_wr_address_from_iniu;
    logic [8:0] ch5_unoc_wr_address_from_iniu;
    logic [8:0] ch6_unoc_wr_address_from_iniu;
    logic [8:0] ch7_unoc_wr_address_from_iniu;
    
    logic [5:0] ch0_unoc_group_id_from_iniu;
    logic [5:0] ch1_unoc_group_id_from_iniu;
    logic [5:0] ch2_unoc_group_id_from_iniu;
    logic [5:0] ch3_unoc_group_id_from_iniu;
    logic [5:0] ch4_unoc_group_id_from_iniu;
    logic [5:0] ch5_unoc_group_id_from_iniu;
    logic [5:0] ch6_unoc_group_id_from_iniu;
    logic [5:0] ch7_unoc_group_id_from_iniu;

    logic ch0_unoc_rd_enable_to_unoc_backbone;
    logic ch1_unoc_rd_enable_to_unoc_backbone;
    logic ch2_unoc_rd_enable_to_unoc_backbone;
    logic ch3_unoc_rd_enable_to_unoc_backbone;
    logic ch4_unoc_rd_enable_to_unoc_backbone;
    logic ch5_unoc_rd_enable_to_unoc_backbone;
    logic ch6_unoc_rd_enable_to_unoc_backbone;
    logic ch7_unoc_rd_enable_to_unoc_backbone;
    
    logic [10:0] ch0_unoc_rd_address_to_unoc_backbone;
    logic [10:0] ch1_unoc_rd_address_to_unoc_backbone;
    logic [10:0] ch2_unoc_rd_address_to_unoc_backbone;
    logic [10:0] ch3_unoc_rd_address_to_unoc_backbone;
    logic [10:0] ch4_unoc_rd_address_to_unoc_backbone;
    logic [10:0] ch5_unoc_rd_address_to_unoc_backbone;
    logic [10:0] ch6_unoc_rd_address_to_unoc_backbone;
    logic [10:0] ch7_unoc_rd_address_to_unoc_backbone;
    
    logic [1:0] ch0_unoc_beats_to_unoc_backbone;
    logic [1:0] ch1_unoc_beats_to_unoc_backbone;
    logic [1:0] ch2_unoc_beats_to_unoc_backbone;
    logic [1:0] ch3_unoc_beats_to_unoc_backbone;
    logic [1:0] ch4_unoc_beats_to_unoc_backbone;
    logic [1:0] ch5_unoc_beats_to_unoc_backbone;
    logic [1:0] ch6_unoc_beats_to_unoc_backbone;
    logic [1:0] ch7_unoc_beats_to_unoc_backbone;

    // from backbone to iniu
    logic [7:0] ch0_unoc_rd_data_from_unoc_backbone;
    logic [7:0] ch1_unoc_rd_data_from_unoc_backbone;
    logic [7:0] ch2_unoc_rd_data_from_unoc_backbone;
    logic [7:0] ch3_unoc_rd_data_from_unoc_backbone;
    logic [7:0] ch4_unoc_rd_data_from_unoc_backbone;
    logic [7:0] ch5_unoc_rd_data_from_unoc_backbone;
    logic [7:0] ch6_unoc_rd_data_from_unoc_backbone;
    logic [7:0] ch7_unoc_rd_data_from_unoc_backbone;
    
    logic ch0_unoc_rd_data_valid_from_unoc_backbone;
    logic ch1_unoc_rd_data_valid_from_unoc_backbone;
    logic ch2_unoc_rd_data_valid_from_unoc_backbone;
    logic ch3_unoc_rd_data_valid_from_unoc_backbone;
    logic ch4_unoc_rd_data_valid_from_unoc_backbone;
    logic ch5_unoc_rd_data_valid_from_unoc_backbone;
    logic ch6_unoc_rd_data_valid_from_unoc_backbone;
    logic ch7_unoc_rd_data_valid_from_unoc_backbone; 

    // to the m20k wrapper
    logic [511:0] unoc_rd_data_from_m20k_0;
    logic [511:0] unoc_rd_data_from_m20k_1;
    logic [511:0] unoc_rd_data_from_m20k_2;
    logic [511:0] unoc_rd_data_from_m20k_3;
    logic [511:0] unoc_rd_data_from_m20k_4;
    logic [511:0] unoc_rd_data_from_m20k_5;
    logic [511:0] unoc_rd_data_from_m20k_6;
    logic [511:0] unoc_rd_data_from_m20k_7;
    logic [511:0] unoc_rd_data_from_m20k_8;
    logic [511:0] unoc_rd_data_from_m20k_9;
    logic [511:0] unoc_rd_data_from_m20k_10;
    logic [511:0] unoc_rd_data_from_m20k_11;
    logic [511:0] unoc_rd_data_from_m20k_12;
    logic [511:0] unoc_rd_data_from_m20k_13;
    logic [511:0] unoc_rd_data_from_m20k_14;
    logic [511:0] unoc_rd_data_from_m20k_15;

    logic [63:0] unoc_rd_data_valid_from_m20k_0;
    logic [63:0] unoc_rd_data_valid_from_m20k_1;
    logic [63:0] unoc_rd_data_valid_from_m20k_2;
    logic [63:0] unoc_rd_data_valid_from_m20k_3;
    logic [63:0] unoc_rd_data_valid_from_m20k_4;
    logic [63:0] unoc_rd_data_valid_from_m20k_5;
    logic [63:0] unoc_rd_data_valid_from_m20k_6;
    logic [63:0] unoc_rd_data_valid_from_m20k_7;
    logic [63:0] unoc_rd_data_valid_from_m20k_8;
    logic [63:0] unoc_rd_data_valid_from_m20k_9;
    logic [63:0] unoc_rd_data_valid_from_m20k_10;
    logic [63:0] unoc_rd_data_valid_from_m20k_11;
    logic [63:0] unoc_rd_data_valid_from_m20k_12;
    logic [63:0] unoc_rd_data_valid_from_m20k_13;
    logic [63:0] unoc_rd_data_valid_from_m20k_14;
    logic [63:0] unoc_rd_data_valid_from_m20k_15;

    logic [31:0] unoc_wr_data_to_m20k_0;
    logic [31:0] unoc_wr_data_to_m20k_1;
    logic [31:0] unoc_wr_data_to_m20k_2;
    logic [31:0] unoc_wr_data_to_m20k_3;
    logic [31:0] unoc_wr_data_to_m20k_4;
    logic [31:0] unoc_wr_data_to_m20k_5;
    logic [31:0] unoc_wr_data_to_m20k_6;
    logic [31:0] unoc_wr_data_to_m20k_7;
    logic [31:0] unoc_wr_data_to_m20k_8;
    logic [31:0] unoc_wr_data_to_m20k_9;
    logic [31:0] unoc_wr_data_to_m20k_10;
    logic [31:0] unoc_wr_data_to_m20k_11;
    logic [31:0] unoc_wr_data_to_m20k_12;
    logic [31:0] unoc_wr_data_to_m20k_13;
    logic [31:0] unoc_wr_data_to_m20k_14;
    logic [31:0] unoc_wr_data_to_m20k_15;

    logic unoc_wr_enable_to_m20k_0;
    logic unoc_wr_enable_to_m20k_1;
    logic unoc_wr_enable_to_m20k_2;
    logic unoc_wr_enable_to_m20k_3;
    logic unoc_wr_enable_to_m20k_4;
    logic unoc_wr_enable_to_m20k_5;
    logic unoc_wr_enable_to_m20k_6;
    logic unoc_wr_enable_to_m20k_7;
    logic unoc_wr_enable_to_m20k_8;
    logic unoc_wr_enable_to_m20k_9;
    logic unoc_wr_enable_to_m20k_10;
    logic unoc_wr_enable_to_m20k_11;
    logic unoc_wr_enable_to_m20k_12;
    logic unoc_wr_enable_to_m20k_13;
    logic unoc_wr_enable_to_m20k_14;
    logic unoc_wr_enable_to_m20k_15;

    logic [8:0] unoc_wr_address_to_m20k_0;
    logic [8:0] unoc_wr_address_to_m20k_1;
    logic [8:0] unoc_wr_address_to_m20k_2;
    logic [8:0] unoc_wr_address_to_m20k_3;
    logic [8:0] unoc_wr_address_to_m20k_4;
    logic [8:0] unoc_wr_address_to_m20k_5;
    logic [8:0] unoc_wr_address_to_m20k_6;
    logic [8:0] unoc_wr_address_to_m20k_7;
    logic [8:0] unoc_wr_address_to_m20k_8;
    logic [8:0] unoc_wr_address_to_m20k_9;
    logic [8:0] unoc_wr_address_to_m20k_10;
    logic [8:0] unoc_wr_address_to_m20k_11;
    logic [8:0] unoc_wr_address_to_m20k_12;
    logic [8:0] unoc_wr_address_to_m20k_13;
    logic [8:0] unoc_wr_address_to_m20k_14;
    logic [8:0] unoc_wr_address_to_m20k_15;

    logic [5:0] unoc_wr_group_id_to_m20k_0;
    logic [5:0] unoc_wr_group_id_to_m20k_1;
    logic [5:0] unoc_wr_group_id_to_m20k_2;
    logic [5:0] unoc_wr_group_id_to_m20k_3;
    logic [5:0] unoc_wr_group_id_to_m20k_4;
    logic [5:0] unoc_wr_group_id_to_m20k_5;
    logic [5:0] unoc_wr_group_id_to_m20k_6;
    logic [5:0] unoc_wr_group_id_to_m20k_7;
    logic [5:0] unoc_wr_group_id_to_m20k_8;
    logic [5:0] unoc_wr_group_id_to_m20k_9;
    logic [5:0] unoc_wr_group_id_to_m20k_10;
    logic [5:0] unoc_wr_group_id_to_m20k_11;
    logic [5:0] unoc_wr_group_id_to_m20k_12;
    logic [5:0] unoc_wr_group_id_to_m20k_13;
    logic [5:0] unoc_wr_group_id_to_m20k_14;
    logic [5:0] unoc_wr_group_id_to_m20k_15;

    logic unoc_rd_enable_to_m20k_0;
    logic unoc_rd_enable_to_m20k_1;
    logic unoc_rd_enable_to_m20k_2;
    logic unoc_rd_enable_to_m20k_3;
    logic unoc_rd_enable_to_m20k_4;
    logic unoc_rd_enable_to_m20k_5;
    logic unoc_rd_enable_to_m20k_6;
    logic unoc_rd_enable_to_m20k_7;
    logic unoc_rd_enable_to_m20k_8;
    logic unoc_rd_enable_to_m20k_9;
    logic unoc_rd_enable_to_m20k_10;
    logic unoc_rd_enable_to_m20k_11;
    logic unoc_rd_enable_to_m20k_12;
    logic unoc_rd_enable_to_m20k_13;
    logic unoc_rd_enable_to_m20k_14;
    logic unoc_rd_enable_to_m20k_15;

    logic [10:0] unoc_rd_address_to_m20k_0;
    logic [10:0] unoc_rd_address_to_m20k_1;
    logic [10:0] unoc_rd_address_to_m20k_2;
    logic [10:0] unoc_rd_address_to_m20k_3;
    logic [10:0] unoc_rd_address_to_m20k_4;
    logic [10:0] unoc_rd_address_to_m20k_5;
    logic [10:0] unoc_rd_address_to_m20k_6;
    logic [10:0] unoc_rd_address_to_m20k_7;
    logic [10:0] unoc_rd_address_to_m20k_8;
    logic [10:0] unoc_rd_address_to_m20k_9;
    logic [10:0] unoc_rd_address_to_m20k_10;
    logic [10:0] unoc_rd_address_to_m20k_11;
    logic [10:0] unoc_rd_address_to_m20k_12;
    logic [10:0] unoc_rd_address_to_m20k_13;
    logic [10:0] unoc_rd_address_to_m20k_14;
    logic [10:0] unoc_rd_address_to_m20k_15;

    logic [5:0] unoc_rd_group_id_to_m20k_0;
    logic [5:0] unoc_rd_group_id_to_m20k_1;
    logic [5:0] unoc_rd_group_id_to_m20k_2;
    logic [5:0] unoc_rd_group_id_to_m20k_3;
    logic [5:0] unoc_rd_group_id_to_m20k_4;
    logic [5:0] unoc_rd_group_id_to_m20k_5;
    logic [5:0] unoc_rd_group_id_to_m20k_6;
    logic [5:0] unoc_rd_group_id_to_m20k_7;
    logic [5:0] unoc_rd_group_id_to_m20k_8;
    logic [5:0] unoc_rd_group_id_to_m20k_9;
    logic [5:0] unoc_rd_group_id_to_m20k_10;
    logic [5:0] unoc_rd_group_id_to_m20k_11;
    logic [5:0] unoc_rd_group_id_to_m20k_12;
    logic [5:0] unoc_rd_group_id_to_m20k_13;
    logic [5:0] unoc_rd_group_id_to_m20k_14;
    logic [5:0] unoc_rd_group_id_to_m20k_15;

    logic [1:0] unoc_beats_to_m20k_0;
    logic [1:0] unoc_beats_to_m20k_1;
    logic [1:0] unoc_beats_to_m20k_2;
    logic [1:0] unoc_beats_to_m20k_3;
    logic [1:0] unoc_beats_to_m20k_4;
    logic [1:0] unoc_beats_to_m20k_5;
    logic [1:0] unoc_beats_to_m20k_6;
    logic [1:0] unoc_beats_to_m20k_7;
    logic [1:0] unoc_beats_to_m20k_8;
    logic [1:0] unoc_beats_to_m20k_9;
    logic [1:0] unoc_beats_to_m20k_10;
    logic [1:0] unoc_beats_to_m20k_11;
    logic [1:0] unoc_beats_to_m20k_12;
    logic [1:0] unoc_beats_to_m20k_13;
    logic [1:0] unoc_beats_to_m20k_14;
    logic [1:0] unoc_beats_to_m20k_15;



 
     (* altera_attribute = {"-name FORCE_HYPER_REGISTER_FOR_PERIPHERY_CORE_TRANSFER ON; -name FORCE_HYPER_REGISTER_FOR_CORE_PERIPHERY_TRANSFER ON; -name NOC_INITIATOR ON"} *) tennm_noc_initiator # (
        .NOC_QOS_MODE  (NOC_QOS_MODE),
        .NOC_QOS_WRITE_PRIORITY (NOC_QOS_WRITE_PRIORITY),
        .NOC_QOS_READ_PRIORITY ( NOC_QOS_READ_PRIORITY),
        .NOC_INIU_ADAPTER_DATA_WIDTH (NOC_INIU_ADAPTER_DATA_WIDTH), 
        .NOC_INIU_WUSER_ECC_EN (NOC_INIU_WUSER_ECC_EN),    
        .NOC_AXI_PIPELINE_CNT (NOC_AXI_PIPELINE_CNT),
        .NOC_INIU_UNOC_EN (NOC_INIU_UNOC_EN),
        .NOC_INIU_UNOC_CLK_SEL (NOC_INIU_UNOC_CLK_SEL),
        .AXI_ADDR_WIDTH        (AXI_ADDR_WIDTH ),
        .AXI_WSTRB_WIDTH       (AXI_WSTRB_WIDTH),
        .AXI_AUSER_WIDTH       (AXI_AUSER_WIDTH_CHOSEN),
        .AXI_USER_WIDTH        (AXI_USER_WIDTH ),
        .AXI_ID_WIDTH          (AXI_ID_WIDTH   ),

        .NOC_INIU_UNOC_ONLY_AXI_READ(NOC_INIU_UNOC_ONLY_AXI_READ),
        .NOC_RRB_0_CS(NOC_RRB_0_CS),
        .NOC_RRB_0_M20K_ID(NOC_RRB_0_M20K_ID),
        .NOC_RRB_0_NUM_M20K(NOC_RRB_0_NUM_M20K),
        .NOC_RRB_0_NUM_M20K_WIDE(NOC_RRB_0_NUM_M20K_WIDE),
        .NOC_RRB_0_START_ADDR(NOC_RRB_0_START_ADDR),
        .NOC_RRB_0_USE_START_ADDR(NOC_RRB_0_USE_START_ADDR),
        .NOC_RRB_0_VALID(NOC_RRB_0_VALID),
    
        .NOC_RRB_1_CS(NOC_RRB_1_CS),
        .NOC_RRB_1_M20K_ID(NOC_RRB_1_M20K_ID),
        .NOC_RRB_1_NUM_M20K(NOC_RRB_1_NUM_M20K),
        .NOC_RRB_1_NUM_M20K_WIDE(NOC_RRB_1_NUM_M20K_WIDE),
        .NOC_RRB_1_START_ADDR(NOC_RRB_1_START_ADDR),
        .NOC_RRB_1_USE_START_ADDR(NOC_RRB_1_USE_START_ADDR),
        .NOC_RRB_1_VALID(NOC_RRB_1_VALID),
    
        .NOC_RRB_2_CS(NOC_RRB_2_CS),
        .NOC_RRB_2_M20K_ID(NOC_RRB_2_M20K_ID),
        .NOC_RRB_2_NUM_M20K(NOC_RRB_2_NUM_M20K),
        .NOC_RRB_2_NUM_M20K_WIDE(NOC_RRB_2_NUM_M20K_WIDE),
        .NOC_RRB_2_START_ADDR(NOC_RRB_2_START_ADDR),
        .NOC_RRB_2_USE_START_ADDR(NOC_RRB_2_USE_START_ADDR),
        .NOC_RRB_2_VALID(NOC_RRB_2_VALID),
    
        .NOC_RRB_3_CS(NOC_RRB_3_CS),
        .NOC_RRB_3_M20K_ID(NOC_RRB_3_M20K_ID),
        .NOC_RRB_3_NUM_M20K(NOC_RRB_3_NUM_M20K),
        .NOC_RRB_3_NUM_M20K_WIDE(NOC_RRB_3_NUM_M20K_WIDE),
        .NOC_RRB_3_START_ADDR(NOC_RRB_3_START_ADDR),
        .NOC_RRB_3_USE_START_ADDR(NOC_RRB_3_USE_START_ADDR),
        .NOC_RRB_3_VALID(NOC_RRB_3_VALID),
    
        .NOC_RRB_4_CS(NOC_RRB_4_CS),
        .NOC_RRB_4_M20K_ID(NOC_RRB_4_M20K_ID),
        .NOC_RRB_4_NUM_M20K(NOC_RRB_4_NUM_M20K),
        .NOC_RRB_4_NUM_M20K_WIDE(NOC_RRB_4_NUM_M20K_WIDE),
        .NOC_RRB_4_START_ADDR(NOC_RRB_4_START_ADDR),
        .NOC_RRB_4_USE_START_ADDR(NOC_RRB_4_USE_START_ADDR),
        .NOC_RRB_4_VALID(NOC_RRB_4_VALID),
    
        .NOC_RRB_5_CS(NOC_RRB_5_CS),
        .NOC_RRB_5_M20K_ID(NOC_RRB_5_M20K_ID),
        .NOC_RRB_5_NUM_M20K(NOC_RRB_5_NUM_M20K),
        .NOC_RRB_5_NUM_M20K_WIDE(NOC_RRB_5_NUM_M20K_WIDE),
        .NOC_RRB_5_START_ADDR(NOC_RRB_5_START_ADDR),
        .NOC_RRB_5_USE_START_ADDR(NOC_RRB_5_USE_START_ADDR),
        .NOC_RRB_5_VALID(NOC_RRB_5_VALID),
    
        .NOC_RRB_6_CS(NOC_RRB_6_CS),
        .NOC_RRB_6_M20K_ID(NOC_RRB_6_M20K_ID),
        .NOC_RRB_6_NUM_M20K(NOC_RRB_6_NUM_M20K),
        .NOC_RRB_6_NUM_M20K_WIDE(NOC_RRB_6_NUM_M20K_WIDE),
        .NOC_RRB_6_START_ADDR(NOC_RRB_6_START_ADDR),
        .NOC_RRB_6_USE_START_ADDR(NOC_RRB_6_USE_START_ADDR),
        .NOC_RRB_6_VALID(NOC_RRB_6_VALID),
    
        .NOC_RRB_7_CS(NOC_RRB_7_CS),
        .NOC_RRB_7_M20K_ID(NOC_RRB_7_M20K_ID),
        .NOC_RRB_7_NUM_M20K(NOC_RRB_7_NUM_M20K),
        .NOC_RRB_7_NUM_M20K_WIDE(NOC_RRB_7_NUM_M20K_WIDE),
        .NOC_RRB_7_START_ADDR(NOC_RRB_7_START_ADDR),
        .NOC_RRB_7_USE_START_ADDR(NOC_RRB_7_USE_START_ADDR),
        .NOC_RRB_7_VALID(NOC_RRB_7_VALID),
    
        .NOC_RRB_8_CS(NOC_RRB_8_CS),
        .NOC_RRB_8_M20K_ID(NOC_RRB_8_M20K_ID),
        .NOC_RRB_8_NUM_M20K(NOC_RRB_8_NUM_M20K),
        .NOC_RRB_8_NUM_M20K_WIDE(NOC_RRB_8_NUM_M20K_WIDE),
        .NOC_RRB_8_START_ADDR(NOC_RRB_8_START_ADDR),
        .NOC_RRB_8_USE_START_ADDR(NOC_RRB_8_USE_START_ADDR),
        .NOC_RRB_8_VALID(NOC_RRB_8_VALID),
    
        .NOC_RRB_9_CS(NOC_RRB_9_CS),
        .NOC_RRB_9_M20K_ID(NOC_RRB_9_M20K_ID),
        .NOC_RRB_9_NUM_M20K(NOC_RRB_9_NUM_M20K),
        .NOC_RRB_9_NUM_M20K_WIDE(NOC_RRB_9_NUM_M20K_WIDE),
        .NOC_RRB_9_START_ADDR(NOC_RRB_9_START_ADDR),
        .NOC_RRB_9_USE_START_ADDR(NOC_RRB_9_USE_START_ADDR),
        .NOC_RRB_9_VALID(NOC_RRB_9_VALID),
    
        .NOC_RRB_10_CS(NOC_RRB_10_CS),
        .NOC_RRB_10_M20K_ID(NOC_RRB_10_M20K_ID),
        .NOC_RRB_10_NUM_M20K(NOC_RRB_10_NUM_M20K),
        .NOC_RRB_10_NUM_M20K_WIDE(NOC_RRB_10_NUM_M20K_WIDE),
        .NOC_RRB_10_START_ADDR(NOC_RRB_10_START_ADDR),
        .NOC_RRB_10_USE_START_ADDR(NOC_RRB_10_USE_START_ADDR),
        .NOC_RRB_10_VALID(NOC_RRB_10_VALID),
    
        .NOC_RRB_11_CS(NOC_RRB_11_CS),
        .NOC_RRB_11_M20K_ID(NOC_RRB_11_M20K_ID),
        .NOC_RRB_11_NUM_M20K(NOC_RRB_11_NUM_M20K),
        .NOC_RRB_11_NUM_M20K_WIDE(NOC_RRB_11_NUM_M20K_WIDE),
        .NOC_RRB_11_START_ADDR(NOC_RRB_11_START_ADDR),
        .NOC_RRB_11_USE_START_ADDR(NOC_RRB_11_USE_START_ADDR),
        .NOC_RRB_11_VALID(NOC_RRB_11_VALID),
    
        .NOC_RRB_12_CS(NOC_RRB_12_CS),
        .NOC_RRB_12_M20K_ID(NOC_RRB_12_M20K_ID),
        .NOC_RRB_12_NUM_M20K(NOC_RRB_12_NUM_M20K),
        .NOC_RRB_12_NUM_M20K_WIDE(NOC_RRB_12_NUM_M20K_WIDE),
        .NOC_RRB_12_START_ADDR(NOC_RRB_12_START_ADDR),
        .NOC_RRB_12_USE_START_ADDR(NOC_RRB_12_USE_START_ADDR),
        .NOC_RRB_12_VALID(NOC_RRB_12_VALID),
    
        .NOC_RRB_13_CS(NOC_RRB_13_CS),
        .NOC_RRB_13_M20K_ID(NOC_RRB_13_M20K_ID),
        .NOC_RRB_13_NUM_M20K(NOC_RRB_13_NUM_M20K),
        .NOC_RRB_13_NUM_M20K_WIDE(NOC_RRB_13_NUM_M20K_WIDE),
        .NOC_RRB_13_START_ADDR(NOC_RRB_13_START_ADDR),
        .NOC_RRB_13_USE_START_ADDR(NOC_RRB_13_USE_START_ADDR),
        .NOC_RRB_13_VALID(NOC_RRB_13_VALID),
    
        .NOC_RRB_14_CS(NOC_RRB_14_CS),
        .NOC_RRB_14_M20K_ID(NOC_RRB_14_M20K_ID),
        .NOC_RRB_14_NUM_M20K(NOC_RRB_14_NUM_M20K),
        .NOC_RRB_14_NUM_M20K_WIDE(NOC_RRB_14_NUM_M20K_WIDE),
        .NOC_RRB_14_START_ADDR(NOC_RRB_14_START_ADDR),
        .NOC_RRB_14_USE_START_ADDR(NOC_RRB_14_USE_START_ADDR),
        .NOC_RRB_14_VALID(NOC_RRB_14_VALID),
    
        .NOC_RRB_15_CS(NOC_RRB_15_CS),
        .NOC_RRB_15_M20K_ID(NOC_RRB_15_M20K_ID),
        .NOC_RRB_15_NUM_M20K(NOC_RRB_15_NUM_M20K),
        .NOC_RRB_15_NUM_M20K_WIDE(NOC_RRB_15_NUM_M20K_WIDE),
        .NOC_RRB_15_START_ADDR(NOC_RRB_15_START_ADDR),
        .NOC_RRB_15_USE_START_ADDR(NOC_RRB_15_USE_START_ADDR),
        .NOC_RRB_15_VALID(NOC_RRB_15_VALID),
    
        .NOC_RRB_16_CS(NOC_RRB_16_CS),
        .NOC_RRB_16_M20K_ID(NOC_RRB_16_M20K_ID),
        .NOC_RRB_16_NUM_M20K(NOC_RRB_16_NUM_M20K),
        .NOC_RRB_16_NUM_M20K_WIDE(NOC_RRB_16_NUM_M20K_WIDE),
        .NOC_RRB_16_START_ADDR(NOC_RRB_16_START_ADDR),
        .NOC_RRB_16_USE_START_ADDR(NOC_RRB_16_USE_START_ADDR),
        .NOC_RRB_16_VALID(NOC_RRB_16_VALID),
    
        .NOC_RRB_17_CS(NOC_RRB_17_CS),
        .NOC_RRB_17_M20K_ID(NOC_RRB_17_M20K_ID),
        .NOC_RRB_17_NUM_M20K(NOC_RRB_17_NUM_M20K),
        .NOC_RRB_17_NUM_M20K_WIDE(NOC_RRB_17_NUM_M20K_WIDE),
        .NOC_RRB_17_START_ADDR(NOC_RRB_17_START_ADDR),
        .NOC_RRB_17_USE_START_ADDR(NOC_RRB_17_USE_START_ADDR),
        .NOC_RRB_17_VALID(NOC_RRB_17_VALID),
            
        .NOC_RRB_18_CS(NOC_RRB_18_CS),
        .NOC_RRB_18_M20K_ID(NOC_RRB_18_M20K_ID),
        .NOC_RRB_18_NUM_M20K(NOC_RRB_18_NUM_M20K),
        .NOC_RRB_18_NUM_M20K_WIDE(NOC_RRB_18_NUM_M20K_WIDE),
        .NOC_RRB_18_START_ADDR(NOC_RRB_18_START_ADDR),
        .NOC_RRB_18_USE_START_ADDR(NOC_RRB_18_USE_START_ADDR),
        .NOC_RRB_18_VALID(NOC_RRB_18_VALID),
            
        .NOC_RRB_19_CS(NOC_RRB_19_CS),
        .NOC_RRB_19_M20K_ID(NOC_RRB_19_M20K_ID),
        .NOC_RRB_19_NUM_M20K(NOC_RRB_19_NUM_M20K),
        .NOC_RRB_19_NUM_M20K_WIDE(NOC_RRB_19_NUM_M20K_WIDE),
        .NOC_RRB_19_START_ADDR(NOC_RRB_19_START_ADDR),
        .NOC_RRB_19_USE_START_ADDR(NOC_RRB_19_USE_START_ADDR),
        .NOC_RRB_19_VALID(NOC_RRB_19_VALID),
            
        .NOC_RRB_20_CS(NOC_RRB_20_CS),
        .NOC_RRB_20_M20K_ID(NOC_RRB_20_M20K_ID),
        .NOC_RRB_20_NUM_M20K(NOC_RRB_20_NUM_M20K),
        .NOC_RRB_20_NUM_M20K_WIDE(NOC_RRB_20_NUM_M20K_WIDE),
        .NOC_RRB_20_START_ADDR(NOC_RRB_20_START_ADDR),
        .NOC_RRB_20_USE_START_ADDR(NOC_RRB_20_USE_START_ADDR),
        .NOC_RRB_20_VALID(NOC_RRB_20_VALID),
            
        .NOC_RRB_21_CS(NOC_RRB_21_CS),
        .NOC_RRB_21_M20K_ID(NOC_RRB_21_M20K_ID),
        .NOC_RRB_21_NUM_M20K(NOC_RRB_21_NUM_M20K),
        .NOC_RRB_21_NUM_M20K_WIDE(NOC_RRB_21_NUM_M20K_WIDE),
        .NOC_RRB_21_START_ADDR(NOC_RRB_21_START_ADDR),
        .NOC_RRB_21_USE_START_ADDR(NOC_RRB_21_USE_START_ADDR),
        .NOC_RRB_21_VALID(NOC_RRB_21_VALID),
            
        .NOC_RRB_22_CS(NOC_RRB_22_CS),
        .NOC_RRB_22_M20K_ID(NOC_RRB_22_M20K_ID),
        .NOC_RRB_22_NUM_M20K(NOC_RRB_22_NUM_M20K),
        .NOC_RRB_22_NUM_M20K_WIDE(NOC_RRB_22_NUM_M20K_WIDE),
        .NOC_RRB_22_START_ADDR(NOC_RRB_22_START_ADDR),
        .NOC_RRB_22_USE_START_ADDR(NOC_RRB_22_USE_START_ADDR),
        .NOC_RRB_22_VALID(NOC_RRB_22_VALID),
            
        .NOC_RRB_23_CS(NOC_RRB_23_CS),
        .NOC_RRB_23_M20K_ID(NOC_RRB_23_M20K_ID),
        .NOC_RRB_23_NUM_M20K(NOC_RRB_23_NUM_M20K),
        .NOC_RRB_23_NUM_M20K_WIDE(NOC_RRB_23_NUM_M20K_WIDE),
        .NOC_RRB_23_START_ADDR(NOC_RRB_23_START_ADDR),
        .NOC_RRB_23_USE_START_ADDR(NOC_RRB_23_USE_START_ADDR),
        .NOC_RRB_23_VALID(NOC_RRB_23_VALID),
            
        .NOC_RRB_24_CS(NOC_RRB_24_CS),
        .NOC_RRB_24_M20K_ID(NOC_RRB_24_M20K_ID),
        .NOC_RRB_24_NUM_M20K(NOC_RRB_24_NUM_M20K),
        .NOC_RRB_24_NUM_M20K_WIDE(NOC_RRB_24_NUM_M20K_WIDE),
        .NOC_RRB_24_START_ADDR(NOC_RRB_24_START_ADDR),
        .NOC_RRB_24_USE_START_ADDR(NOC_RRB_24_USE_START_ADDR),
        .NOC_RRB_24_VALID(NOC_RRB_24_VALID),
            
        .NOC_RRB_25_CS(NOC_RRB_25_CS),
        .NOC_RRB_25_M20K_ID(NOC_RRB_25_M20K_ID),
        .NOC_RRB_25_NUM_M20K(NOC_RRB_25_NUM_M20K),
        .NOC_RRB_25_NUM_M20K_WIDE(NOC_RRB_25_NUM_M20K_WIDE),
        .NOC_RRB_25_START_ADDR(NOC_RRB_25_START_ADDR),
        .NOC_RRB_25_USE_START_ADDR(NOC_RRB_25_USE_START_ADDR),
        .NOC_RRB_25_VALID(NOC_RRB_25_VALID),
            
        .NOC_RRB_26_CS(NOC_RRB_26_CS),
        .NOC_RRB_26_M20K_ID(NOC_RRB_26_M20K_ID),
        .NOC_RRB_26_NUM_M20K(NOC_RRB_26_NUM_M20K),
        .NOC_RRB_26_NUM_M20K_WIDE(NOC_RRB_26_NUM_M20K_WIDE),
        .NOC_RRB_26_START_ADDR(NOC_RRB_26_START_ADDR),
        .NOC_RRB_26_USE_START_ADDR(NOC_RRB_26_USE_START_ADDR),
        .NOC_RRB_26_VALID(NOC_RRB_26_VALID),
            
        .NOC_RRB_27_CS(NOC_RRB_27_CS),
        .NOC_RRB_27_M20K_ID(NOC_RRB_27_M20K_ID),
        .NOC_RRB_27_NUM_M20K(NOC_RRB_27_NUM_M20K),
        .NOC_RRB_27_NUM_M20K_WIDE(NOC_RRB_27_NUM_M20K_WIDE),
        .NOC_RRB_27_START_ADDR(NOC_RRB_27_START_ADDR),
        .NOC_RRB_27_USE_START_ADDR(NOC_RRB_27_USE_START_ADDR),
        .NOC_RRB_27_VALID(NOC_RRB_27_VALID),
            
        .NOC_RRB_28_CS(NOC_RRB_28_CS),
        .NOC_RRB_28_M20K_ID(NOC_RRB_28_M20K_ID),
        .NOC_RRB_28_NUM_M20K(NOC_RRB_28_NUM_M20K),
        .NOC_RRB_28_NUM_M20K_WIDE(NOC_RRB_28_NUM_M20K_WIDE),
        .NOC_RRB_28_START_ADDR(NOC_RRB_28_START_ADDR),
        .NOC_RRB_28_USE_START_ADDR(NOC_RRB_28_USE_START_ADDR),
        .NOC_RRB_28_VALID(NOC_RRB_28_VALID),
            
        .NOC_RRB_29_CS(NOC_RRB_29_CS),
        .NOC_RRB_29_M20K_ID(NOC_RRB_29_M20K_ID),
        .NOC_RRB_29_NUM_M20K(NOC_RRB_29_NUM_M20K),
        .NOC_RRB_29_NUM_M20K_WIDE(NOC_RRB_29_NUM_M20K_WIDE),
        .NOC_RRB_29_START_ADDR(NOC_RRB_29_START_ADDR),
        .NOC_RRB_29_USE_START_ADDR(NOC_RRB_29_USE_START_ADDR),
        .NOC_RRB_29_VALID(NOC_RRB_29_VALID),
            
        .NOC_RRB_30_CS(NOC_RRB_30_CS),
        .NOC_RRB_30_M20K_ID(NOC_RRB_30_M20K_ID),
        .NOC_RRB_30_NUM_M20K(NOC_RRB_30_NUM_M20K),
        .NOC_RRB_30_NUM_M20K_WIDE(NOC_RRB_30_NUM_M20K_WIDE),
        .NOC_RRB_30_START_ADDR(NOC_RRB_30_START_ADDR),
        .NOC_RRB_30_USE_START_ADDR(NOC_RRB_30_USE_START_ADDR),
        .NOC_RRB_30_VALID(NOC_RRB_30_VALID),
    
        .NOC_RRB_31_CS(NOC_RRB_31_CS),
        .NOC_RRB_31_M20K_ID(NOC_RRB_31_M20K_ID),
        .NOC_RRB_31_NUM_M20K(NOC_RRB_31_NUM_M20K),
        .NOC_RRB_31_NUM_M20K_WIDE(NOC_RRB_31_NUM_M20K_WIDE),
        .NOC_RRB_31_START_ADDR(NOC_RRB_31_START_ADDR),
        .NOC_RRB_31_USE_START_ADDR(NOC_RRB_31_USE_START_ADDR),
        .NOC_RRB_31_VALID(NOC_RRB_31_VALID),

        .NOC_RRB_32_NUM_M20K_WIDE(NOC_RRB_32_NUM_M20K_WIDE),
        .NOC_RRB_33_NUM_M20K_WIDE(NOC_RRB_33_NUM_M20K_WIDE),
        .NOC_RRB_34_NUM_M20K_WIDE(NOC_RRB_34_NUM_M20K_WIDE),
        .NOC_RRB_35_NUM_M20K_WIDE(NOC_RRB_35_NUM_M20K_WIDE),
        .NOC_RRB_36_NUM_M20K_WIDE(NOC_RRB_36_NUM_M20K_WIDE),
        .NOC_RRB_37_NUM_M20K_WIDE(NOC_RRB_37_NUM_M20K_WIDE),
        .NOC_RRB_38_NUM_M20K_WIDE(NOC_RRB_38_NUM_M20K_WIDE),
        .NOC_RRB_39_NUM_M20K_WIDE(NOC_RRB_39_NUM_M20K_WIDE),
        .NOC_RRB_40_NUM_M20K_WIDE(NOC_RRB_40_NUM_M20K_WIDE),
        .NOC_RRB_41_NUM_M20K_WIDE(NOC_RRB_41_NUM_M20K_WIDE),
        .NOC_RRB_42_NUM_M20K_WIDE(NOC_RRB_42_NUM_M20K_WIDE),
        .NOC_RRB_43_NUM_M20K_WIDE(NOC_RRB_43_NUM_M20K_WIDE),
        .NOC_RRB_44_NUM_M20K_WIDE(NOC_RRB_44_NUM_M20K_WIDE),
        .NOC_RRB_45_NUM_M20K_WIDE(NOC_RRB_45_NUM_M20K_WIDE),
        .NOC_RRB_46_NUM_M20K_WIDE(NOC_RRB_46_NUM_M20K_WIDE),
        .NOC_RRB_47_NUM_M20K_WIDE(NOC_RRB_47_NUM_M20K_WIDE),
        .NOC_RRB_48_NUM_M20K_WIDE(NOC_RRB_48_NUM_M20K_WIDE),
        .NOC_RRB_49_NUM_M20K_WIDE(NOC_RRB_49_NUM_M20K_WIDE),
        .NOC_RRB_50_NUM_M20K_WIDE(NOC_RRB_50_NUM_M20K_WIDE),
        .NOC_RRB_51_NUM_M20K_WIDE(NOC_RRB_51_NUM_M20K_WIDE),
        .NOC_RRB_52_NUM_M20K_WIDE(NOC_RRB_52_NUM_M20K_WIDE),
        .NOC_RRB_53_NUM_M20K_WIDE(NOC_RRB_53_NUM_M20K_WIDE),
        .NOC_RRB_54_NUM_M20K_WIDE(NOC_RRB_54_NUM_M20K_WIDE),
        .NOC_RRB_55_NUM_M20K_WIDE(NOC_RRB_55_NUM_M20K_WIDE),
        .NOC_RRB_56_NUM_M20K_WIDE(NOC_RRB_56_NUM_M20K_WIDE),
        .NOC_RRB_57_NUM_M20K_WIDE(NOC_RRB_57_NUM_M20K_WIDE),
        .NOC_RRB_58_NUM_M20K_WIDE(NOC_RRB_58_NUM_M20K_WIDE),
        .NOC_RRB_59_NUM_M20K_WIDE(NOC_RRB_59_NUM_M20K_WIDE),
        .NOC_RRB_60_NUM_M20K_WIDE(NOC_RRB_60_NUM_M20K_WIDE),
        .NOC_RRB_61_NUM_M20K_WIDE(NOC_RRB_61_NUM_M20K_WIDE),
        .NOC_RRB_62_NUM_M20K_WIDE(NOC_RRB_62_NUM_M20K_WIDE),
        .NOC_RRB_63_NUM_M20K_WIDE(NOC_RRB_63_NUM_M20K_WIDE),

        .NOC_WRB_0_CS(NOC_WRB_0_CS),
        .NOC_WRB_0_M20K_ID(NOC_WRB_0_M20K_ID),
        .NOC_WRB_0_NUM_M20K(NOC_WRB_0_NUM_M20K),
        .NOC_WRB_0_NUM_M20K_WIDE(NOC_WRB_0_NUM_M20K_WIDE),
        .NOC_WRB_0_START_ADDR(NOC_WRB_0_START_ADDR),
        .NOC_WRB_0_USE_START_ADDR(NOC_WRB_0_USE_START_ADDR),
        .NOC_WRB_0_VALID(NOC_WRB_0_VALID),
    
        .NOC_WRB_1_CS(NOC_WRB_1_CS),
        .NOC_WRB_1_M20K_ID(NOC_WRB_1_M20K_ID),
        .NOC_WRB_1_NUM_M20K(NOC_WRB_1_NUM_M20K),
        .NOC_WRB_1_NUM_M20K_WIDE(NOC_WRB_1_NUM_M20K_WIDE),
        .NOC_WRB_1_START_ADDR(NOC_WRB_1_START_ADDR),
        .NOC_WRB_1_USE_START_ADDR(NOC_WRB_1_USE_START_ADDR),
        .NOC_WRB_1_VALID(NOC_WRB_1_VALID),
    
        .NOC_WRB_2_CS(NOC_WRB_2_CS),
        .NOC_WRB_2_M20K_ID(NOC_WRB_2_M20K_ID),
        .NOC_WRB_2_NUM_M20K(NOC_WRB_2_NUM_M20K),
        .NOC_WRB_2_NUM_M20K_WIDE(NOC_WRB_2_NUM_M20K_WIDE),
        .NOC_WRB_2_START_ADDR(NOC_WRB_2_START_ADDR),
        .NOC_WRB_2_USE_START_ADDR(NOC_WRB_2_USE_START_ADDR),
        .NOC_WRB_2_VALID(NOC_WRB_2_VALID),
    
        .NOC_WRB_3_CS(NOC_WRB_3_CS),
        .NOC_WRB_3_M20K_ID(NOC_WRB_3_M20K_ID),
        .NOC_WRB_3_NUM_M20K(NOC_WRB_3_NUM_M20K),
        .NOC_WRB_3_NUM_M20K_WIDE(NOC_WRB_3_NUM_M20K_WIDE),
        .NOC_WRB_3_START_ADDR(NOC_WRB_3_START_ADDR),
        .NOC_WRB_3_USE_START_ADDR(NOC_WRB_3_USE_START_ADDR),
        .NOC_WRB_3_VALID(NOC_WRB_3_VALID),
    
        .NOC_WRB_4_CS(NOC_WRB_4_CS),
        .NOC_WRB_4_M20K_ID(NOC_WRB_4_M20K_ID),
        .NOC_WRB_4_NUM_M20K(NOC_WRB_4_NUM_M20K),
        .NOC_WRB_4_NUM_M20K_WIDE(NOC_WRB_4_NUM_M20K_WIDE),
        .NOC_WRB_4_START_ADDR(NOC_WRB_4_START_ADDR),
        .NOC_WRB_4_USE_START_ADDR(NOC_WRB_4_USE_START_ADDR),
        .NOC_WRB_4_VALID(NOC_WRB_4_VALID),
    
        .NOC_WRB_5_CS(NOC_WRB_5_CS),
        .NOC_WRB_5_M20K_ID(NOC_WRB_5_M20K_ID),
        .NOC_WRB_5_NUM_M20K(NOC_WRB_5_NUM_M20K),
        .NOC_WRB_5_NUM_M20K_WIDE(NOC_WRB_5_NUM_M20K_WIDE),
        .NOC_WRB_5_START_ADDR(NOC_WRB_5_START_ADDR),
        .NOC_WRB_5_USE_START_ADDR(NOC_WRB_5_USE_START_ADDR),
        .NOC_WRB_5_VALID(NOC_WRB_5_VALID),
    
        .NOC_WRB_6_CS(NOC_WRB_6_CS),
        .NOC_WRB_6_M20K_ID(NOC_WRB_6_M20K_ID),
        .NOC_WRB_6_NUM_M20K(NOC_WRB_6_NUM_M20K),
        .NOC_WRB_6_NUM_M20K_WIDE(NOC_WRB_6_NUM_M20K_WIDE),
        .NOC_WRB_6_START_ADDR(NOC_WRB_6_START_ADDR),
        .NOC_WRB_6_USE_START_ADDR(NOC_WRB_6_USE_START_ADDR),
        .NOC_WRB_6_VALID(NOC_WRB_6_VALID),
    
        .NOC_WRB_7_CS(NOC_WRB_7_CS),
        .NOC_WRB_7_M20K_ID(NOC_WRB_7_M20K_ID),
        .NOC_WRB_7_NUM_M20K(NOC_WRB_7_NUM_M20K),
        .NOC_WRB_7_NUM_M20K_WIDE(NOC_WRB_7_NUM_M20K_WIDE),
        .NOC_WRB_7_START_ADDR(NOC_WRB_7_START_ADDR),
        .NOC_WRB_7_USE_START_ADDR(NOC_WRB_7_USE_START_ADDR),
        .NOC_WRB_7_VALID(NOC_WRB_7_VALID),
    
        .NOC_WRB_8_CS(NOC_WRB_8_CS),
        .NOC_WRB_8_M20K_ID(NOC_WRB_8_M20K_ID),
        .NOC_WRB_8_NUM_M20K(NOC_WRB_8_NUM_M20K),
        .NOC_WRB_8_NUM_M20K_WIDE(NOC_WRB_8_NUM_M20K_WIDE),
        .NOC_WRB_8_START_ADDR(NOC_WRB_8_START_ADDR),
        .NOC_WRB_8_USE_START_ADDR(NOC_WRB_8_USE_START_ADDR),
        .NOC_WRB_8_VALID(NOC_WRB_8_VALID),
    
        .NOC_WRB_9_CS(NOC_WRB_9_CS),
        .NOC_WRB_9_M20K_ID(NOC_WRB_9_M20K_ID),
        .NOC_WRB_9_NUM_M20K(NOC_WRB_9_NUM_M20K),
        .NOC_WRB_9_NUM_M20K_WIDE(NOC_WRB_9_NUM_M20K_WIDE),
        .NOC_WRB_9_START_ADDR(NOC_WRB_9_START_ADDR),
        .NOC_WRB_9_USE_START_ADDR(NOC_WRB_9_USE_START_ADDR),
        .NOC_WRB_9_VALID(NOC_WRB_9_VALID),
    
        .NOC_WRB_10_CS(NOC_WRB_10_CS),
        .NOC_WRB_10_M20K_ID(NOC_WRB_10_M20K_ID),
        .NOC_WRB_10_NUM_M20K(NOC_WRB_10_NUM_M20K),
        .NOC_WRB_10_NUM_M20K_WIDE(NOC_WRB_10_NUM_M20K_WIDE),
        .NOC_WRB_10_START_ADDR(NOC_WRB_10_START_ADDR),
        .NOC_WRB_10_USE_START_ADDR(NOC_WRB_10_USE_START_ADDR),
        .NOC_WRB_10_VALID(NOC_WRB_10_VALID),
    
        .NOC_WRB_11_CS(NOC_WRB_11_CS),
        .NOC_WRB_11_M20K_ID(NOC_WRB_11_M20K_ID),
        .NOC_WRB_11_NUM_M20K(NOC_WRB_11_NUM_M20K),
        .NOC_WRB_11_NUM_M20K_WIDE(NOC_WRB_11_NUM_M20K_WIDE),
        .NOC_WRB_11_START_ADDR(NOC_WRB_11_START_ADDR),
        .NOC_WRB_11_USE_START_ADDR(NOC_WRB_11_USE_START_ADDR),
        .NOC_WRB_11_VALID(NOC_WRB_11_VALID),
    
        .NOC_WRB_12_CS(NOC_WRB_12_CS),
        .NOC_WRB_12_M20K_ID(NOC_WRB_12_M20K_ID),
        .NOC_WRB_12_NUM_M20K(NOC_WRB_12_NUM_M20K),
        .NOC_WRB_12_NUM_M20K_WIDE(NOC_WRB_12_NUM_M20K_WIDE),
        .NOC_WRB_12_START_ADDR(NOC_WRB_12_START_ADDR),
        .NOC_WRB_12_USE_START_ADDR(NOC_WRB_12_USE_START_ADDR),
        .NOC_WRB_12_VALID(NOC_WRB_12_VALID),
    
        .NOC_WRB_13_CS(NOC_WRB_13_CS),
        .NOC_WRB_13_M20K_ID(NOC_WRB_13_M20K_ID),
        .NOC_WRB_13_NUM_M20K(NOC_WRB_13_NUM_M20K),
        .NOC_WRB_13_NUM_M20K_WIDE(NOC_WRB_13_NUM_M20K_WIDE),
        .NOC_WRB_13_START_ADDR(NOC_WRB_13_START_ADDR),
        .NOC_WRB_13_USE_START_ADDR(NOC_WRB_13_USE_START_ADDR),
        .NOC_WRB_13_VALID(NOC_WRB_13_VALID),
    
        .NOC_WRB_14_CS(NOC_WRB_14_CS),
        .NOC_WRB_14_M20K_ID(NOC_WRB_14_M20K_ID),
        .NOC_WRB_14_NUM_M20K(NOC_WRB_14_NUM_M20K),
        .NOC_WRB_14_NUM_M20K_WIDE(NOC_WRB_14_NUM_M20K_WIDE),
        .NOC_WRB_14_START_ADDR(NOC_WRB_14_START_ADDR),
        .NOC_WRB_14_USE_START_ADDR(NOC_WRB_14_USE_START_ADDR),
        .NOC_WRB_14_VALID(NOC_WRB_14_VALID),
    
        .NOC_WRB_15_CS(NOC_WRB_15_CS),
        .NOC_WRB_15_M20K_ID(NOC_WRB_15_M20K_ID),
        .NOC_WRB_15_NUM_M20K(NOC_WRB_15_NUM_M20K),
        .NOC_WRB_15_NUM_M20K_WIDE(NOC_WRB_15_NUM_M20K_WIDE),
        .NOC_WRB_15_START_ADDR(NOC_WRB_15_START_ADDR),
        .NOC_WRB_15_USE_START_ADDR(NOC_WRB_15_USE_START_ADDR),
        .NOC_WRB_15_VALID(NOC_WRB_15_VALID),
    
        .NOC_WRB_16_CS(NOC_WRB_16_CS),
        .NOC_WRB_16_M20K_ID(NOC_WRB_16_M20K_ID),
        .NOC_WRB_16_NUM_M20K(NOC_WRB_16_NUM_M20K),
        .NOC_WRB_16_NUM_M20K_WIDE(NOC_WRB_16_NUM_M20K_WIDE),
        .NOC_WRB_16_START_ADDR(NOC_WRB_16_START_ADDR),
        .NOC_WRB_16_USE_START_ADDR(NOC_WRB_16_USE_START_ADDR),
        .NOC_WRB_16_VALID(NOC_WRB_16_VALID),
    
        .NOC_WRB_17_CS(NOC_WRB_17_CS),
        .NOC_WRB_17_M20K_ID(NOC_WRB_17_M20K_ID),
        .NOC_WRB_17_NUM_M20K(NOC_WRB_17_NUM_M20K),
        .NOC_WRB_17_NUM_M20K_WIDE(NOC_WRB_17_NUM_M20K_WIDE),
        .NOC_WRB_17_START_ADDR(NOC_WRB_17_START_ADDR),
        .NOC_WRB_17_USE_START_ADDR(NOC_WRB_17_USE_START_ADDR),
        .NOC_WRB_17_VALID(NOC_WRB_17_VALID),
            
        .NOC_WRB_18_CS(NOC_WRB_18_CS),
        .NOC_WRB_18_M20K_ID(NOC_WRB_18_M20K_ID),
        .NOC_WRB_18_NUM_M20K(NOC_WRB_18_NUM_M20K),
        .NOC_WRB_18_NUM_M20K_WIDE(NOC_WRB_18_NUM_M20K_WIDE),
        .NOC_WRB_18_START_ADDR(NOC_WRB_18_START_ADDR),
        .NOC_WRB_18_USE_START_ADDR(NOC_WRB_18_USE_START_ADDR),
        .NOC_WRB_18_VALID(NOC_WRB_18_VALID),
            
        .NOC_WRB_19_CS(NOC_WRB_19_CS),
        .NOC_WRB_19_M20K_ID(NOC_WRB_19_M20K_ID),
        .NOC_WRB_19_NUM_M20K(NOC_WRB_19_NUM_M20K),
        .NOC_WRB_19_NUM_M20K_WIDE(NOC_WRB_19_NUM_M20K_WIDE),
        .NOC_WRB_19_START_ADDR(NOC_WRB_19_START_ADDR),
        .NOC_WRB_19_USE_START_ADDR(NOC_WRB_19_USE_START_ADDR),
        .NOC_WRB_19_VALID(NOC_WRB_19_VALID),
            
        .NOC_WRB_20_CS(NOC_WRB_20_CS),
        .NOC_WRB_20_M20K_ID(NOC_WRB_20_M20K_ID),
        .NOC_WRB_20_NUM_M20K(NOC_WRB_20_NUM_M20K),
        .NOC_WRB_20_NUM_M20K_WIDE(NOC_WRB_20_NUM_M20K_WIDE),
        .NOC_WRB_20_START_ADDR(NOC_WRB_20_START_ADDR),
        .NOC_WRB_20_USE_START_ADDR(NOC_WRB_20_USE_START_ADDR),
        .NOC_WRB_20_VALID(NOC_WRB_20_VALID),
            
        .NOC_WRB_21_CS(NOC_WRB_21_CS),
        .NOC_WRB_21_M20K_ID(NOC_WRB_21_M20K_ID),
        .NOC_WRB_21_NUM_M20K(NOC_WRB_21_NUM_M20K),
        .NOC_WRB_21_NUM_M20K_WIDE(NOC_WRB_21_NUM_M20K_WIDE),
        .NOC_WRB_21_START_ADDR(NOC_WRB_21_START_ADDR),
        .NOC_WRB_21_USE_START_ADDR(NOC_WRB_21_USE_START_ADDR),
        .NOC_WRB_21_VALID(NOC_WRB_21_VALID),
            
        .NOC_WRB_22_CS(NOC_WRB_22_CS),
        .NOC_WRB_22_M20K_ID(NOC_WRB_22_M20K_ID),
        .NOC_WRB_22_NUM_M20K(NOC_WRB_22_NUM_M20K),
        .NOC_WRB_22_NUM_M20K_WIDE(NOC_WRB_22_NUM_M20K_WIDE),
        .NOC_WRB_22_START_ADDR(NOC_WRB_22_START_ADDR),
        .NOC_WRB_22_USE_START_ADDR(NOC_WRB_22_USE_START_ADDR),
        .NOC_WRB_22_VALID(NOC_WRB_22_VALID),
            
        .NOC_WRB_23_CS(NOC_WRB_23_CS),
        .NOC_WRB_23_M20K_ID(NOC_WRB_23_M20K_ID),
        .NOC_WRB_23_NUM_M20K(NOC_WRB_23_NUM_M20K),
        .NOC_WRB_23_NUM_M20K_WIDE(NOC_WRB_23_NUM_M20K_WIDE),
        .NOC_WRB_23_START_ADDR(NOC_WRB_23_START_ADDR),
        .NOC_WRB_23_USE_START_ADDR(NOC_WRB_23_USE_START_ADDR),
        .NOC_WRB_23_VALID(NOC_WRB_23_VALID),
            
        .NOC_WRB_24_CS(NOC_WRB_24_CS),
        .NOC_WRB_24_M20K_ID(NOC_WRB_24_M20K_ID),
        .NOC_WRB_24_NUM_M20K(NOC_WRB_24_NUM_M20K),
        .NOC_WRB_24_NUM_M20K_WIDE(NOC_WRB_24_NUM_M20K_WIDE),
        .NOC_WRB_24_START_ADDR(NOC_WRB_24_START_ADDR),
        .NOC_WRB_24_USE_START_ADDR(NOC_WRB_24_USE_START_ADDR),
        .NOC_WRB_24_VALID(NOC_WRB_24_VALID),
            
        .NOC_WRB_25_CS(NOC_WRB_25_CS),
        .NOC_WRB_25_M20K_ID(NOC_WRB_25_M20K_ID),
        .NOC_WRB_25_NUM_M20K(NOC_WRB_25_NUM_M20K),
        .NOC_WRB_25_NUM_M20K_WIDE(NOC_WRB_25_NUM_M20K_WIDE),
        .NOC_WRB_25_START_ADDR(NOC_WRB_25_START_ADDR),
        .NOC_WRB_25_USE_START_ADDR(NOC_WRB_25_USE_START_ADDR),
        .NOC_WRB_25_VALID(NOC_WRB_25_VALID),
            
        .NOC_WRB_26_CS(NOC_WRB_26_CS),
        .NOC_WRB_26_M20K_ID(NOC_WRB_26_M20K_ID),
        .NOC_WRB_26_NUM_M20K(NOC_WRB_26_NUM_M20K),
        .NOC_WRB_26_NUM_M20K_WIDE(NOC_WRB_26_NUM_M20K_WIDE),
        .NOC_WRB_26_START_ADDR(NOC_WRB_26_START_ADDR),
        .NOC_WRB_26_USE_START_ADDR(NOC_WRB_26_USE_START_ADDR),
        .NOC_WRB_26_VALID(NOC_WRB_26_VALID),
            
        .NOC_WRB_27_CS(NOC_WRB_27_CS),
        .NOC_WRB_27_M20K_ID(NOC_WRB_27_M20K_ID),
        .NOC_WRB_27_NUM_M20K(NOC_WRB_27_NUM_M20K),
        .NOC_WRB_27_NUM_M20K_WIDE(NOC_WRB_27_NUM_M20K_WIDE),
        .NOC_WRB_27_START_ADDR(NOC_WRB_27_START_ADDR),
        .NOC_WRB_27_USE_START_ADDR(NOC_WRB_27_USE_START_ADDR),
        .NOC_WRB_27_VALID(NOC_WRB_27_VALID),
            
        .NOC_WRB_28_CS(NOC_WRB_28_CS),
        .NOC_WRB_28_M20K_ID(NOC_WRB_28_M20K_ID),
        .NOC_WRB_28_NUM_M20K(NOC_WRB_28_NUM_M20K),
        .NOC_WRB_28_NUM_M20K_WIDE(NOC_WRB_28_NUM_M20K_WIDE),
        .NOC_WRB_28_START_ADDR(NOC_WRB_28_START_ADDR),
        .NOC_WRB_28_USE_START_ADDR(NOC_WRB_28_USE_START_ADDR),
        .NOC_WRB_28_VALID(NOC_WRB_28_VALID),
            
        .NOC_WRB_29_CS(NOC_WRB_29_CS),
        .NOC_WRB_29_M20K_ID(NOC_WRB_29_M20K_ID),
        .NOC_WRB_29_NUM_M20K(NOC_WRB_29_NUM_M20K),
        .NOC_WRB_29_NUM_M20K_WIDE(NOC_WRB_29_NUM_M20K_WIDE),
        .NOC_WRB_29_START_ADDR(NOC_WRB_29_START_ADDR),
        .NOC_WRB_29_USE_START_ADDR(NOC_WRB_29_USE_START_ADDR),
        .NOC_WRB_29_VALID(NOC_WRB_29_VALID),
            
        .NOC_WRB_30_CS(NOC_WRB_30_CS),
        .NOC_WRB_30_M20K_ID(NOC_WRB_30_M20K_ID),
        .NOC_WRB_30_NUM_M20K(NOC_WRB_30_NUM_M20K),
        .NOC_WRB_30_NUM_M20K_WIDE(NOC_WRB_30_NUM_M20K_WIDE),
        .NOC_WRB_30_START_ADDR(NOC_WRB_30_START_ADDR),
        .NOC_WRB_30_USE_START_ADDR(NOC_WRB_30_USE_START_ADDR),
        .NOC_WRB_30_VALID(NOC_WRB_30_VALID),
    
        .NOC_WRB_31_CS(NOC_WRB_31_CS),
        .NOC_WRB_31_M20K_ID(NOC_WRB_31_M20K_ID),
        .NOC_WRB_31_NUM_M20K(NOC_WRB_31_NUM_M20K),
        .NOC_WRB_31_NUM_M20K_WIDE(NOC_WRB_31_NUM_M20K_WIDE),
        .NOC_WRB_31_START_ADDR(NOC_WRB_31_START_ADDR),
        .NOC_WRB_31_USE_START_ADDR(NOC_WRB_31_USE_START_ADDR),
        .NOC_WRB_31_VALID(NOC_WRB_31_VALID),

        .NOC_WRB_32_NUM_M20K_WIDE(NOC_WRB_32_NUM_M20K_WIDE),
        .NOC_WRB_33_NUM_M20K_WIDE(NOC_WRB_33_NUM_M20K_WIDE),
        .NOC_WRB_34_NUM_M20K_WIDE(NOC_WRB_34_NUM_M20K_WIDE),
        .NOC_WRB_35_NUM_M20K_WIDE(NOC_WRB_35_NUM_M20K_WIDE),
        .NOC_WRB_36_NUM_M20K_WIDE(NOC_WRB_36_NUM_M20K_WIDE),
        .NOC_WRB_37_NUM_M20K_WIDE(NOC_WRB_37_NUM_M20K_WIDE),
        .NOC_WRB_38_NUM_M20K_WIDE(NOC_WRB_38_NUM_M20K_WIDE),
        .NOC_WRB_39_NUM_M20K_WIDE(NOC_WRB_39_NUM_M20K_WIDE),
        .NOC_WRB_40_NUM_M20K_WIDE(NOC_WRB_40_NUM_M20K_WIDE),
        .NOC_WRB_41_NUM_M20K_WIDE(NOC_WRB_41_NUM_M20K_WIDE),
        .NOC_WRB_42_NUM_M20K_WIDE(NOC_WRB_42_NUM_M20K_WIDE),
        .NOC_WRB_43_NUM_M20K_WIDE(NOC_WRB_43_NUM_M20K_WIDE),
        .NOC_WRB_44_NUM_M20K_WIDE(NOC_WRB_44_NUM_M20K_WIDE),
        .NOC_WRB_45_NUM_M20K_WIDE(NOC_WRB_45_NUM_M20K_WIDE),
        .NOC_WRB_46_NUM_M20K_WIDE(NOC_WRB_46_NUM_M20K_WIDE),
        .NOC_WRB_47_NUM_M20K_WIDE(NOC_WRB_47_NUM_M20K_WIDE),
        .NOC_WRB_48_NUM_M20K_WIDE(NOC_WRB_48_NUM_M20K_WIDE),
        .NOC_WRB_49_NUM_M20K_WIDE(NOC_WRB_49_NUM_M20K_WIDE),
        .NOC_WRB_50_NUM_M20K_WIDE(NOC_WRB_50_NUM_M20K_WIDE),
        .NOC_WRB_51_NUM_M20K_WIDE(NOC_WRB_51_NUM_M20K_WIDE),
        .NOC_WRB_52_NUM_M20K_WIDE(NOC_WRB_52_NUM_M20K_WIDE),
        .NOC_WRB_53_NUM_M20K_WIDE(NOC_WRB_53_NUM_M20K_WIDE),
        .NOC_WRB_54_NUM_M20K_WIDE(NOC_WRB_54_NUM_M20K_WIDE),
        .NOC_WRB_55_NUM_M20K_WIDE(NOC_WRB_55_NUM_M20K_WIDE),
        .NOC_WRB_56_NUM_M20K_WIDE(NOC_WRB_56_NUM_M20K_WIDE),
        .NOC_WRB_57_NUM_M20K_WIDE(NOC_WRB_57_NUM_M20K_WIDE),
        .NOC_WRB_58_NUM_M20K_WIDE(NOC_WRB_58_NUM_M20K_WIDE),
        .NOC_WRB_59_NUM_M20K_WIDE(NOC_WRB_59_NUM_M20K_WIDE),
        .NOC_WRB_60_NUM_M20K_WIDE(NOC_WRB_60_NUM_M20K_WIDE),
        .NOC_WRB_61_NUM_M20K_WIDE(NOC_WRB_61_NUM_M20K_WIDE),
        .NOC_WRB_62_NUM_M20K_WIDE(NOC_WRB_62_NUM_M20K_WIDE),
        .NOC_WRB_63_NUM_M20K_WIDE(NOC_WRB_63_NUM_M20K_WIDE),

        .NOC_INIU_PEND_TRANS_RD_VAL(NOC_INIU_PEND_TRANS_RD_VAL),
        .NOC_INIU_PEND_TRANS_WR_VAL(NOC_INIU_PEND_TRANS_WR_VAL) 
    )
    initiator_inst_0(
        .request_clk(clk),
        .noc_fd_usr_rst__rst(reset_i),
        // In
        .request_wstrb(NOC_INIU_WUSER_ECC_EN == "NOC_INIU_WUSER_ECC_EN_ENABLE" ? 0 : request_wstrb_i),
        .request_arvalid(request_arvalid_i),
        .request_araddr({request_araddr_i[AXI_ADDR_WIDTH-1:2], 2'b00}),
        .request_awvalid(request_awvalid_i),
        .request_aruser(request_aruser_i),
        .request_wlast(request_wlast_i),
        .request_awlen(request_awlen_i[6:0]),
        .request_arlock(request_arlock_i),
        .request_wvalid(request_wvalid_i),
        .request_arsize(request_arsize_i),
        .request_awsize(request_awsize_i),
        .request_awid(request_awid_i),
        .request_awqos(request_awqos_i),
        .request_awaddr({request_awaddr_i[AXI_ADDR_WIDTH-1:2], 2'b00}),
        .request_arqos(request_arqos_i),
        .request_arid(request_arid_i),
        .request_awlock(request_awlock_i),
        .request_rready(request_rready_i),
        .request_wdata(request_wdata_i),
        .request_bready(request_bready_i),
        .request_arburst(2'b01),
        .request_arlen(request_arlen_i[6:0]),
        .request_wuser(),
        .request_awuser(request_awuser_i),
        .request_awburst(2'b01),
    
        // Out
        .request_rlast(request_rlast_i),
        .request_rresp(request_rresp_i),
        .request_awready(request_awready_i),
        .request_bid(request_bid_i),
        .request_rvalid(request_rvalid_i),
        .request_wready(request_wready_i),
        .request_ruser(request_ruser_i),
        .request_rid(request_rid_i),
        .request_bresp(request_bresp_i),
        .request_rdata(request_rdata_i),
        .request_bvalid(request_bvalid_i),
        .request_arready(request_arready_i),
    
        // backbone atom ports
        .UNOC_VIRTUAL_CLOCK(unoc_clk),
        .ch0_unoc_wdata_to_unoc_backbone(ch0_unoc_wr_data_from_iniu),
        .ch1_unoc_wdata_to_unoc_backbone(ch1_unoc_wr_data_from_iniu),
        .ch2_unoc_wdata_to_unoc_backbone(ch2_unoc_wr_data_from_iniu),
        .ch3_unoc_wdata_to_unoc_backbone(ch3_unoc_wr_data_from_iniu),
        .ch4_unoc_wdata_to_unoc_backbone(ch4_unoc_wr_data_from_iniu),
        .ch5_unoc_wdata_to_unoc_backbone(ch5_unoc_wr_data_from_iniu),
        .ch6_unoc_wdata_to_unoc_backbone(ch6_unoc_wr_data_from_iniu),
        .ch7_unoc_wdata_to_unoc_backbone(ch7_unoc_wr_data_from_iniu),
        
        .ch0_unoc_wr_ena_to_unoc_backbone(ch0_unoc_wr_enable_from_iniu),
        .ch1_unoc_wr_ena_to_unoc_backbone(ch1_unoc_wr_enable_from_iniu),
        .ch2_unoc_wr_ena_to_unoc_backbone(ch2_unoc_wr_enable_from_iniu),
        .ch3_unoc_wr_ena_to_unoc_backbone(ch3_unoc_wr_enable_from_iniu),
        .ch4_unoc_wr_ena_to_unoc_backbone(ch4_unoc_wr_enable_from_iniu),
        .ch5_unoc_wr_ena_to_unoc_backbone(ch5_unoc_wr_enable_from_iniu),
        .ch6_unoc_wr_ena_to_unoc_backbone(ch6_unoc_wr_enable_from_iniu),
        .ch7_unoc_wr_ena_to_unoc_backbone(ch7_unoc_wr_enable_from_iniu),
        
        .ch0_unoc_wr_addr_to_unoc_backbone(ch0_unoc_wr_address_from_iniu),
        .ch1_unoc_wr_addr_to_unoc_backbone(ch1_unoc_wr_address_from_iniu),
        .ch2_unoc_wr_addr_to_unoc_backbone(ch2_unoc_wr_address_from_iniu),
        .ch3_unoc_wr_addr_to_unoc_backbone(ch3_unoc_wr_address_from_iniu),
        .ch4_unoc_wr_addr_to_unoc_backbone(ch4_unoc_wr_address_from_iniu),
        .ch5_unoc_wr_addr_to_unoc_backbone(ch5_unoc_wr_address_from_iniu),
        .ch6_unoc_wr_addr_to_unoc_backbone(ch6_unoc_wr_address_from_iniu),
        .ch7_unoc_wr_addr_to_unoc_backbone(ch7_unoc_wr_address_from_iniu),
        
        .ch0_unoc_group_id_to_unoc_backbone(ch0_unoc_group_id_from_iniu),
        .ch1_unoc_group_id_to_unoc_backbone(ch1_unoc_group_id_from_iniu),
        .ch2_unoc_group_id_to_unoc_backbone(ch2_unoc_group_id_from_iniu),
        .ch3_unoc_group_id_to_unoc_backbone(ch3_unoc_group_id_from_iniu),
        .ch4_unoc_group_id_to_unoc_backbone(ch4_unoc_group_id_from_iniu),
        .ch5_unoc_group_id_to_unoc_backbone(ch5_unoc_group_id_from_iniu),
        .ch6_unoc_group_id_to_unoc_backbone(ch6_unoc_group_id_from_iniu),
        .ch7_unoc_group_id_to_unoc_backbone(ch7_unoc_group_id_from_iniu),
    
        .ch0_unoc_rd_ena_to_unoc_backbone(ch0_unoc_rd_enable_to_unoc_backbone),
        .ch1_unoc_rd_ena_to_unoc_backbone(ch1_unoc_rd_enable_to_unoc_backbone),
        .ch2_unoc_rd_ena_to_unoc_backbone(ch2_unoc_rd_enable_to_unoc_backbone),
        .ch3_unoc_rd_ena_to_unoc_backbone(ch3_unoc_rd_enable_to_unoc_backbone),
        .ch4_unoc_rd_ena_to_unoc_backbone(ch4_unoc_rd_enable_to_unoc_backbone),
        .ch5_unoc_rd_ena_to_unoc_backbone(ch5_unoc_rd_enable_to_unoc_backbone),
        .ch6_unoc_rd_ena_to_unoc_backbone(ch6_unoc_rd_enable_to_unoc_backbone),
        .ch7_unoc_rd_ena_to_unoc_backbone(ch7_unoc_rd_enable_to_unoc_backbone),
        
        .ch0_unoc_rd_addr_to_unoc_backbone(ch0_unoc_rd_address_to_unoc_backbone),
        .ch1_unoc_rd_addr_to_unoc_backbone(ch1_unoc_rd_address_to_unoc_backbone),
        .ch2_unoc_rd_addr_to_unoc_backbone(ch2_unoc_rd_address_to_unoc_backbone),
        .ch3_unoc_rd_addr_to_unoc_backbone(ch3_unoc_rd_address_to_unoc_backbone),
        .ch4_unoc_rd_addr_to_unoc_backbone(ch4_unoc_rd_address_to_unoc_backbone),
        .ch5_unoc_rd_addr_to_unoc_backbone(ch5_unoc_rd_address_to_unoc_backbone),
        .ch6_unoc_rd_addr_to_unoc_backbone(ch6_unoc_rd_address_to_unoc_backbone),
        .ch7_unoc_rd_addr_to_unoc_backbone(ch7_unoc_rd_address_to_unoc_backbone),
        
        .ch0_unoc_beats_ctr_rst_to_unoc_backbone(ch0_unoc_beats_to_unoc_backbone),
        .ch1_unoc_beats_ctr_rst_to_unoc_backbone(ch1_unoc_beats_to_unoc_backbone),
        .ch2_unoc_beats_ctr_rst_to_unoc_backbone(ch2_unoc_beats_to_unoc_backbone),
        .ch3_unoc_beats_ctr_rst_to_unoc_backbone(ch3_unoc_beats_to_unoc_backbone),
        .ch4_unoc_beats_ctr_rst_to_unoc_backbone(ch4_unoc_beats_to_unoc_backbone),
        .ch5_unoc_beats_ctr_rst_to_unoc_backbone(ch5_unoc_beats_to_unoc_backbone),
        .ch6_unoc_beats_ctr_rst_to_unoc_backbone(ch6_unoc_beats_to_unoc_backbone),
        .ch7_unoc_beats_ctr_rst_to_unoc_backbone(ch7_unoc_beats_to_unoc_backbone),
    
        .ch0_unoc_rdata_from_unoc_backbone(ch0_unoc_rd_data_from_unoc_backbone),
        .ch1_unoc_rdata_from_unoc_backbone(ch1_unoc_rd_data_from_unoc_backbone),
        .ch2_unoc_rdata_from_unoc_backbone(ch2_unoc_rd_data_from_unoc_backbone),
        .ch3_unoc_rdata_from_unoc_backbone(ch3_unoc_rd_data_from_unoc_backbone),
        .ch4_unoc_rdata_from_unoc_backbone(ch4_unoc_rd_data_from_unoc_backbone),
        .ch5_unoc_rdata_from_unoc_backbone(ch5_unoc_rd_data_from_unoc_backbone),
        .ch6_unoc_rdata_from_unoc_backbone(ch6_unoc_rd_data_from_unoc_backbone),
        .ch7_unoc_rdata_from_unoc_backbone(ch7_unoc_rd_data_from_unoc_backbone),
        
        .ch0_unoc_rdata_valid_from_unoc_backbone(ch0_unoc_rd_data_valid_from_unoc_backbone),
        .ch1_unoc_rdata_valid_from_unoc_backbone(ch1_unoc_rd_data_valid_from_unoc_backbone),
        .ch2_unoc_rdata_valid_from_unoc_backbone(ch2_unoc_rd_data_valid_from_unoc_backbone),
        .ch3_unoc_rdata_valid_from_unoc_backbone(ch3_unoc_rd_data_valid_from_unoc_backbone),
        .ch4_unoc_rdata_valid_from_unoc_backbone(ch4_unoc_rd_data_valid_from_unoc_backbone),
        .ch5_unoc_rdata_valid_from_unoc_backbone(ch5_unoc_rd_data_valid_from_unoc_backbone),
        .ch6_unoc_rdata_valid_from_unoc_backbone(ch6_unoc_rd_data_valid_from_unoc_backbone),
        .ch7_unoc_rdata_valid_from_unoc_backbone(ch7_unoc_rd_data_valid_from_unoc_backbone)
    
    );

    logic [AXI_AUSER_WIDTH_CHOSEN-1:0] awuser_chosen;
    logic [AXI_AUSER_WIDTH_CHOSEN-1:0] aruser_chosen;
    assign awuser_chosen = (ENABLE_SECURITY != "OFF") ?  {MAJOR_WRITE_PRV[2:0], request_awuser} : request_awuser;
    assign aruser_chosen = (ENABLE_SECURITY != "OFF") ?  {MAJOR_READ_PRV[2:0], request_aruser} : request_aruser;


    top_ready_latency_adp # (
      .LOG_DEPTH (3),
      .CONNECT_WUSER(NOC_INIU_WUSER_ECC_EN == "NOC_INIU_WUSER_ECC_EN_ENABLE"), 
      .NUM_PIPELINES (NOC_AXI_PIPELINE_CNT),
      .ID_WIDTH (AXI_ID_WIDTH),
      .ADDR_WIDTH (AXI_ADDR_WIDTH),
      .DATA_WIDTH (NOC_INIU_ADAPTER_DATA_WIDTH_INT),
      .STRB_WIDTH (AXI_WSTRB_WIDTH),
      .AUSER_WIDTH (AXI_AUSER_WIDTH_CHOSEN)
     ) ready_latency_inst (
        .clk (clk),
        .reset (reset),
        .reset_r (reset_i),
        // aw channel 
        // *_r outputs
        .awready (request_awready_i), //input
        .awvalid_r (request_awvalid_i),
        .awid_r (request_awid_i),
        .awaddr_r (request_awaddr_i),
        .awlen_r (request_awlen_i),
        .awsize_r (request_awsize_i),
        .awburst_r (request_awburst_i),
        .awlock_r (request_awlock_i),
        .awuser_r (request_awuser_i),
        .awqos_r (request_awqos_i),

        .awready_r (request_awready), //output
        .awvalid (request_awvalid),
        .awid (request_awid),
        .awaddr (request_awaddr),
        .awlen (request_awlen),
        .awsize (request_awsize),
        .awburst (request_awburst),
        .awlock (request_awlock),
        .awuser (awuser_chosen),
        .awqos (request_awqos[3:2]),


        .arready (request_arready_i), //input
        .arvalid_r (request_arvalid_i),
        .arid_r (request_arid_i),
        .araddr_r (request_araddr_i),
        .arlen_r (request_arlen_i),
        .arsize_r (request_arsize_i),
        .arburst_r (request_arburst_i),
        .arlock_r (request_arlock_i),
        .aruser_r (request_aruser_i),
        .arqos_r (request_arqos_i),

        .arready_r (request_arready), //output
        .arvalid (request_arvalid),
        .arid (request_arid),
        .araddr (request_araddr),
        .arlen (request_arlen),
        .arsize (request_arsize),
        .arburst (request_arburst),
        .arlock (request_arlock),
        .aruser (aruser_chosen),
        .arqos (request_arqos[3:2]),

        //w channel

        .wready (request_wready_i), //input
        .wvalid_r (request_wvalid_i),
        .wdata_r (request_wdata_i),
        .wlast_r (request_wlast_i),
        .wstrb_r (request_wstrb_i),
        .wuser_r (request_wuser_i),


        .wready_r (request_wready), //output
        .wvalid (request_wvalid),
        .wdata (request_wdata),
        .wlast (request_wlast),
        .wstrb (request_wstrb),
        .wuser (request_wuser),

        // response channels


        .bvalid (request_bvalid_i),
        .bid (request_bid_i),
        .bresp (request_bresp_i),
        .bready_r (request_bready_i),


        .bvalid_r (request_bvalid),
        .bid_r (request_bid),
        .bresp_r (request_bresp),
        .bready (request_bready),


        .rvalid (request_rvalid_i),
        .rid (request_rid_i),
        .rdata (request_rdata_i),
        .rresp (request_rresp_i),
        .ruser (request_ruser_i),
        .rlast (request_rlast_i),
        .rready_r (request_rready_i), //output 

        
        .rvalid_r (request_rvalid),
        .rid_r (request_rid),
        .rdata_r (request_rdata),
        .rresp_r (request_rresp),
        .ruser_r (request_ruser),
        .rlast_r (request_rlast),
        .rready (request_rready)  


    ); 


endmodule

