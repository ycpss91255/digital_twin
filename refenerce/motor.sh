#!/bin/bash
rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: 31.0
w2: 31.0
w3: 31.0
w4: 31.0"

rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: 15.0
w2: 15.0
w3: 15.0
w4: 15.0"

rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: 10.0
w2: 10.0
w3: 10.0
w4: 10.0"

rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: 5.0
w2: 5.0
w3: 5.0
w4: 5.0"

rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: -31.0
w2: -31.0
w3: -31.0
w4: -31.0"

rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: -15.0
w2: -15.0
w3: -15.0
w4: -15.0"

rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: -10.0
w2: -10.0
w3: -10.0
w4: -10.0"

rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: -5.0
w2: -5.0
w3: -5.0
w4: -5.0"


rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: 0.0
w2: 0.0
w3: 0.0
w4: 0.0"
