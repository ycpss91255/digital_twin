#**************************************************************
# This .sdc file is created by Terasic Tool.
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -name CLOCK_50  -period 20 [get_ports CLOCK_50]

#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks

#create_generated_clock -name QsysClk    -source CLOCK_50 -duty_cycle 50.000 -multiply_by 2                     -master_clock {CLOCK_50} [get_pins {u0|altpll_0|sd1|pll7|clk[0]}]
#create_generated_clock -name DRAM_CLK   -source CLOCK_50 -duty_cycle 50.000 -multiply_by 2 -phase [expr -90/1] -master_clock {CLOCK_50} [get_pins {u0|altpll_0|sd1|pll7|clk[1]}]
#create_generated_clock -name wClk200Mhz -source CLOCK_50 -duty_cycle 50.000 -multiply_by 4                     -master_clock {CLOCK_50} [get_pins {u0|altpll_0|sd1|pll7|clk[2]}]
#create_generated_clock -name wSPIClk3M  -source CLOCK_50 -duty_cycle 50.000 -multiply_by 3 -divide_by 50       -master_clock {CLOCK_50} [get_pins {u0|altpll_0|sd1|pll7|clk[3]}]
#
#
## motor pem clk 
#create_generated_clock -name MotorA_PwmClk -divide_by 5000 -source CLOCK_50 [get_registers {FourWheelMotorDriverTop:FourWheelMotorDriverTop|MotorDriveTop:MotorA_DriveTop|PWMGen:uPWMGen|clkdiv:uClkdiv|oExpectClk}]
#create_generated_clock -name MotorB_PwmClk -divide_by 5000 -source CLOCK_50 [get_registers {FourWheelMotorDriverTop:FourWheelMotorDriverTop|MotorDriveTop:MotorB_DriveTop|PWMGen:uPWMGen|clkdiv:uClkdiv|oExpectClk}]
#create_generated_clock -name MotorC_PwmClk -divide_by 5000 -source CLOCK_50 [get_registers {FourWheelMotorDriverTop:FourWheelMotorDriverTop|MotorDriveTop:MotorC_DriveTop|PWMGen:uPWMGen|clkdiv:uClkdiv|oExpectClk}]
#create_generated_clock -name MotorD_PwmClk -divide_by 5000 -source CLOCK_50 [get_registers {FourWheelMotorDriverTop:FourWheelMotorDriverTop|MotorDriveTop:MotorD_DriveTop|PWMGen:uPWMGen|clkdiv:uClkdiv|oExpectClk}]

# g sensor clock 
#create_generated_clock -name Clk5M -duty_cycle 50.000 -divide_by 10 -source CLOCK_50 [get_registers {GSensor_Top:GSensor_Top|ClkDiv5Mhz:ClkDiv5Mhz|oClk5M}]

#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************



