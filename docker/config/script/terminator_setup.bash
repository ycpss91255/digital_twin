#!/bin/bash

mkdir -p /home/${USER}/.config/
cp -r ./terminator /home/${USER}/.config/
chown -R ${USER}:${GROUP} /home/${USER}/.config
