#!/usr/bin/env bash

# Get dependent parameters
source $(dirname $(readlink -f $0))/get_param.sh

export DOCKER_BUILDKIT=1

# Build docker images
docker build -t ${user}/${IMAGE} \
    --build-arg USER=${user} \
    --build-arg UID=${uid} \
    --build-arg GROUP=${group} \
    --build-arg GID=${gid} \
    --build-arg HARDWARE=${hardware} \
    -f ${FILE_DIR}/"Dockerfile_${hardware}" ${FILE_DIR}

#     --progress=plain \
#     --no-cache \
