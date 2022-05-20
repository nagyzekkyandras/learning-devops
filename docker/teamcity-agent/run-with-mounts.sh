#!/bin/bash

if [ -z "$1" ]; then
  echo "Add meg a szerver URL-t!"
  exit 1
else
  docker run -d -e SERVER_URL="$1"  \
      -u 0 \
      -v /var/run/docker.sock:/var/run/docker.sock  \
      -v /opt/buildagent/work:/opt/buildagent/work \
      -v /opt/buildagent/temp:/opt/buildagent/temp \
      -v /opt/buildagent/tools:/opt/buildagent/tools \
      -v /opt/buildagent/plugins:/opt/buildagent/plugins \
      -v /opt/buildagent/system:/opt/buildagent/system \
      jetbrains/teamcity-agent
fi