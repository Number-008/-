# TCL File Generated by Component Editor 12.1sp1
# Sat May 18 02:41:35 CST 2013
# DO NOT MODIFY


# 
# freq_ms_djd "freq_ms_djd" v1.0
# null 2013.05.18.02:41:35
# 
# 

# 
# request TCL package from ACDS 11.0
# 
package require -exact sopc 11.0


# 
# module freq_ms_djd
# 
set_module_property NAME freq_ms_djd
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP MyIP
set_module_property DISPLAY_NAME freq_ms_djd
set_module_property TOP_LEVEL_HDL_FILE freq_ms_djd.v
set_module_property TOP_LEVEL_HDL_MODULE freq_ms_djd
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property STATIC_TOP_LEVEL_MODULE_NAME freq_ms_djd
set_module_property FIX_110_VIP_PATH false
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# files
# 
add_file freq_ms_djd.v {SYNTHESIS SIMULATION}


# 
# file sets
# 

# 
# parameters
# 


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true

add_interface_port clock csi_clk clk Input 1


# 
# connection point clock_reset
# 
add_interface clock_reset reset end
set_interface_property clock_reset associatedClock clock
set_interface_property clock_reset synchronousEdges DEASSERT
set_interface_property clock_reset ENABLED true

add_interface_port clock_reset csi_reset_n reset_n Input 1


# 
# connection point avalon_slave_0
# 
add_interface avalon_slave_0 avalon end
set_interface_property avalon_slave_0 addressAlignment DYNAMIC
set_interface_property avalon_slave_0 addressUnits WORDS
set_interface_property avalon_slave_0 associatedClock clock
set_interface_property avalon_slave_0 burstOnBurstBoundariesOnly false
set_interface_property avalon_slave_0 explicitAddressSpan 0
set_interface_property avalon_slave_0 holdTime 0
set_interface_property avalon_slave_0 isMemoryDevice false
set_interface_property avalon_slave_0 isNonVolatileStorage false
set_interface_property avalon_slave_0 linewrapBursts false
set_interface_property avalon_slave_0 maximumPendingReadTransactions 0
set_interface_property avalon_slave_0 printableDevice false
set_interface_property avalon_slave_0 readLatency 0
set_interface_property avalon_slave_0 readWaitTime 1
set_interface_property avalon_slave_0 setupTime 0
set_interface_property avalon_slave_0 timingUnits Cycles
set_interface_property avalon_slave_0 writeWaitTime 0
set_interface_property avalon_slave_0 ENABLED true

add_interface_port avalon_slave_0 avs_chipselect chipselect Input 1
add_interface_port avalon_slave_0 avs_address address Input 1
add_interface_port avalon_slave_0 avs_read read Input 1
add_interface_port avalon_slave_0 avs_readdata readdata Output 32
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point conduit_end_0
# 
add_interface conduit_end_0 conduit end
set_interface_property conduit_end_0 associatedClock clock
set_interface_property conduit_end_0 associatedReset ""
set_interface_property conduit_end_0 ENABLED true

add_interface_port conduit_end_0 coe_clk_ref export Input 1
add_interface_port conduit_end_0 clk_test export Input 1

