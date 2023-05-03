source [file join [file dirname [info script]] ./../../../ip/my_sys/my_sys_iopll_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/my_sys/my_sys_intel_noc_clock_ctrl_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/my_sys/axi_reset/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/my_sys/my_sys_intel_noc_initiator_1/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/my_sys/noc_reset/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/my_sys/my_sys_hbm_fp_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/my_sys/my_sys_mgc_axi4_master_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/my_sys/clk100/sim/common/modelsim_files.tcl]

namespace eval my_sys {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [my_sys_iopll_0::get_design_libraries]]
    set libraries [dict merge $libraries [my_sys_intel_noc_clock_ctrl_0::get_design_libraries]]
    set libraries [dict merge $libraries [axi_reset::get_design_libraries]]
    set libraries [dict merge $libraries [my_sys_intel_noc_initiator_1::get_design_libraries]]
    set libraries [dict merge $libraries [noc_reset::get_design_libraries]]
    set libraries [dict merge $libraries [my_sys_hbm_fp_0::get_design_libraries]]
    set libraries [dict merge $libraries [my_sys_mgc_axi4_master_0::get_design_libraries]]
    set libraries [dict merge $libraries [clk100::get_design_libraries]]
    dict set libraries altera_merlin_axi_translator_1921 1
    dict set libraries altera_mm_interconnect_1920       1
    dict set libraries altera_reset_controller_1921      1
    dict set libraries my_sys                            1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [my_sys_iopll_0::get_memory_files "$QSYS_SIMDIR/../../ip/my_sys/my_sys_iopll_0/sim/"]]
    set memory_files [concat $memory_files [my_sys_intel_noc_clock_ctrl_0::get_memory_files "$QSYS_SIMDIR/../../ip/my_sys/my_sys_intel_noc_clock_ctrl_0/sim/"]]
    set memory_files [concat $memory_files [axi_reset::get_memory_files "$QSYS_SIMDIR/../../ip/my_sys/axi_reset/sim/"]]
    set memory_files [concat $memory_files [my_sys_intel_noc_initiator_1::get_memory_files "$QSYS_SIMDIR/../../ip/my_sys/my_sys_intel_noc_initiator_1/sim/"]]
    set memory_files [concat $memory_files [noc_reset::get_memory_files "$QSYS_SIMDIR/../../ip/my_sys/noc_reset/sim/"]]
    set memory_files [concat $memory_files [my_sys_hbm_fp_0::get_memory_files "$QSYS_SIMDIR/../../ip/my_sys/my_sys_hbm_fp_0/sim/"]]
    set memory_files [concat $memory_files [my_sys_mgc_axi4_master_0::get_memory_files "$QSYS_SIMDIR/../../ip/my_sys/my_sys_mgc_axi4_master_0/sim/"]]
    set memory_files [concat $memory_files [clk100::get_memory_files "$QSYS_SIMDIR/../../ip/my_sys/clk100/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [my_sys_iopll_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_iopll_0/sim/"]]
    set design_files [dict merge $design_files [my_sys_intel_noc_clock_ctrl_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_intel_noc_clock_ctrl_0/sim/"]]
    set design_files [dict merge $design_files [axi_reset::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/axi_reset/sim/"]]
    set design_files [dict merge $design_files [my_sys_intel_noc_initiator_1::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_intel_noc_initiator_1/sim/"]]
    set design_files [dict merge $design_files [noc_reset::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/noc_reset/sim/"]]
    set design_files [dict merge $design_files [my_sys_hbm_fp_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_hbm_fp_0/sim/"]]
    set design_files [dict merge $design_files [my_sys_mgc_axi4_master_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_mgc_axi4_master_0/sim/"]]
    set design_files [dict merge $design_files [clk100::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/clk100/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [my_sys_iopll_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_iopll_0/sim/"]]
    set design_files [concat $design_files [my_sys_intel_noc_clock_ctrl_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_intel_noc_clock_ctrl_0/sim/"]]
    set design_files [concat $design_files [axi_reset::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/axi_reset/sim/"]]
    set design_files [concat $design_files [my_sys_intel_noc_initiator_1::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_intel_noc_initiator_1/sim/"]]
    set design_files [concat $design_files [noc_reset::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/noc_reset/sim/"]]
    set design_files [concat $design_files [my_sys_hbm_fp_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_hbm_fp_0/sim/"]]
    set design_files [concat $design_files [my_sys_mgc_axi4_master_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_mgc_axi4_master_0/sim/"]]
    set design_files [concat $design_files [clk100::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/clk100/sim/"]]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_translator_1921/sim/my_sys_altera_merlin_axi_translator_1921_uetfduq.sv"]\"  -work altera_merlin_axi_translator_1921"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/my_sys_altera_mm_interconnect_1920_shrp3yq.v"]\"  -work altera_mm_interconnect_1920"                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/my_sys_altera_mm_interconnect_1920_ddk3qei.v"]\"  -work altera_mm_interconnect_1920"                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1921/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_1921"                                        
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1921/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_1921"                                      
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/my_sys.v"]\"  -work my_sys"                                                                                                                   
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    append ELAB_OPTIONS [my_sys_iopll_0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [my_sys_intel_noc_clock_ctrl_0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [axi_reset::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [my_sys_intel_noc_initiator_1::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [noc_reset::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [my_sys_hbm_fp_0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [my_sys_mgc_axi4_master_0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [clk100::get_elab_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [my_sys_iopll_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [my_sys_intel_noc_clock_ctrl_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [axi_reset::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [my_sys_intel_noc_initiator_1::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [noc_reset::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [my_sys_hbm_fp_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [my_sys_mgc_axi4_master_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clk100::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [my_sys_iopll_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [my_sys_intel_noc_clock_ctrl_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [axi_reset::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [my_sys_intel_noc_initiator_1::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [noc_reset::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [my_sys_hbm_fp_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [my_sys_mgc_axi4_master_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk100::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
  proc get_mg_bfm_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR QUARTUS_INSTALL_DIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [my_sys_iopll_0::get_mg_bfm_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_iopll_0/sim/" $QUARTUS_INSTALL_DIR]]
    set design_files [dict merge $design_files [my_sys_intel_noc_clock_ctrl_0::get_mg_bfm_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_intel_noc_clock_ctrl_0/sim/" $QUARTUS_INSTALL_DIR]]
    set design_files [dict merge $design_files [axi_reset::get_mg_bfm_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/axi_reset/sim/" $QUARTUS_INSTALL_DIR]]
    set design_files [dict merge $design_files [my_sys_intel_noc_initiator_1::get_mg_bfm_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_intel_noc_initiator_1/sim/" $QUARTUS_INSTALL_DIR]]
    set design_files [dict merge $design_files [noc_reset::get_mg_bfm_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/noc_reset/sim/" $QUARTUS_INSTALL_DIR]]
    set design_files [dict merge $design_files [my_sys_hbm_fp_0::get_mg_bfm_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_hbm_fp_0/sim/" $QUARTUS_INSTALL_DIR]]
    set design_files [dict merge $design_files [my_sys_mgc_axi4_master_0::get_mg_bfm_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/my_sys_mgc_axi4_master_0/sim/" $QUARTUS_INSTALL_DIR]]
    set design_files [dict merge $design_files [clk100::get_mg_bfm_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/my_sys/clk100/sim/" $QUARTUS_INSTALL_DIR]]
    return $design_files
  }
  
  proc use_mg_bfm {} {
    if [string is true -strict [my_sys_iopll_0::use_mg_bfm]] {return 1}
    if [string is true -strict [my_sys_intel_noc_clock_ctrl_0::use_mg_bfm]] {return 1}
    if [string is true -strict [axi_reset::use_mg_bfm]] {return 1}
    if [string is true -strict [my_sys_intel_noc_initiator_1::use_mg_bfm]] {return 1}
    if [string is true -strict [noc_reset::use_mg_bfm]] {return 1}
    if [string is true -strict [my_sys_hbm_fp_0::use_mg_bfm]] {return 1}
    if [string is true -strict [my_sys_mgc_axi4_master_0::use_mg_bfm]] {return 1}
    if [string is true -strict [clk100::use_mg_bfm]] {return 1}
    return 0
  }
  
  proc get_mg_bfm_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [my_sys_iopll_0::get_mg_bfm_libraries]]
    set libraries [dict merge $libraries [my_sys_intel_noc_clock_ctrl_0::get_mg_bfm_libraries]]
    set libraries [dict merge $libraries [axi_reset::get_mg_bfm_libraries]]
    set libraries [dict merge $libraries [my_sys_intel_noc_initiator_1::get_mg_bfm_libraries]]
    set libraries [dict merge $libraries [noc_reset::get_mg_bfm_libraries]]
    set libraries [dict merge $libraries [my_sys_hbm_fp_0::get_mg_bfm_libraries]]
    set libraries [dict merge $libraries [my_sys_mgc_axi4_master_0::get_mg_bfm_libraries]]
    set libraries [dict merge $libraries [clk100::get_mg_bfm_libraries]]
    return $libraries
  }
  
}
