#!/usr/bin/env bash

user=iclab
ip=10.42.0.2

file_dir=$(dirname $0)

sshfs ${user}@${ip}:/home/iclab/workspace -o nonempty ${file_dir}/workspace
