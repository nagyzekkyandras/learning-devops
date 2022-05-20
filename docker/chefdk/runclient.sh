#!/bin/bash

if [ -d "$(pwd)/chef" ] 
then
    if [ -d "$(pwd)/git" ] 
    then
	if [[ "$(docker images -q mychef:latest 2> /dev/null)" == "" ]]; then
	    echo "mychef:latest docker image not exists."
	else
	    docker run -it -v $(pwd)/chef:/root/.chef -v $(pwd)/git:/root/git --workdir /root --rm mychef:latest
	fi
    else
        echo "Error: Directory $(pwd)/git does not exists."
    fi
else
    echo "Error: Directory $(pwd)/chef does not exists."
fi
