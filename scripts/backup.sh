#!/bin/bash
now=$(date +"%m_%d_%Y.%H:%M:%S")
file=/tmp/backup-$now.tar.gz

echo "Creating backup in $file"
# Only need to create a tar for the root directory since it contains a git with /etc/ config
tar cvfz $file /root



