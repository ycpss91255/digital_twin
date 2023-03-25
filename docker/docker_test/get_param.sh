#!/usr/bin/env bash

# Use workspace name as image and container name

function set_docker_name() {
    FILE_DIR=$(dirname $(readlink -f $0))

    # Confirm whether the docker folder has a suffix, such as "docker_xxx"
    IMAGE=$(basename ${FILE_DIR} | cut -d '_' -f 2)
#    IMAGE=$(basename ${FILE_DIR})

    WS_PATH=$(echo "${FILE_DIR}" | rev | cut -d '/' -f 2- | rev)

    # Docker folder has no suffix, so confirm whether workspace folder has a prefix, such as "xxx_ws"
    if [[ -z "${IMAGE}" ]]; then
        IMAGE=$(echo "${FILE_DIR}" | awk -F/ '{
                for (i=NF; i>0; i--) {
                    if ($i ~ /_ws$/) {
                        sub(/_ws$/,"",$i);
                        print $i;
                        exit
                    }
                }
            }')


        # WS_PATH=$(echo "${FILE_DIR}" | awk -v ws=${IMAGE}_ws -F/ '{
        #         for (i=1; i<=NF; i++) {
        #             if ($i == ws){
        #                 break;
        #             }
        #             printf "%s/", $i
        #         }
        #         printf "%s/", ws
        #     }')
    fi

    # Workspace folder has no prefix, so image use default name "unknown"
    IMAGE=${IMAGE:-unknown}
    # docker container name equal to image name
    CONTAINER=${IMAGE}

    printf "%s %s %s %s" "${FILE_DIR}" "${IMAGE}" "${CONTAINER}" "${WS_PATH}"
}

# Function to check if GraphicsCard is NVIDIA and nvidia-docker2 or nvidia-container-runtime is installed
#
# Parameters:
#   None
#
# Returns:
#   '--gpus all' if NVIDIA graphics card and nvidia-docker2 or nvidia-container-runtime is installed, empty string otherwise
#
function check_nvidia() {
    if (lspci | grep -q VGA ||
        lspci | grep -iq NVIDIA ||
        lsmod | grep -q nvidia ||
        nvidia-smi -L | grep -iq nvidia) &&
        (command -v nvidia-smi >/dev/null 2>&1 ||
            command -v nvidia-docker >/dev/null 2>&1 ||
            dpkg -l | grep -q nvidia-container-toolkit); then
        GPU_FLAG="--gpus all"
    else
        GPU_FLAG=""
    fi
    printf "%s" "${GPU_FLAG}"
}

# Function to get system parameter, including user, group, UID, GID, hardware architecture
#
# Parameters:
#   None
#
# Returns:
#   None
#
# Outputs the following variables:
#     user: the user of the current Docker environment or the user of the current system
#     group: the group of the current user
#     uid: the UID of the current user
#     gid: the GID of the current user
#     hardware: the hardware architecture of the current system
#
function get_system_info() {
    # Get system parameter
    user=$(docker info 2>/dev/null | grep Username | awk -F '[: ]' '{print $2}')
    if [ -z "${user}" ]; then
        user=$(id -un)
    fi

    group=$(id -gn)
    uid=$(id -u)
    gid=$(id -g)
    hardware=$(uname -m)
    printf "%s %s %d %d %s" "${user}" "${group}" "${uid}" "${gid}" "${hardware}"
}

# Analyze the user input parameters to make thecorresponding action
ARGS=$(getopt \
    -o h \
    --long debug,help \
    -- "$@")
eval set -- "${ARGS}"

while true; do
    case "$1" in
    --debug)
        DEBUG=true
        shift
        ;;
    -h | --help)
        # TODO: wait write help
        echo "Usage: $0 [OPTION]"
        echo " Options:"
        echo " -d, --debug    Enable debug mode"
        echo " -h, --help     Show this help massage and exit"
        exit 0
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "Unknown option: ${1}"
        exit 1
        ;;
    esac
done

# $DEBUG && set -x

# GPU_FLAG=$(check_nvidia)
read -r GPU_FLAG <<<"$(check_nvidia)"
read -r user group uid gid hardware <<<"$(get_system_info)"
read -r FILE_DIR IMAGE CONTAINER WS_PATH <<<"$(set_docker_name)"

# TODO: wait check
# Start sharing xhost
# xhost +local:root

if [ "$DEBUG" = true ]; then
    echo -e "GPU_FLAG=${GPU_FLAG}\n"

    echo "user=${user}"
    echo "group=${group}"
    echo "uid=${uid}"
    echo "gid=${gid}"
    echo -e "hardware=${hardware}\n"

    echo "FILE_DIR=${FILE_DIR}"
    echo "WS_PATH=${WS_PATH}"
    echo "IMAGE=${IMAGE}"
    echo -e "CONTAINER=${CONTAINER}"
fi
