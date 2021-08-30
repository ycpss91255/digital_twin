#!/usr/bin/env bash

file_dir=$(dirname $0)

source ${file_dir}/docker_variable.sh
source ${file_dir}/get_graph_card.sh

# Start sharing xhost
xhost +local:root

IntelDockerRun() {
    docker run --rm \
        --net=host \
        --ipc=host \
        --privileged \
        -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
        -v ${HOME}/.Xauthority:$docker/.Xauthority \
        -v ${WORKSPACE_PATH}:${HOME}/work \
        -v /dev:/dev \
        -v /etc/timezone:/etc/timezone:ro \
        -v /etc/localtime:/etc/localtime:ro \
        -e XAUTHORITY=${HOME}_folder/.Xauthority \
        -e DISPLAY=$DISPLAY \
        -e QT_X11_NO_MITSHM=1 \
        -it --name $DOCKER_CONTAINER_NAME $(id -un)/${DOCKER_IMAGE_NAME}
}
NvidiaDockerRun() {
    docker run --rm \
        --net=host \
        --ipc=host \
        --gpus all \
        --privileged \
        -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
        -v ${HOME}/.Xauthority:$docker/.Xauthority \
        -v ${WORKSPACE_PATH}:${HOME}/work \
        -v /dev:/dev \
        -v /etc/timezone:/etc/timezone:ro \
        -v /etc/localtime:/etc/localtime:ro \
        -e XAUTHORITY=${HOME}_folder/.Xauthority \
        -e DISPLAY=$DISPLAY \
        -e QT_X11_NO_MITSHM=1 \
        -it --name $DOCKER_CONTAINER_NAME $(id -un)/${DOCKER_IMAGE_NAME}
}

GetGraphCard false

if [ $GraphicsCard == "INTEL" ]; then
    IntelDockerRun
elif [ $GraphicsCard == "NVIDIA" ]; then
    NvidiaDockerRun
else
    echo "Error : Unknown Graphics Card!!"
fi
