#!/bin/bash

unzip ./pigpio/pigpio_lib.zip -d /home/${USER}/
make -C /home/${USER}/pigpio-master
make install -C /home/${USER}/pigpio-master
# tar xvf ./pigpio/piscope.tar -C /home/${USER}/

