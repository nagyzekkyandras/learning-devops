#!/bin/bash

docker build -f Dockerfile-$1 -t ansible-$1 .