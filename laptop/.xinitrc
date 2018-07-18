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

xset b off &
xset s off &
xset -dpms &
#setxkbmap -option shift:both_capslock -option ctrl:swapcaps -option altwin:swap_lalt_lwin &
setxkbmap -option shift:both_capslock -option ctrl:swapcaps &

if [[ -f ~/.Xresources ]]; then
  xrdb -load ~/.Xresources &
fi

#if [[ -f ~/.Xmodmap ]]; then
#  xmodmap ~/.Xmodmap
#fi

emacs --daemon &

compton -b &
feh --randomize --bg-fill img/

exec i3
