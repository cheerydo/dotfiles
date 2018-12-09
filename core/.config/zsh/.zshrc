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

# Keybindings - vim for the win
bindkey -e
bindkey '^R' history-incremental-search-backward
bindkey ' ' magic-space

# Prevent key race with vim escape key
export KEYTIMEOUT=1

# Cases are sooo insensitive
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':vcs_info:*' enable git svn

# Erliarses
if [[ -f $ZDOTDIR/aliases.main ]]; then
  . $ZDOTDIR/aliases.main
fi

case "$HOST" in
  potatoes|beer|peas)
    source $ZDOTDIR/aliases.debian
    source $ZDOTDIR/aliases.systemd
    eval $(dircolors $ZDOTDIR/.dircolors)
    ;;
  beans|rice)
    source $ZDOTDIR/aliases.arch
    source $ZDOTDIR/aliases.systemd
    eval $(dircolors $ZDOTDIR/.dircolors)
    ;;
  chili)
    source $ZDOTDIR/aliases.crux
    eval $(dircolors $ZDOTDIR/.dircolors)
    ;;
esac

source $ZDOTDIR/functions.zsh

case $TERM in
  xterm-*)
    precmd () {
      print -Pn "\e]0;Termite [%~]\a"

      gitprompt=""

      if repo=$(git rev-parse --show-toplevel 2> /dev/null); then
        if [[ ! $repo ]]; then
          case $(git rev-parse --is-bare-repository) in
            'true') repo='bare'
          esac
        fi

        repo="${repo##*/}"
        branch="$(git symbolic-ref --short HEAD)"
        gitprompt=" %F{green}${repo}%f:%F{green}${branch}%f"
      fi
    }
  ;;
esac

# Home/End keybinds
bindkey -M vicmd "^[[H" vi-beginning-of-line
bindkey          "^[[H" beginning-of-line
bindkey -M vicmd "^[[F" vi-end-of-line
bindkey          "^[[F" end-of-line
bindkey -M vicmd "^[[3~" vi-delete-char 
bindkey          "^[[3~" delete-char 

# Prompt!
if [[ $HOST != "beans" ]] && [[ $HOST != "rice" ]]; then
  PROMPT='[%m](%5~)${gitprompt} ──── '
else
  PROMPT='(%5~)${gitprompt} ──── '
fi
