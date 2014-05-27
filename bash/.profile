#
# ~/.bash_profile
#

export EDITOR=/usr/bin/vim
#export TERM=rxvt-unicode
export TERM=xterm-termite
export GPGKEY=FBB0702A
export LESSHISTFILE="/dev/null"

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.aliases ]] && . ~/.aliases
[[ -d "/sbin" ]] && PATH="/sbin:$PATH"
[[ -d "/usr/sbin" ]] && PATH="/usr/sbin:$PATH"
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
