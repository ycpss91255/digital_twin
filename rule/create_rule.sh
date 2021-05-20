#!/bin/bash

# pwd

file_dir=`dirname $0`

sudo cp ${file_dir}/*.rules /etc/udev/rules.d/

sudo udevadm control --reload-rules ; udevadm trigger

echo "load usb rule complete"
