# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git extract)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# Vi mode engage!
bindkey -v

# Initialize vimode to insert mode
vimode=i

# Remove default delay and set to 0.1s
export KEYTIMEOUT=1

# Handy extract function
extract () {
  if [ -f $1 ] ; then
      case $1 in
            *.tar.bz2)      tar xvjf $1   ;;
            *.tar.gz)       tar xvzf $1   ;;
		    *.tar.xz)       tar xvJf $1   ;;
            *.bz2)          bunzip2 $1    ;;
            *.rar)          unrar x $1    ;;
            *.gz)           gunzip $1     ;;
            *.tar)          tar xvf $1    ;;
            *.tbz2)         tar xvjf $1   ;;
            *.tgz)          tar xvzf $1   ;;
		    *.txz)          tar xvJf $1   ;;
            *.rar)          unrar $1      ;;
            *.zip)          unzip $1      ;;
            *.Z)            uncompress $1 ;;
            *.7z)           7z e $1       ;;
   	       *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}
