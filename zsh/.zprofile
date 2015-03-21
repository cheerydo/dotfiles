#
# ~/.zprofile
#
setterm --blength 0

. /etc/profile

[[ -f ~/.zshrc ]] && . ~/.zshrc
[[ -f ~/.aliases ]] && . ~/.aliases
[[ -d "/sbin" ]] && PATH="/sbin:$PATH"
[[ -d "/usr/sbin" ]] && PATH="/usr/sbin:$PATH"
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
