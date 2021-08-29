#!/bin/bash

DOCKER_IMAGE_NAME=digital-twin-rpi4
DOCKER_CONTAINER_NAME=digital-twin-rpi4

WORKSPACE_PATH=$HOME/workspace/digital_twin_rpi4_ws

# run docker
docker run --rm \
  --net=host \
  --ipc=host \
  --privileged \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v $HOME/.Xauthority:$docker/.Xauthority \
  -v ${WORKSPACE_PATH}:$HOME/work \
  -v /dev:/dev \
  -v /etc/timezone:/etc/timezone:ro \
  -v /etc/localtime:/etc/localtime:ro \
  -e XAUTHORITY=$home_folder/.Xauthority \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -it --name $DOCKER_CONTAINER_NAME $(id -un)/${DOCKER_IMAGE_NAME}

# -it --name $DOCKER_CONTAINER_NAME ros:noetic-ros-core-focal
