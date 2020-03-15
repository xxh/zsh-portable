#!/bin/bash

docker build . -f zsh-portable-libc-ubuntu.Dockerfile -t xxh/zsh-portable-libc-ubuntu  #--no-cache --force-rm
docker run --rm -v `pwd`/result:/result xxh/zsh-portable-libc-ubuntu
