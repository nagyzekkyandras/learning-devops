#!/bin/bash

git clone git@github.com:WWBN/AVideo.git git

rm git/Dockerfile

cp Dockerfile git/Dockerfile

docker build -t $1 ./git

