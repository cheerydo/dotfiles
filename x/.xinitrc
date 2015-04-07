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

case "$2" in
	spectrwm)
		nitrogen --restore &
		compton -b
		exec spectrwm ;;
	xfce) 
		compton -b
		exec startxfce4 ;;
	i3|*) 
		nitrogen --restore &
		compton -b
		exec i3 ;;
esac
