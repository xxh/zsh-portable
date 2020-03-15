#!/bin/bash

docker build . -f zsh-portable-musl-alpine.Dockerfile -t xxh/zsh-portable-musl-alpine  #--no-cache --force-rm
docker run --rm -v `pwd`/result:/result xxh/zsh-portable-musl-alpine
