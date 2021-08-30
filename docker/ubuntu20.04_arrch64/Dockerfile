# syntax = docker/dockerfile:experimental
FROM ros:noetic-ros-base-focal

# Arguments
ARG USER=initial
ARG GROUP=initial
ARG UID=1000
ARG GID=${UID}
ARG SHELL=/bin/bash

# Setup users and groups
RUN groupadd --gid ${GID} ${GROUP} \
    && useradd --gid ${GID} --uid ${UID} -ms ${SHELL} ${USER} \
    && mkdir -p /etc/sudoers.d \
    && echo "${USER}:x:${UID}:${UID}:${USER},,,:$HOME:${shell}" >> /etc/passwd \
    && echo "${USER}:x:${UID}:" >> /etc/group \
    && echo "${USER} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER}" \
    && chmod 0440 "/etc/sudoers.d/${USER}"

# Replace apt urls
# Change to Taiwan
# RUN sed -i 's@archive.ubuntu.com@tw.archive.ubuntu.com@g' /etc/apt/sources.list
# Change to tku
RUN sed -i 's@archive.ubuntu.com@ftp.tku.edu.tw@g' /etc/apt/sources.list

# Install packages
RUN apt update && apt-get install -y --no-install-recommends \
    sudo git htop wget curl \
    # Shell
    byobu zsh terminator \
    # Editing tools
    nano vim \
    gnome-terminal libcanberra-gtk-module libcanberra-gtk3-module \
    python3-pip python3-dev python3-setuptools \
    # Work tools
    python3-catkin-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/${USER}/.tmp

# Copy custom configuration
COPY config .

# ROS Arguments
# Is the computer master or slave in ROS
ARG ROS_TYPE=SLAVE
ARG ROS_MASTER_IP=10.42.0.1
ARG ROS_SLAVE_IP=10.42.0.2

RUN bash ./script/shell_setup.sh \
    # Dependent
    && bash ./script/pip_setup.sh \
    && rm -rf /home/${USER}/.tmp

# Copy entrypoint
COPY ./ubuntu20.04_arrch64/entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

WORKDIR /home/${USER}

# Switch user to ${USER}
USER ${USER}

RUN sudo mkdir work

# Make SSH available
EXPOSE 22

# Switch to user's HOME folder
WORKDIR /home/${USER}/work

# ENTRYPOINT ["terminator"]
# ENTRYPOINT ["zsh"]
# ENTRYPOINT ["bash"]
ENTRYPOINT ["/entrypoint.sh","byobu"]
