# #!/bin/bash
cd ~/work/data

rostopic echo -b ~/work/data/motor_cmd_30min.bag -p motion/motor_speed >motor_cmd_30min.csv
rostopic echo -b ~/work/data/motor_data_30min.bag -p motion/motor_state0 >motor0_data_30min.csv
rostopic echo -b ~/work/data/motor_data_30min.bag -p motion/motor_state1 >motor1_data_30min.csv
rostopic echo -b ~/work/data/motor_data_30min.bag -p motion/motor_state2 >motor2_data_30min.csv
rostopic echo -b ~/work/data/motor_data_30min.bag -p motion/motor_state3 >motor3_data_30min.csv
