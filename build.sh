#!/bin/bash

docker build . -t xxh/zsh-portable  #--no-cache --force-rm
docker run --rm -v `pwd`/result:/result xxh/zsh-portable