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
xrandr --output VGA1 --left-of HDMI1 
xrdb -load ~/.Xresources
compton &

nitrogen --restore &
thunar --daemon &
urxvtd -q -f -o &

stalonetray & 

sleep 2 && clipit &
volumeicon &

#/home/jared/bin/baraction.sh &
#/home/jared/bin/baraction2.sh &

xbindkeys

#exec 2bwm &
#exec termite

exec spectrwm
#exec startxfce4
