#!/usr/bin/env bash

file_dir=$(dirname $0)

fusermount -u ${file_dir}/workspace
