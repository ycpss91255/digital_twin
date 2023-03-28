#!/usr/bin/env bash

# ${1}: ROS2 version
# ${2}: ROS2 network localhost or global
# ${3}: ROS2 global numble

echo -e "\nsource /opt/ros/"${1}"/setup.bash" >> /home/"${USER}"/.bashrc

# add ROS2 env setting to bash config
ROS_TYPE=$(echo ${2} | tr [a-z] [A-Z])

if [[ ${ROS_TYPE} == "LOCALHOST" ]]; then
    echo "export ROS_LOCALHOST_ONLY=1" >> /home/"${USER}"/.bashrc
else
    if [[ -z ${2} ]]; then
        echo "export ROS_DOMAIN_ID=0" >> /home/"${USER}"/.bashrc
    else
        echo "export ROS_DOMAIN_ID=${3}" >> /home/"${USER}"/.bashrc
    fi
fi
