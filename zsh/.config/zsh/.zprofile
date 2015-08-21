#
# ~/.zprofile
#
setterm -blength 0

eval $(keychain --agents gpg,ssh --eval FBB0702A)
ssh-add ~/.ssh/{git,fbox,gbox,jserv,hserv}.id_rsa

export GPG_AGENT_INFO=$HOME/.gnupg/S.gpg-agent

. /etc/profile
