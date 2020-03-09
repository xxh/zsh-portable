CDIR="$(cd "$(dirname "$0")" && pwd)"
cd $CDIR

# Creating this recursive symlink placed here instead of creating it while building to avoid recursive reading while scp
[ ! -d run ] && ln -sf . run
./zsh -fc "typeset -p fpath" | sed "s,./run,$CDIR,g" > .zshenv

export ZDOTDIR=$CDIR
export PATH=$CDIR:$PATH
export ZSH_DISABLE_COMPFIX=true
export LD_LIBRARY_PATH=$CDIR:$LD_LIBRARY_PATH

./zsh "$@"