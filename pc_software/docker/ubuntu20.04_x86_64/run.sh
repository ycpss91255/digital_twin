#!/usr/bin/env bash

docker run --rm \
    --privileged \
    --network=host \
    --ipc=host \
    "${gpu_flag}" \
    -v ${HOME}/.Xauthority:${docker}/.Xauthority \
    -e XAUTHORITY=${HOME}_folder/.Xauthority \
    -e DISPLAY=${DISPLAY} \
    -e QT_X11_NO_MITSHM=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v /etc/timezone:/etc/timezone:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /dev:/dev \
    -v ${WORKSPACE_PATH}:${HOME}/work \
    -it --name ${CONTAINER} $(id -un)/${IMAGE}
