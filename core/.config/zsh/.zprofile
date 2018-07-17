#
# ~/.zprofile

case $HOST in
  beans|chili|*)
    if [[ $TMUX == "" ]]; then
      setterm -blength 0
      eval $(keychain --agents ssh,gpg --eval FBB0702A beans gitrepo hrepo)
      #export GPG_TTY=$(tty)
      #export GPG_AGENT_INFO="" 
    fi
    ;;
  rice)
    if [[ $TMUX == "" ]]; then
      setterm -blength 0
      eval $(keychain --agents ssh,gpg --eval FBB0702A rice)
      source $ZDOTDIR/.zshrc
      [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
    fi
    ;;
  beer|potatoes|peas)
    [[ -e /var/run/reboot-required ]] && echo -e "\n\t ***System Reboot Required***\t\n"
    ;;
esac
