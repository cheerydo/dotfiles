#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [[ -x "$f" ]] && . "$f"
  done
  unset f
fi

xset b off
xset s off
xset -dpms
setxkbmap -option shift:both_capslock -option ctrl:nocaps -option ctrl:swap_lwin_lctl

if [[ -f ~/.Xresources ]]; then
  xrdb -load ~/.Xresources
fi

emacs --daemon &
#mpd &

compton -b
nitrogen --restore
xsetroot -mod 16 16 -fg '#343d46' -bg '#2b303b'

exec i3
