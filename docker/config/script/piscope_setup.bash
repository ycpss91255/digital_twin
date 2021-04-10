#!/bin/bash

tar xvf ./piscope/piscope.tar -C /home/${USER}/
mv /home/${USER}/PISCOPE /home/${USER}/.PISCOPE
make -C /home/${USER}/.PISCOPE x86_64
make install -C /home/${USER}/.PISCOPE

cat ./piscope/*.sh >>/home/${USER}/.bashrc
cat ./piscope/*.sh >>/home/${USER}/.zshrc
