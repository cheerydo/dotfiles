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
xset +fp /home/jared/.fonts
xset fp rehash

setxkbmap -option caps:super -option shift:both_capslock
xrdb -load ~/.Xresources
xbindkeys
compton -b

case "$2" in
	spectrwm)
          nitrogen --restore
          exec spectrwm ;;
        ob)
          tint2 &
          volumeicon &
          exec openbox-session ;;
        i3) 
          nitrogen --restore
          exec i3 ;;
        2b)
          nitrogen --restore
          exec 2bwm &
          termite ;;
        kde)
          exec startkde ;;  
        xf|*)
          volumeicon &
          exec startxfce4 ;;
esac
