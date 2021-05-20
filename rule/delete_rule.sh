#!/bin/bash

# pwd

file_dir=`dirname $0`

sudo rm /etc/udev/rules.d/*.rules

sudo udevadm control --reload-rules ; udevadm trigger

echo "delete usb rule complete"
