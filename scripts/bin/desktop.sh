#!/bin/sh

x=$(xprop -root _NET_CURRENT_DESKTOP | sed -e 's/_NET_CURRENT_DESKTOP(CARDINAL) = //') 

echo "Workspace: $(($x+1))"

exit 0
