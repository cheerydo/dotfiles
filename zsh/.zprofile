#
# ~/.zprofile
#

export EDITOR=vim
export GPGKEY=FBB0702A
export LESSHISTFILE="/dev/null"
eval $(keychain --eval FBB0702A)
ssh-add ~/.ssh/{hserv,fbox,git}.id_rsa
export LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:'

[[ -f ~/.zshrc ]] && . ~/.zshrc
[[ -f ~/.aliases ]] && . ~/.aliases
[[ -d "/sbin" ]] && PATH="/sbin:$PATH"
[[ -d "/usr/sbin" ]] && PATH="/usr/sbin:$PATH"
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
