#!/bin/bash

source ~/work/devel/setup.bash

cd ~/work/data

start=$(date +%s)

rosbag record -O motor_cmd_30min.bag --duration=33m motion/motor_speed &

rosbag record -O motor_data_30min.bag --duration=33m motion/motor_state0 motion/motor_state1 motion/motor_state2 motion/motor_state3 &

end=$(date +%s)
after=$((end - start))
num=1

while [ $after -le 1950 ]; do
    w=$((w + num))
    if [ $w -gt 31 ]; then
        w=31
        num=$((-num))
    elif [ $w -lt -31 ]; then
        w=-31
        num=$((-num + 1))
    fi
    if [ $num -eq 62 ]; then
        break
    fi
    echo "time = " $after "w = " $w "num = " $num
    rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: $w
w2: $w
w3: $w
w4: $w"

    end=$(date +%s)
    after=$((end - start))
done
echo "end time = " $after

rostopic pub -1 /motion/motor_speed motion/FourMotorCmd "w1: 0.0
w2: 0.0
w3: 0.0
w4: 0.0"

rostopic echo -b ~/work/data/motor_cmd_30min.bag -p motion/motor_speed >motor_cmd_30min.csv
rostopic echo -b ~/work/data/motor_data_30min.bag -p motion/motor_state0 >motor0_data_30min.csv
rostopic echo -b ~/work/data/motor_data_30min.bag -p motion/motor_state1 >motor1_data_30min.csv
rostopic echo -b ~/work/data/motor_data_30min.bag -p motion/motor_state2 >motor2_data_30min.csv
rostopic echo -b ~/work/data/motor_data_30min.bag -p motion/motor_state3 >motor3_data_30min.csv
