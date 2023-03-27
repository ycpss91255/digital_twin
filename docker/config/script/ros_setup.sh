#!/usr/bin/env bash

# ${1}: ROS_TYPE
# ${2}: ROS_MASTER_IP
# ${3}: ROS_SLAVE_IP

# add ROS env setting to bash config
ROS_TYPE=$(echo ${1} | tr [a-z] [A-Z])
echo "source /opt/ros/"${ROS_DISTRO}"/setup.bash" >>/home/"${USER}"/.bashrc
echo "export ROS_MASTER_URI=http://${2}:11311" >>/home/"${USER}"/.bashrc

if [ ${ROS_TYPE} == "MASTER" ]; then
    echo "export ROS_HOSTNAME=${2}" >>/home/${USER}/.bashrc
elif [ ${ROS_TYPE} == "SLAVE" ]; then
    echo "export ROS_HOSTNAME=${3}" >>/home/${USER}/.bashrc
fi
