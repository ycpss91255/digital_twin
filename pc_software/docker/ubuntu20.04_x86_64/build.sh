#!/usr/bin/env bash

export DOCKER_BUILDKIT=1

# Build docker images
docker build -t ${user}/${IMAGE} \
    --build-arg USER=${user} \
    --build-arg UID=${uid} \
    --build-arg GROUP=${group} \
    --build-arg GID=${gid} \
    --build-arg HARDWARE=${hardware} \
    -f ${FILE_DIR}/Dockerfile ${FILE_DIR}/..

#     --progress=plain \
