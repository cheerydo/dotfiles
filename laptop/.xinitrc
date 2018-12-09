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

# sets beep off and mouse accel to 30/10 with a threshold of 0
xset b off m 30/10 0

#setxkbmap -option shift:both_capslock -option ctrl:swapcaps -option altwin:swap_lalt_lwin &
setxkbmap -option shift:both_capslock -option ctrl:swapcaps &

if [[ -f ~/.Xresources ]]; then
  xrdb -load ~/.Xresources &
fi

#if [[ -f ~/.Xmodmap ]]; then
#  xmodmap ~/.Xmodmap
#fi

emacs --daemon &

#compton -b &
feh --randomize --bg-fill img/

exec i3
