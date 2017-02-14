#
# ~/.zprofile

<<<<<<< HEAD
#if [[ ! -n $TMUX && "$HOST" != chicken && "$HOST" != potatoes ]]; then
#    setterm -blength 0
#    eval $(keychain --agents gpg,ssh --eval FBB0702A)
#    ssh-add ~/.ssh/{gitrepo,jserv,gbox,hserv}.id_rsa
#    export GPG_TTY=$(tty)
#    export GPG_AGENT_INFO="$HOME/.gnupg/S.gpg-agent"
#fi
#
#if [[ "$HOST" == potatoes ]]; then
#  envfile="$HOME/.gnupg/gpg-agent.env"
#  if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
#      eval "$(cat "$envfile")"
#  else
#      eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
#  fi
#  export GPG_AGENT_INFO  # the env file does not contain the export statement
#fi
=======
case $HOST in
  beans|rice|chili)
    if [[ $TMUX == "" ]]; then
      setterm -blength 0
      if [[ $HOST == "beans" ]]; then
        eval $(keychain --agents ssh,gpg --eval FBB0702A)
      else
        eval $(keychain --agents ssh --eval)
      fi
      ssh-add ~/.ssh/{gitrepo,jserv,pbox,hserv}.id_rsa
      export GPG_TTY=$(tty)
      export GPG_AGENT_INFO="" 
    fi
    ;;
  potatoes)
    envfile="$HOME/.gnupg/gpg-agent.env"
    if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
        eval "$(cat "$envfile")"
    else
        eval "$(gpg-agent --daemon --write-env-file "$envfile")"
    fi
    export GPG_AGENT_INFO  # the env file does not contain the export statement
    ;;
  chicken|*)
    ;;
esac

if [[ $HOST == "rice" ]]; then
  source $ZDOTDIR/.zshrc
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi
>>>>>>> 01cb600b8ee4c32be38b60b60826656e98b28490
