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
xset b off
xset s off
xset -dpms
xset m 5 7

xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset +fp /home/jared/.fonts
xset fp rehash

xrdb -load ~/.Xresources
xbindkeys
compton &
emacs --daemon &

#setxkbmap -option shift:both_capslock -option ctrl:nocaps -option ctrl:lctrl_meta -option compose:ralt
setxkbmap -option shift:both_capslock -option ctrl:nocaps -option ctrl:swap_lwin_lctl

case "$2" in
  xf)
    exec startxfce4
    ;;
  i3|*)
#    xfsettingsd &
    #xrandr --output DVI-I-1 --right-of HDMI-0
    nitrogen --restore &
    xrandr --output HDMI-0 --off
    exec i3
    ;;
esac
