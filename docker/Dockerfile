# syntax = docker/dockerfile:experimental
FROM osrf/ros:noetic-desktop-full-focal

# Arguments
ARG USER=initial
ARG GROUP=initial
ARG UID=1000
ARG GID=${UID}
ARG SHELL=/bin/bash

# Env vars for the nvidia-container-runtime.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

# Setup users and groups
RUN groupadd --gid ${GID} ${GROUP} \
  && useradd --gid ${GID} --uid ${UID} -ms ${SHELL} ${USER} \
  && mkdir -p /etc/sudoers.d \
  && echo "${USER}:x:${UID}:${UID}:${USER},,,:$HOME:${shell}" >> /etc/passwd \
  && echo "${USER}:x:${UID}:" >> /etc/group \
  && echo "${USER} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER}" \
  && chmod 0440 "/etc/sudoers.d/${USER}"

# Replace apt urls
RUN sed -i 's@archive.ubuntu.com@ftp.tku.edu.tw/@g' /etc/apt/sources.list

# Install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
  sudo \
  ssh wget curl rsync net-tools tar \
  byobu zsh \
  terminator gnome-terminal libcanberra-gtk-module libcanberra-gtk3-module \
  nano vim git \
  # work-tools
  python3-pip python3-catkin-tools ros-noetic-gazebo-ros-pkgs \
  ros-noetic-effort-controllers \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

  # dbus-x11 libglvnd0 libgl1 libglx0 libegl1 libxext6 libx11-6 \

WORKDIR /home/${USER}/.tmp

# setup custom configuration
COPY config .
# Terminal
RUN bash ./script/bash_setup.bash \
  && bash ./script/terminator_setup.bash \
  && bash ./script/zsh_setup.bash \
  && bash ./script/byobu_setup.bash \
  # Dependent
  && bash ./script/rule_setup.bash \
  && bash ./script/pip_setup.bash \
  && bash ./script/piscope_setup.bash \
  && rm -rf /home/${USER}/.tmp

# # copy entrypoint
# COPY entrypoint.bash /entrypoint.bash
# RUN chmod 777 /entrypoint.bash

WORKDIR /home/${USER}

# Switch user to ${USER}
USER ${USER}
RUN sudo mkdir work

# Make SSH available
EXPOSE 22

# Switch to user's HOME folder
WORKDIR /home/${USER}/work

# ENTRYPOINT ["terminator"]
ENTRYPOINT ["byobu"]
