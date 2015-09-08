#
# ~/.zprofile
#

if [[ ! -n $TMUX ]]; then
    setterm -blength 0
    eval $(keychain --agents gpg,ssh --eval FBB0702A)
    ssh-add ~/.ssh/{gitrepo,jserv,fbox,gbox,hserv}.id_rsa
    export GPG_TTY=$(tty)
    export GPG_AGENT_INFO="$HOME/.gnupg/S.gpg-agent"
fi

. /etc/profile
