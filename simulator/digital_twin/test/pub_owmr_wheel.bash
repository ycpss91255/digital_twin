#!/bin/bash
rostopic pub -1 /omwr/wheel1/command std_msgs/Float64 "data: 50.0"
# rostopic pub -1 /omwr/wheel2/command std_msgs/Float64 "data: 0.0"
rostopic pub -1 /omwr/wheel3/command std_msgs/Float64 "data: -50.0"
# rostopic pub -1 /omwr/wheel4/command std_msgs/Float64 "data: 0.0"
