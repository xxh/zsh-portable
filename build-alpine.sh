#!/bin/bash

docker build . -f Dockerfile-alpine -t xxh/zsh-portable-alpine  #--no-cache --force-rm
docker run --rm -v `pwd`/result:/result xxh/zsh-portable-alpine
