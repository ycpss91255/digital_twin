#!/usr/bin/env bash

rm -rf ./opencr_update.tar.bz2 opener_update

if ! dpkg -S "tar" &>/dev/null 2>&1; then
	sudo apt-get install -y tar
fi

wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS2/latest/opencr_update.tar.bz2 &&
	tar -xvf ./opencr_update.tar.bz2 &&
	./opencr_update/update.sh $OPENCR_PORT $OPENCR_MODEL.opencr &&
	rm -rf ./opencr_update.tar.bz2 opener_update
