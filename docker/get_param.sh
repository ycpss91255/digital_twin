#!/usr/bin/env bash

# Function to set the Docker image, container, and workspace path based on the directory of the current script
#
# Parameters:
#   None
#
# Returns:
#   None
#
# Outputs the following variables:
#     FILE_DIR: the directory of the current script
#     IMAGE: the name of the Docker image to use
#     CONTAINER: the name of the Docker container to create
#     WS_PATH: the path to the workspace directory to use
#
function set_docker_name() {
    # Use workspace name as image and container name
    FILE_DIR=$(dirname $(readlink -f $0))

    # Check if the `docker` folder has a suffix, such as `docker_xxx`
    # If yes, extract the suffix and store it in the `IMAGE` variable
    IMAGE=$(echo "${FILE_DIR}" | awk -F/ '{
            for (i=NF; i>0; i--) {
                if ($i ~ /^docker_/) {
                    sub(/^docker_/,"",$i);
                    print $i;
                    exit
                }
            }
        }')

    # Extract the path of the workspace folder and store it in the `WS_PATH` variable
    WS_PATH=$(echo "${FILE_DIR}" | rev | cut -d '/' -f 2- | rev)

    # If the `docker` folder has no suffix, check if the workspace folder has a prefix, such as `xxx_ws`
    # If yes, extract the prefix and store it in the `IMAGE` variable, and update the `WS_PATH` variable accordingly
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

        WS_PATH=$(echo "${FILE_DIR}" | awk -v ws=${IMAGE}_ws -F/ 'BEGIN {found=0} {
                for (i=1; i<=NF; i++) {
                    if ($i == ws){
                        found=1;
                        break;
                    }
                    printf "%s/", $i
                }
                if (found) printf "%s/", ws
            }')
    fi

    # If the workspace folder has no prefix/suffix, set the image name to `unknown`
    # and the workspace path to the current directory
    IMAGE=${IMAGE:-unknown}
    WS_PATH=${WS_PATH:-${FILE_DIR}}

    # Set the container name to be the same as the image name
    CONTAINER=${IMAGE}

    # Print out the values of FILE_DIR, IMAGE, CONTAINER, and WS_PATH
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
        nvidia-smi -L | grep -iq nvidia||
        command -v nvidia-smi >/dev/null 2>&1) &&
        (command -v nvidia-docker >/dev/null 2>&1 ||
            dpkg -l | grep -q nvidia-container-toolkit); then
        GPU_FLAG="--gpus all"
    else
        GPU_FLAG=""
    fi

    # Print out the values of GPU_FLAG
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
    # Try to retrieve the current user from Docker using the `docker info` command and store it in the `user` variable
    # If that fails, fall back to using the `id` command to get the current user
    user=$(docker info 2>/dev/null | grep Username | awk -F '[: ]' '{print $2}')
    user=${user:-$(id -un)}

    # Retrieve the group of the current user using the `id` command and store it in the `group` variable
    group=$(id -gn)

    # Retrieve the UID of the current user using the `id` command and store it in the `uid` variable
    uid=$(id -u)

    # Retrieve the GID of the current user using the `id` command and store it in the `gid` variable
    gid=$(id -g)

    # Retrieve the hardware architecture of the current system using the `uname` command and store it in the `hardware` variable
    # TODO: add comfirm dockerfile steps
    hardware=$(uname -m)

    # Print out the values of user, group, uid, gid and hardware
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

# TODO: wait check
# Start sharing xhost
# xhost +local:root

read -r GPU_FLAG <<<"$(check_nvidia)"
read -r user group uid gid hardware <<<"$(get_system_info)"
read -r FILE_DIR IMAGE CONTAINER WS_PATH <<<"$(set_docker_name)"


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
    echo -e "CONTAINER=${CONTAINER}\n"
fi
