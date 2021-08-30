#!/bin/bash

file_dir=$(dirname $0)

# get parameter from system
user=$(id -un)
group=$(id -gn)
uid=$(id -u)
gid=$(id -g)

export DOCKER_BUILDKIT=1

DOCKER_IMAGE_NAME=digital-twin-rpi4

# build docker images
docker build -t ${user}/${DOCKER_IMAGE_NAME} \
    --build-arg USER=${user} \
    --build-arg UID=${uid} \
    --build-arg GROUP=${group} \
    --build-arg GID=${gid} \
    ${file_dir}

# --progress=plain
