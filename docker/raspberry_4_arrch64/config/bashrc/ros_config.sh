# ros entrypoint
source /opt/ros/$ROS_DISTRO/setup.bash

# localhost
# export ROS_MASTER_URI=http://localhost:11311
# export ROS_HOSTNAME=localhost

export ROS_MASTER_URI=http://10.42.0.1:11311
export ROS_HOSTNAME=10.42.0.2
