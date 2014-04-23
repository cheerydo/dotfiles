#
# ~/.zprofile
#
export PATH=$HOME/bin:/usr/local/bin:$PATH

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export TERM=rxvt-unicode
export GPGKEY=FBB0702A
export LESSHISTFILE="/dev/null"


[[ -f ~/.zshrc ]] && . ~/.zshrc
[[ -z $DISPLAY && XDG_VTNR -eq 1 ]] && exec startx
