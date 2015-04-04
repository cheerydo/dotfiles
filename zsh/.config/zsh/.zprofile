#
# ~/.zprofile
#
setterm -blength 0

eval $(keychain --eval FBB0702A)
ssh-add ~/.ssh/{gitrepo,hserv}.id_rsa

. /etc/profile
