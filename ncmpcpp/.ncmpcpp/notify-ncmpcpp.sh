#!//usr/bin/env bash

icon='/usr/share/icons/gnome/scalable/actions/media-playback-start-symbolic.svg'

line="$(ncmpcpp --current-song='{%a - %t}|{%f}')"

notify-send -a ncmpcpp -t 3000 -i "${icon}" 'Now playing' "${line}"
