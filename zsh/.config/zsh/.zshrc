# add shell completions dir to fpath
fpath=($ZDOTDIR/.completion $fpath)
autoload -U compinit
autoload -Uz vcs_info
compinit

setopt histappend \
    histexpiredupsfirst \
    histverify \
    nohup \
    completeinword \
    interactivecomments \
    autocd \
    automenu \
    completealiases \
    nobgnice \
    PROMPT_SUBST

# Some history params
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$ZDOTDIR/.zsh_history

# Add other paths
typeset -U path
path=(~/bin /sbin /usr/sbin $path)

# Keybindings
bindkey -v
vimode=i
bindkey '^R' history-incremental-search-backward
bindkey ' ' magic-space

# Prevent key race
export KEYTIMEOUT=1

# Cases are sooo insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
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

# Prompt!
PROMPT='[%m](%5~) ──── '
