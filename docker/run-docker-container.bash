#!/bin/bash

# start sharing xhost
xhost +local:root

export DOCKER_IMAGE_NAME=digital-twin-pc
export DOCKER_CONTAINER_NAME=digital-twin-pc

export WORKSPACE_PATH=$HOME/workspace/digital_twin_pc_ws

# run docker
docker run --rm \
  --net=host \
  --ipc=host \
  --gpus all \
  --privileged \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v $HOME/.Xauthority:$docker/.Xauthority \
  -v ${WORKSPACE_PATH}:$HOME/work \
  -e XAUTHORITY=$home_folder/.Xauthority \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -it --name $DOCKER_CONTAINER_NAME $(id -un)/${DOCKER_IMAGE_NAME}

  # -v /dev:/dev \
