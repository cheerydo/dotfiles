#!/bin/sh
#
# ~/.xinitrc

# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Some X stuff
xset b off &
xset s off &

xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset +fp /home/jared/.fonts
xset fp rehash

xrdb -load ~/.Xresources
emacs --daemon &
mpd &

setxkbmap -option shift:both_capslock -option ctrl:nocaps

case "$2" in
  xf)
    #compton -b &
    xset -dpms &
    exec startxfce4
    ;;
  i3|*)
    #compton &
    nitrogen --restore &
    exec i3
    ;;
esac
