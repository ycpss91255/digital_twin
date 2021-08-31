#!/usr/bin/env bash

source ~/work/devel/setup.bash
mkdir -p ~/work/data
cd ~/work/data

rosbag record -O motor_cmd.bag --duration=10s motion/motor_speed &
rosbag record -O motor_data.bag --duration=10s motion/motor_state0 motion/motor_state1 motion/motor_state2 motion/motor_state3 &

sleep 15s

rostopic echo -b ./motor_cmd.bag -p motion/motor_speed >motor_cmd.csv
for i in $(seq 0 3); do
    echo ${i}
    rostopic echo -b ./motor_data.bag -p motion/motor_state${i} >motor_data${i}.csv
done
