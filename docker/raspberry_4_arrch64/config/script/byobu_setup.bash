#!/bin/bash

mkdir -p /home/${USER}/.byobu
cat ./byobu/* >/home/${USER}/.byobu/.tmux.conf
chown -R ${USER}:${GROUP} /home/${USER}/.byobu
