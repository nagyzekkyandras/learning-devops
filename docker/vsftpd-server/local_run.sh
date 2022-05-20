#!/bin/bash

docker run -it -v $(pwd)/data:/ftp --workdir /root --rm myvsftpd:latest
