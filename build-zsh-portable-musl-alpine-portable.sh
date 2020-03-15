#!/bin/bash

./build-zsh-portable-musl-alpine.sh

docker build . -f zsh-portable-musl-alpine-portable.Dockerfile -t xxh/zsh-portable-musl-alpine-portable  #--no-cache --force-rm
docker run --rm -v `pwd`/result:/result xxh/zsh-portable-musl-alpine-portable
