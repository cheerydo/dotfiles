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
xset b off &
xset s off &
xset -dpms &
xset +fp /usr/share/fonts/local &
xset +fp /home/jared/.fonts &
xset fp rehash &
setxkbmap -option shift:both_capslock -option ctrl:nocaps -option compose:ralt &

if [[ -f ~/.Xresources ]]; then
  xrdb -load ~/.Xresources &
fi

emacs --daemon &
mpd &

case "$2" in
    rat)
        compton -b &
        xbindkeys &
        synclient VertScrollDelta=-108 &
        synclient HorizScrollDelta=-10 &
        synclient HorizTwoFingerScroll=1 &
        exec ratpoison ;;
    pekwm)
        compton -b &
        xbindkeys &
        synclient VertScrollDelta=-108 &
        synclient HorizScrollDelta=-10 &
        synclient HorizTwoFingerScroll=1 &
        exec pekwm ;;
    cinn)
        exec cinnamon-session ;;
    i3|*) 
        nitrogen --restore &
        compton -b &
        xbindkeys &
        synclient VertScrollDelta=-108 &
        synclient HorizScrollDelta=-10 &
        synclient HorizTwoFingerScroll=1 &
        exec i3 ;;
esac
