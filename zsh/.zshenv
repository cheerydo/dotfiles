export IOUP_TOKEN="$(<~/doc/iotoken)"
export VISUAL=vim
export EDITOR=$VISUAL
export PAGER=less
export LESSHISTFILE="-"
export LANG="en_US.UTF-8"
if [[ "$HOST" == chicken ]]; then
  export PKG_PATH="http://openbsd.mirrors.hoobly.com/5.8/packages/$(machine -a)/"
  export TERM="screen-256color"
fi
ZDOTDIR=~/.config/zsh
