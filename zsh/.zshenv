export XDG_CONFIG_HOME="$HOME/.config"
export IOUP_TOKEN="$(<~/doc/iotoken)"
export VISUAL=vim
export EDITOR=$VISUAL
export PAGER=less
export LESSHISTFILE="-"
export LANG="en_US.UTF-8"
export WINEPREFIX=~/win64
export WINEARCH=win64

if [[ "$HOST" == chicken ]]; then
  export PKG_PATH="http://openbsd.mirrors.hoobly.com/$(uname -r)/packages/$(machine -a)/"
  export TERM="screen-256color"
fi

ZDOTDIR=~/.config/zsh
