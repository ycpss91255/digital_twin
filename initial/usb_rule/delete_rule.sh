#!/usr/bin/env bash

file_dir=$(dirname $0)
let len=${#file_dir}+1
rule_list=$(ls $file_dir/*.rules)

# Delete the created rule
for i in $rule_list; do
    rule=${i:len}
    sudo rm -f /etc/udev/rules.d/$rule
done

# Reload usb rule
sudo udevadm control --reload-rules && sudo udevadm trigger

echo "delete usb rule complete"
