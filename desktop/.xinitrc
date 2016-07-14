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

case "$2" in
        ob)
          setxkbmap -option shift:both_capslock -option ctrl:nocaps -option ctrl:lctrl_meta -option compose:ralt &
          xrandr --output HDMI-0 --right-of DVI-I-1 &
          xfsettingsd &
          volumeicon &
          exec openbox-session ;;
        pw)
          xrandr --output HDMI-0 --right-of DVI-I-1 &
          exec pekwm ;;
        cin)
          exec cinnamon-session ;;
        sp)
          nitrogen --restore &
          volumeicon &
          xmodmap ~/.Xmodmap &
          xrandr --output HDMI-0 --right-of DVI-I-1
          exec spectrwm ;;
        i3)
          xfsettingsd &
          nitrogen --restore &
          setxkbmap -option shift:both_capslock -option ctrl:nocaps -option ctrl:lctrl_meta -option compose:ralt &
          exec i3 ;;
        xf|*)
          setxkbmap -option shift:both_capslock -option ctrl:nocaps -option ctrl:lctrl_meta -option compose:ralt &
          exec startxfce4 ;;
esac
