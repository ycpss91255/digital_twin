#!/bin/sh
#
# This file was automatically generated.
#
# It can be overwritten by nios2-flash-programmer-generate or nios2-flash-programmer-gui.
#

#
# Converting SOF File: C:\Users\iclab\Documents\fpga\DE0_NANO_default\DE0_NANO.sof to: "..\flash/DE0_NANO_epcs_flash_controller_0.flash"
#
sof2flash --input="C:/Users/iclab/Documents/fpga/DE0_NANO_default/DE0_NANO.sof" --output="../flash/DE0_NANO_epcs_flash_controller_0.flash" --epcs 

#
# Programming File: "..\flash/DE0_NANO_epcs_flash_controller_0.flash" To Device: epcs_flash_controller_0
#
nios2-flash-programmer "../flash/DE0_NANO_epcs_flash_controller_0.flash" --base=0x800800 --epcs --sidp=0x801830 --id=0x0 --accept-bad-sysid --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program 

#
# Converting ELF File: C:\Users\iclab\Documents\fpga\DE0_NANO_default\qsys\software\lee_0722\lee_0722.elf to: "..\flash/lee_0722_epcs_flash_controller_0.flash"
#
elf2flash --input="C:/Users/iclab/Documents/fpga/DE0_NANO_default/qsys/software/lee_0722/lee_0722.elf" --output="../flash/lee_0722_epcs_flash_controller_0.flash" --epcs --after="../flash/DE0_NANO_epcs_flash_controller_0.flash" 

#
# Programming File: "..\flash/lee_0722_epcs_flash_controller_0.flash" To Device: epcs_flash_controller_0
#
nios2-flash-programmer "../flash/lee_0722_epcs_flash_controller_0.flash" --base=0x800800 --epcs --sidp=0x801830 --id=0x0 --accept-bad-sysid --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program 

