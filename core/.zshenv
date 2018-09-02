export XDG_CONFIG_HOME="$HOME/.config"
export VISUAL=vim
export EDITOR=$VISUAL
export PAGER=less
export LESSHISTFILE="-"
export LANG="en_US.UTF-8"
export WINEPREFIX=~/win64
export WINEARCH=win64
export PATH=$PATH:~/bin:/usr/sbin/sbin

if [[ "$HOST" == beans ]]; then
  export IOUP_TOKEN="$(<~/doc/iotoken)"
fi

ZDOTDIR=~/.config/zsh
