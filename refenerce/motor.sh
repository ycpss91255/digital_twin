#!/bin/bash
for i in {1..100}; do
    echo "-"
    rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: -10.0
w2: 0.0
w3: 0.0
w4: 0.0"
    echo "+"
    rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: 10.0
w2: 0.0
w3: 0.0
w4: 0.0"

    echo "$i"
done
