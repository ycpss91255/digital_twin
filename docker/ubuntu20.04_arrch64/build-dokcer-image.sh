#!/usr/bin/env bash

# Get script path
file_dir=$(dirname $0)

source ${file_dir}/docker_variable.sh

# get parameter from system
user=$(id -un)
group=$(id -gn)
uid=$(id -u)
gid=$(id -g)

export DOCKER_BUILDKIT=1

# build docker images
docker build -t ${user}/${DOCKER_IMAGE_NAME} \
    --build-arg USER=${user} \
    --build-arg UID=${uid} \
    --build-arg GROUP=${group} \
    --build-arg GID=${gid} \
    -f ${file_dir}/Dockerfile ${file_dir}/..

#     --progress=plain \
