# Prompt!
PROMPT='[%m](%3~) ──── '

setopt histappend \
	histexpiredupsfirst \
	histverify \
	nohup \
	completeinword \
	interactivecomments \
	autocd \
	automenu \
	completealiases \
	nobgnice

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

# add shell completions dir to fpath
fpath=($ZDOTDIR/.completion $fpath)
autoload -U compinit
compinit

# Prevent key race
export KEYTIMEOUT=1

# Cases are sooo insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:kill:*' force-list always

# Erliarses
if [[ -f $ZDOTDIR/.aliases ]]; then
	. $ZDOTDIR/.aliases
fi

eval $(gdircolors $ZDOTDIR/.dircolors)
