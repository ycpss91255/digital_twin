#!/usr/bin/env bash

file_dir=$(dirname $0)

# * ROS2 turtlebot3 dedicated USB rule copy (in Docker container)
# turtlebot3 USB rule file name is 99-turtlebot3-cdc.rules
# sudo cp $(ros2 pkg prefix turtleboe3_bringup)/share/turtlebot3_bringup/99-turtlebot3-cdc.rules ${file_dir}/

# Copy the created USB rule
sudo cp ${file_dir}/*.rules /etc/udev/rules.d/

# Reload usb rule
sudo udevadm control --reload-rules && sudo udevadm trigger

echo "load usb rule complete"
