#!/bin/bash

mkdir -p /home/${USER}/.config/terminator
cp -r ./terminator /home/${USER}/.config/terminator
chown -R ${USER}:${GROUP} /home/${USER}/.config
