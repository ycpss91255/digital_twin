#!/usr/bin/env bash

# Get dependent parameters
source $(dirname $(readlink -f $0))/get_param.sh

docker run --rm \
    --privileged \
    --network=host \
    --ipc=host \
    ${GPU_FLAG} \
    -v /tmp/docker.xauth:/tmp/docker.xauth \
    -e XAUTHORITY=/tmp/docker.xauth \
    -e DISPLAY=${DISPLAY} \
    -e QT_X11_NO_MITSHM=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v /etc/timezone:/etc/timezone:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /dev:/dev \
    -v ${WS_PATH}:/home/${user}/work \
    -it --name ${CONTAINER} ${user}/${IMAGE}

    # -v /home/${user}/.Xauthority:/home/${user}/.Xauthority \
