CDIR="$(cd "$(dirname "$0")" && pwd)"
cd $CDIR

export LD_LIBRARY_PATH=$CDIR:$LD_LIBRARY_PATH
export ZDOTDIR=$CDIR
export PATH=$CDIR:$PATH
export ZSH_DISABLE_COMPFIX=true

# Creating this recursive symlink placed here instead of creating it while building to avoid recursive reading while scp
[ ! -d run ] && ln -sf . run
[ -f libc.musl-x86_64.so.1 ] && ln -sf libc.musl-x86_64.so.1 ld-musl-x86_64.so.1
./zsh -fc "typeset -p fpath" | sed "s,./run,$CDIR,g" > .zshenv
./zsh "$@"
