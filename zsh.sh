./zsh -fc "typeset -p fpath" | sed "s,./run,$PWD,g" > .zshenv
export ZDOTDIR=$PWD
export PATH=$PWD:$PATH
export ZSH_DISABLE_COMPFIX=true
export HISTFILE=$PWD/.zsh_history
./zsh