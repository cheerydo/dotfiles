#
# ~/.zprofile

case $HOST in
  beans|rice|chili)
    if [[ $TMUX == "" ]]; then
      setterm -blength 0
      eval $(keychain --agents ssh,gpg --eval FBB0702A)
      ssh-add ~/.ssh/{gitrepo,privgit,salt,beer,jserv,hserv,pbox}
      export GPG_TTY=$(tty)
      export GPG_AGENT_INFO="" 
    fi
    ;;
  #potatoes)
  #  envfile="$HOME/.gnupg/gpg-agent.env"
  #  if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
  #      eval "$(cat "$envfile")"
  #  else
  #      eval "$(gpg-agent --daemon --write-env-file "$envfile")"
  #  fi
  #  export GPG_AGENT_INFO  # the env file does not contain the export statement
  #  ;;
  chicken|*)
    ;;
esac

if [[ $HOST == "rice" ]]; then
  source $ZDOTDIR/.zshrc
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi
