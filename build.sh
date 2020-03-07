#!/bin/bash

docker build . -t xxh/zsh-portable
docker run --rm -v `pwd`/result:/result xxh/zsh-portable