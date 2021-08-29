#!/usr/bin/env bash

# Get script path
file_dir=$(dirname $0)
# Get parameter from system
user=$(id -un)
group=$(id -gn)
uid=$(id -u)
gid=$(id -g)

# Image name
DOCKER_IMAGE_NAME=digital-twin-pc

export DOCKER_BUILDKIT=1

# Build docker images
docker build -t ${user}/${DOCKER_IMAGE_NAME} \
    --build-arg USER=${user} \
    --build-arg UID=${uid} \
    --build-arg GROUP=${group} \
    --build-arg GID=${gid} \
    -f ${file_dir}/Dockerfile ${file_dir}/..

#     --progress=plain \
