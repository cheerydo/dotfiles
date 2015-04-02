#
# ~/.zprofile
#
setterm -blength 0

eval $(keychain --agents gpg,ssh --eval FBB0702A)
ssh-add ~/.ssh/{git,fbox,hserv}.id_rsa

. /etc/profile
