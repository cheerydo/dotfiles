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

# Some X stuff
xset b off &
xset s off &
xset -dpms &
xset m 5 7 &

xset +fp /usr/share/fonts/local &
xset +fp /usr/share/fonts/misc &
xset +fp /home/jared/.fonts &
xset fp rehash &

xrdb -load ~/.Xresources &
xbindkeys &
compton &
emacs --daemon &

setxkbmap -option shift:both_capslock -option ctrl:nocaps -option ctrl:lctrl_meta -option compose:ralt &

case "$2" in
        ob)
          xrandr --output HDMI-0 --right-of DVI-I-1 &
          xfsettingsd &
          volumeicon &
          exec openbox-session
          ;;
        pw)
          xrandr --output HDMI-0 --right-of DVI-I-1 &
          exec pekwm
          ;;
        cin)
          exec cinnamon-session
          ;;
        sp)
          nitrogen --restore &
          volumeicon &
          xrandr --output HDMI-0 --right-of DVI-I-1
          exec spectrwm
          ;;
        xf)
          exec startxfce4
          ;;
        i3|*)
          xfsettingsd &
          nitrogen --restore &
          exec i3
          ;;
esac
