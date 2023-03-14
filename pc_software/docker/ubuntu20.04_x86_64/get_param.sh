#!/usr/bin/env bash

# Use workspace name as image and container name
FILE_DIR=$(dirname $(readlink -f $0))

IMAGE=$(echo $(dirname $(readlink -f $0)) \
    | awk -F/ '{for (i=NF; i>0; i--) {if ($i ~ /_ws$/) {print $i; exit}}}')

CONTAINER=${IMAGE}

WS_PATH=$(echo $(dirname $(readlink -f $0)) \
    | awk -v ws=${IMAGE}_ws -F/ '{for (i=1; i<=ws; i++) {printf "%s/", $i}}')

# Start sharing xhost
# xhost +local:root

# Check if GraphicsCard is NVIDIA and nvidia-docker2 or nvidia-container-runtime is installed
if lspci | grep -q VGA && lspci | grep -iq NVIDIA && lsmod | grep -q nvidia && \
   (command -v nvidia-docker > /dev/null 2>&1 || dpkg -l | grep -q nvidia-container-toolkit); then
    GPU_FLAG="--gpus all"
else
    GPU_FLAG=""
fi

echo "user=$(id -un)"
echo "group=$(id -gn)"
echo "uid=$(id -u)"
echo "gid=$(id -g)"
echo "hardware=$(uname -m)"
echo "WS_PATH=${WS_PATH}"
echo "IMAGE=${IMAGE}"
echo "CONTAINER=${CONTAINER}"
echo "GPU_FLAG=${GPU_FLAG}"
