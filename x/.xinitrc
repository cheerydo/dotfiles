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
#compton -b
#xrandr --output VGA1 --left-of HDMI1 &

# Dose daemons dough
#thunar --daemon &
#urxvtd -q -f -o &

# Gots to have my bindkeys
#xbindkeys
#numlockx & 

case "$2" in
	openbox)
		compton -b &
		xfsettingsd &
		tint2 -c ~/.config/tint2/cool &
		xfce4-clipman &
		volumeicon &
		thunar --daemon &
		conky -c ~/.conky.conf
		exec openbox-session ;;
	spectrwm)
		xrandr --output VGA1 --left-of HDMI1
		compton -b &
		stalonetray -c /home/jared/.config/.stalonetrayrc &
		xfce4-clipman &
		volumeicon &
		nitrogen --restore &
		thunar --daemon &
		exec spectrwm ;;
	2bwm) 
		xrandr --output VGA1 --left-of HDMI1
		compton -b &
		tint2 -c ~/.config/tint2/tint2rc.crux &
		xfce4-clipman &
		volumeicon &
		/home/jared/bin/baraction.sh &
		xsetroot -cursor_name top_left_arrow
		nitrogen --restore &
		thunar --daemon &
		exec 2bwm 
		exec termite ;;
	dwm) 
		exec dwm ;;
	xfce)
		volumeicon &
		exec startxfce4 ;;
	i3) 
		compton -b &
		xrandr --output VGA1 --left-of HDMI1
		xfce4-clipman &
		volumeicon &
		caffeine &
		nitrogen --restore &
		thunar --daemon &
		exec i3 ;;
	cinn)
		exec cinnamon-session ;;
	*)
		volumeicon &
		exec startxfce4 ;;
esac
