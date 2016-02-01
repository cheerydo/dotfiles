# add shell completions dir to fpath
fpath=($ZDOTDIR/.completion $fpath)
HELPDIR=/usr/share/zsh/$ZSH_VERSION/help
autoload -Uz compinit run-help vcs_info edit-command-line
compinit

setopt histappend \
    histexpiredupsfirst \
    histverify \
    nohup \
    completeinword \
    interactivecomments \
    autocd \
    automenu \
    nobgnice \
    prompt_subst \
    nocheckjobs

# Some history params
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$ZDOTDIR/.zsh_history

# Add other paths
typeset -U path
path=(~/bin /sbin /usr/sbin $path)

# Keybindings - vim for the win
bindkey -v
vimode=i
bindkey '^R' history-incremental-search-backward
bindkey ' ' magic-space

# Prevent key race with vim escape key
export KEYTIMEOUT=1

# Cases are sooo insensitive
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':vcs_info:*' enable git svn

# Erliarses
if [[ -f $ZDOTDIR/.aliases ]]; then
    . $ZDOTDIR/.aliases
fi

if [[ $HOST == "chicken" ]]; then
    . $ZDOTDIR/aliases.obsd
    eval $(gdircolors $ZDOTDIR/.dircolors)
elif [[ $HOST == "potatoes" ]]; then
    . $ZDOTDIR/aliases.debian
    eval $(dircolors $ZDOTDIR/.dircolors)
else
    . $ZDOTDIR/aliases.arch
    eval $(dircolors $ZDOTDIR/.dircolors)
fi

case $TERM in
  *termite)
  precmd () {
    vcs_info
    print -Pn "\e]0;termite\a"
  }
  preexec () {
    print -Pn "\e]0; $1\a"
  }
  ;;
esac

# Home/End keybinds
bindkey -M vicmd "^[[H" vi-beginning-of-line
bindkey          "^[[H" beginning-of-line
bindkey -M vicmd "^[[F" vi-end-of-line
bindkey          "^[[F" end-of-line

# Prompt!
PROMPT='[%m](%5~) ──── '
