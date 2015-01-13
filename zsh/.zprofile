#
# ~/.zprofile
#

#export PATH=$HOME/bin:/usr/local/bin:$PATH

#Preferred editor for local and remote sessions

export EDITOR=vim
export LESSHISTFILE="/dev/null"
#eval $(keychain --eval FBB0702A)
#ssh-add ~/.ssh/{hserv,fbox,git}.id_rsa

[[ -f ~/.zshrc ]] && . ~/.zshrc
[[ -f ~/.aliases ]] && . ~/.aliases
[[ -d "/sbin" ]] && PATH="/sbin:$PATH"
[[ -d "/usr/sbin" ]] && PATH="/usr/sbin:$PATH"
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
