#
# ~/.zprofile
#

export PATH=$HOME/bin:/usr/local/bin:$PATH

#Preferred editor for local and remote sessions

export EDITOR=vim
export TERM=xterm-termite
export TERM=rxvt-unicode
#export GPGKEY=FBB0702A
export LESSHISTFILE="/dev/null"
eval $(ssh-agent)
ssh-add ~/.ssh/{server,fbox}.id_rsa
eval $(gpg-agent --daemon)

[[ -f ~/.zshrc ]] && . ~/.zshrc
[[ -f ~/.aliases ]] && . ~/.aliases
[[ -d "/sbin" ]] && PATH="/sbin:$PATH"
[[ -d "/usr/sbin" ]] && PATH="/usr/sbin:$PATH"
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
