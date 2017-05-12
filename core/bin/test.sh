#!/bin/sh

sudo openvpn /etc/openvpn/client.conf && notify-send "OpenVPN connected"

exit 0
