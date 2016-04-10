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

if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

xrdb -load ~/.Xresources &
xbindkeys &
(sleep 2 && compton) &
#emacs --daemon &

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)

case "$2" in
        ob)
          volumeicon &
          exec openbox-session ;;
        i3) 
          nitrogen --restore &
          exec i3 ;;
        pw)
          exec pekwm ;;
        cin)
          exec cinnamon-session ;;
        xf|*)
          volumeicon &
          nitrogen --restore &
          exec startxfce4 ;;
esac
