#!/bin/bash

# Get build dir path
BUILD_DIR=/var/data/bamboo-agent-home/xml-data/build-dir/
CACHE_DIR=/var/data/bamboo-agent-home/xml-data/build-dir/_git-repositories-cache/

# Delete everything not accessed in last 21 days from build dir
# find $BUILD_DIR -atime +21 -delete
sudo find $BUILD_DIR -maxdepth 1 -atime +21 -exec rm -rv {} \;
sudo find $CACHE_DIR -maxdepth 1 -atime +21 -exec rm -rv {} \;