
####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. #set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

#1. Master Clocks
set CLK_NAME_REF REF_CLK
set CLK_PER_REF 10
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set CLK_RISE 0.05
set CLK_FALL 0.05

create_clock -period $CLK_PER_REF -name $CLK_NAME_REF -waveform "0 [expr $CLK_PER_REF/2]" [get_ports REF_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK_NAME_REF]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK_NAME_REF]
set_clock_transition -rise $CLK_RISE  [get_clocks $CLK_NAME_REF]
set_clock_transition -fall $CLK_FALL  [get_clocks $CLK_NAME_REF]

set CLK_NAME_UART UART_CLK
set CLK_PER_UART 271

create_clock -period $CLK_PER_UART -name $CLK_NAME_UART -waveform "0 [expr $CLK_PER_UART/2]" [get_ports UART_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK_NAME_UART]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK_NAME_UART]
set_clock_transition -rise $CLK_RISE  [get_clocks $CLK_NAME_UART]
set_clock_transition -fall $CLK_FALL  [get_clocks $CLK_NAME_UART]

#2. Generated clocks
create_generated_clock -master_clock "$CLK_NAME_REF" -source [get_ports REF_CLK] -name "ALU_CLK" [get_ports clk_gate_inst/GATED_CLK]  -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks ALU_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks ALU_CLK]
set_clock_transition -rise $CLK_RISE  [get_clocks ALU_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks ALU_CLK]

create_generated_clock -master_clock "$CLK_NAME_UART" -source [get_ports UART_CLK] -name "RX_CLK" [get_ports ClkDiv_RX_inst/o_div_clk] -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks RX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks RX_CLK]
set_clock_transition -rise $CLK_RISE  [get_clocks RX_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks RX_CLK]

create_generated_clock -master_clock "$CLK_NAME_UART" -source [get_ports UART_CLK] -name "TX_CLK" [get_ports ClkDiv_TX_inst/o_div_clk] -divide_by 32
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks TX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks TX_CLK]
set_clock_transition -rise $CLK_RISE  [get_clocks TX_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks TX_CLK]

set_dont_touch_network [get_clocks {REF_CLK UART_CLK ALU_CLK RX_CLK TX_CLK}]

####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################
set_clock_groups -asynchronous -group [get_clocks "REF_CLK ALU_CLK"]     \
                               -group [get_clocks "UART_CLK RX_CLK TX_CLK"]

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################
set in1_delay  [expr 0.2*$CLK_PER_UART]
set out1_delay [expr 0.2*$CLK_PER_UART]

set in2_delay  [expr 0.2*32*$CLK_PER_UART]
set out2_delay [expr 0.2*32*$CLK_PER_UART]

#Constrain Input Paths
set_input_delay $in1_delay -clock RX_CLK [get_ports UART_RX_IN]

#Constrain Output Paths
set_output_delay $out2_delay -clock TX_CLK [get_port UART_TX_O]
set_output_delay $out1_delay -clock RX_CLK [get_port parity_error]
set_output_delay $out1_delay -clock RX_CLK [get_port framing_error]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port UART_RX_IN]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################
set_load 0.1 [get_port UART_TX_O]
set_load 0.1 [get_port parity_error]
set_load 0.1 [get_port framing_error]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"


