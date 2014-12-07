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
xset b off
xset s off
setxkbmap -option caps:super
xrdb -load ~/.Xresources

# For that good looking-ness
compton -b
xrandr --output VGA1 --left-of HDMI1

# Dose daemons dough
thunar --daemon &
urxvtd -q -f -o &

# Gots to have my bindkeys
xbindkeys
numlockx & 

case "$2" in
	openbox)
		xfsettingsd &
		tint2 -c ~/tint2/tint2rc.crux &
		xfce4-clipman &
		volumeicon &
		conky -c ~/.conky.conf
		exec openbox-session ;;
	spectrwm)
		stalonetray -c /home/jared/.config/.stalonetrayrc &
		xfce4-clipman &
		volumeicon &
		nitrogen --restore &
		exec spectrwm ;;
	2bwm) 
		tint2 -c ~/tint2/tint2rc.crux &
		xfce4-clipman &
		volumeicon &
		/home/jared/bin/baraction.sh &
		xsetroot -cursor_name top_left_arrow
		nitrogen --restore &
		exec 2bwm 
		exec termite ;;
	dwm) 
		exec dwm ;;
	xfce)
		exec startxfce4 ;;
	i3) 
		exec i3 ;;
esac
