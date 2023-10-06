
namespace eval my_sys_intel_noc_initiator_1 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries intel_noc_internal_initiator_202 1
    dict set libraries intel_axi4_user_adapter_110      1
    dict set libraries intel_noc_initiator_110          1
    dict set libraries my_sys_intel_noc_initiator_1     1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_noc_internal_initiator_202/sim/top_ready_latency_adp.sv"]\"  -work intel_noc_internal_initiator_202"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_noc_internal_initiator_202/sim/ff_macro_init.sv"]\"  -work intel_noc_internal_initiator_202"                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_noc_internal_initiator_202/sim/ready_latency_adapter.sv"]\"  -work intel_noc_internal_initiator_202"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_noc_internal_initiator_202/sim/scfifo_s.sv"]\"  -work intel_noc_internal_initiator_202"                                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_noc_internal_initiator_202/sim/scfifo_s_normal.sv"]\"  -work intel_noc_internal_initiator_202"                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_noc_internal_initiator_202/sim/scfifo_s_showahead.sv"]\"  -work intel_noc_internal_initiator_202"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_noc_internal_initiator_202/sim/add_a_b_s0_s1.sv"]\"  -work intel_noc_internal_initiator_202"                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_noc_internal_initiator_202/sim/generic_mlab_sc.sv"]\"  -work intel_noc_internal_initiator_202"                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_noc_internal_initiator_202/sim/my_sys_intel_noc_initiator_1_intel_noc_internal_initiator_202_ikpwkgy.sv"]\"  -work intel_noc_internal_initiator_202"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_axi4_user_adapter_110/sim/my_sys_intel_noc_initiator_1_intel_axi4_user_adapter_110_ierbsva.sv"]\"  -work intel_axi4_user_adapter_110"               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_axi4_user_adapter_110/sim/mentor/intel_axi4_user_adapter.sv"]\"  -work intel_axi4_user_adapter_110"                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../intel_noc_initiator_110/sim/my_sys_intel_noc_initiator_1_intel_noc_initiator_110_kv2wdqq.v"]\"  -work intel_noc_initiator_110"                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/my_sys_intel_noc_initiator_1.v"]\"  -work my_sys_intel_noc_initiator_1"                                                                                          
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
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
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    
    return $libraries
  }
  
}
