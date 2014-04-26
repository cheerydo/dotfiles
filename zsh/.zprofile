#
# ~/.zprofile
#
export PATH=$HOME/bin:/usr/local/bin:$PATH

#Preferred editor for local and remote sessions

export EDITOR=vim
export TERM=xterm-termite
export GPGKEY=FBB0702A
export LESSHISTFILE="/dev/null"


[[ -f ~/.zshrc ]] && . ~/.zshrc
[[ -z $DISPLAY && XDG_VTNR -eq 1 ]] && exec startx
