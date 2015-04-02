#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Some X stuff I really need
xset b off
xset s off

xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset fp rehash
setxkbmap -option caps:super -option shift:both_capslock
xrdb -load ~/.Xresources
#
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)
#
#case "$2" in
#	cinn)
#		exec cinnamon-session ;;
#	spectrwm)
#		nitrogen --restore &
#		compton -b
#		synclient VertScrollDelta=-108
#		synclient HorizScrollDelta=-10
#		synclient HorizTwoFingerScroll=1
#		xbindkeys
#		exec spectrwm ;;
#	i3) 
#		nitrogen --restore &
#		compton -b
#		xbindkeys
#		synclient VertScrollDelta=-108
#		synclient HorizScrollDelta=-10
#		synclient HorizTwoFingerScroll=1
#		exec i3 ;;
#	rat)
#		compton -b
#		xbindkeys
#		synclient VertScrollDelta=-108
#		synclient HorizScrollDelta=-10
#		synclient HorizTwoFingerScroll=1
#		exec ratpoison ;;
#	2bwm)
#		compton -b
#		xbindkeys
#		synclient VertScrollDelta=-108
#		synclient HorizScrollDelta=-10
#		synclient HorizTwoFingerScroll=1
#		2bwm &
#		exec urxvt ;;
#	*) 
#		exec cinnamon-session ;;
#esac
compton -b
nitrogen --restore &
#exec startxfce4
exec i3
