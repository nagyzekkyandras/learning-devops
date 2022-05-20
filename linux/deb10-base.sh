#!/bin/bash

if [ $# -eq 0 ]
  then
    apt-get update
    apt-get install -y sudo lsb-release git
  elif [ $1 == "ansible" ]
  then
    apt-get update
    apt-get install ansible git wget nano python sudo lsb-release  -y
  elif [ $1 == "dev" ]
  then
    apt-get update
    apt-get install git wget nano python mc sudo lsb-release network-manager  -y
fi

