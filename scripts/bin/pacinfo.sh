#!/bin/bash

SLEEP=30

# Font
FONT="-*-terminus-medium-*-*-*-12-*-*-*-*-*-*-*"

# Colors
BG="#151515"
FG="#303030"
RED="#E84F4F"
GREEN="#B8D68C"
YELLOW="#E1AA5D"
BLUE="#7DC1CF"
MAGENTA="#9B64FB"
CYAN="#0088CC"

# Geometry
HEIGHT=20
WIDTH=20
X=3
Y=48

# Variables
# Where your updates file is
dir=test
# Where the rest of your scripts are
scriptdir=test
# Counts each repo
core=$(grep core ~/$dir/updates | wc -l)
community=$(grep community ~/$dir/updates | wc -l)
extra=$(grep extra ~/$dir/updates | wc -l)
testing=$(grep testing ~/$dir/updates | wc -l)
multilib=$(grep multilib ~/$dir/updates | wc -l)

echo "^fg($RED) CORE ^fg($CYAN)^pa(100)$core
^fg($RED) COMMUNITY ^fg($CYAN)^pa(100)$community
^fg($RED) EXTRA ^fg($CYAN)^pa(100)$extra ^pa(117)
^fg($RED) TESTING ^fg($CYAN)^pa(100)$testing ^pa(117)
^fg($RED) MULTILIB ^fg($CYAN)^pa(100)$multilib ^pa(117)
^ro(119x20)^ib(2)^fg($BLUE)^pa(2)Onetwo!" > ~/$dir/outputclick.txt

cat ~/$dir/outputclick.txt | dzen2 -p -bg $BG -fg $YELLOW -y $Y -x $X -fn $FONT -l 5 -w 119 -ta l -e "onstart=uncollapse;button3=exit"

exit 0
