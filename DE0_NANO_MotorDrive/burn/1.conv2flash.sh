sof2flash --input="DE0_NANO.sof" --output="DE0_NANO.flash" --epcs --verbose
elf2flash --input="motordriver_school.elf" --output="robot_motor.flash" --epcs --after="DE0_NANO.flash" --verbose
