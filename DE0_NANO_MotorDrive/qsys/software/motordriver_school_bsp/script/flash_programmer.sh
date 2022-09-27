#!/bin/sh
#
# This file was automatically generated.
#
# It can be overwritten by nios2-flash-programmer-generate or nios2-flash-programmer-gui.
#

#
# Converting SOF File: D:\prj\DE0_Nano_prj\motordriver-design-based-on-fpga\DE0_NANO_MotorDrive\output_files\DE0_NANO.sof to: "..\flash/DE0_NANO_epcs_controlle.flash"
#
sof2flash --input="D:/prj/DE0_Nano_prj/motordriver-design-based-on-fpga/DE0_NANO_MotorDrive/output_files/DE0_NANO.sof" --output="../flash/DE0_NANO_epcs_controlle.flash" --epcs 

#
# Programming File: "..\flash/DE0_NANO_epcs_controlle.flash" To Device: epcs_controlle
#
nios2-flash-programmer "../flash/DE0_NANO_epcs_controlle.flash" --base=0x0 --epcs --accept-bad-sysid --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program 

#
# Converting ELF File: D:\prj\DE0_Nano_prj\motordriver-design-based-on-fpga\DE0_NANO_MotorDrive\qsys\software\motordriver_school\motordriver_school.elf to: "..\flash/motordriver_school_epcs_controlle.flash"
#
elf2flash --input="D:/prj/DE0_Nano_prj/motordriver-design-based-on-fpga/DE0_NANO_MotorDrive/qsys/software/motordriver_school/motordriver_school.elf" --output="../flash/motordriver_school_epcs_controlle.flash" --epcs --after="../flash/DE0_NANO_epcs_controlle.flash" 

#
# Programming File: "..\flash/motordriver_school_epcs_controlle.flash" To Device: epcs_controlle
#
nios2-flash-programmer "../flash/motordriver_school_epcs_controlle.flash" --base=0x0 --epcs --accept-bad-sysid --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program 

