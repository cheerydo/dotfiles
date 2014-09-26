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

xset b off
setxkbmap -option caps:super
xrdb -load ~/.Xresources
compton &

nitrogen --restore &
thunar --daemon &
#urxvtd -q -f -o &

#tint2 &

stalonetray &
xfce4-clipman &
volumeicon &

#/home/jared/bin/baraction.sh &
#/home/jared/bin/baraction2.sh &

xbindkeys
numlockx & 

#xsetroot -cursor_name top_left_arrow
xrandr --output VGA1 --left-of HDMI1
#exec 2bwm
#exec termite
#conky -c ~/.conky.conf

exec spectrwm
#exec dwm
#exec startxfce4
