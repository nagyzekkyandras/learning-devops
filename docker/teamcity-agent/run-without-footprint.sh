#!/bin/bash

if [ -z "$1" ]; then
  echo "Add meg a szerver URL-t!"
  exit 1
else
  docker run -d -e SERVER_URL="$1"  \
      -u 0 \
      -v /var/run/docker.sock:/var/run/docker.sock  \
      jetbrains/teamcity-agent
fi