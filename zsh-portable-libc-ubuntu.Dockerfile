FROM ubuntu:14.04
VOLUME /result

ENV ZSH_VER 5.8

RUN mkdir -p /zsh /result

WORKDIR /zsh
RUN apt update && apt install -y wget mc make xz-utils build-essential libncurses-dev git python locales
RUN locale-gen en_US.UTF-8
RUN wget https://downloads.sourceforge.net/project/zsh/zsh/$ZSH_VER/zsh-$ZSH_VER.tar.xz 
RUN tar xf zsh-$ZSH_VER.tar.xz 

#
# Build portable zsh (https://www.zsh.org/mla/workers/2019/msg00866.html)
#
WORKDIR zsh-$ZSH_VER
RUN ./configure --disable-dynamic --prefix=$PWD/run --bindir=$PWD/run --enable-etcdir=./run/etc --enable-scriptdir=./run/scripts --enable-fndir=./run/functions --enable-function-subdirs --disable-site-fndir --with-tcsetpgrp
ADD config.modules ./config.modules-new
RUN cp config.modules-new config.modules
RUN make && make install
WORKDIR run
RUN cp /lib/x86_64-linux-gnu/libtinfo.so.5 /lib/x86_64-linux-gnu/libncurses.so.5 ./
ADD zsh.sh .
RUN chmod +x zsh.sh && rm zsh-*
# This name is used in https://github.com/xxh/xxh please don't change
CMD tar -zcf /result/zsh-portable-`uname`-`uname -m`.tar.gz * && ls -sh1 /result
