#!/bin/bash

rostopic pub -1 /digital/robot/command motion/FourMotorCmd "w1: -50.0
w2: 0.0
w3: 50.0
w4: 0.0"

rostopic pub -1 /digital/robot/command motion/FourMotorCmd "w1: 50.0
w2: 0.0
w3: -50.0
w4: 0.0"

rostopic pub -1 /digital/robot/command motion/FourMotorCmd "w1: 0.0
w2: -50.0
w3: 0.0
w4: 50.0"

rostopic pub -1 /digital/robot/command motion/FourMotorCmd "w1: 0.0
w2: 50.0
w3: 0.0
w4: -50.0"

rostopic pub -1 /digital/robot/command motion/FourMotorCmd "w1: 50.0
w2: 50.0
w3: 50.0
w4: 50.0"


rostopic pub -1 /digital/robot/command motion/FourMotorCmd "w1: -50.0
w2: -50.0
w3: -50.0
w4: -50.0"

rostopic pub -1 /digital/robot/command motion/FourMotorCmd "w1: 0.0
w2: 0.0
w3: 0.0
w4: 0.0"
