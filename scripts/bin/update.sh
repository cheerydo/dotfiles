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
X=0
Y=25

#Variables
#Where your updates file is in /home/onetwo
dir=test

#Where the rest of your scripts are
scriptdir=test

# Counts from each repo
core=$(grep core /home/onetwo/$dir/updates | wc -l)
community=$(grep community /home/onetwo/$dir/updates | wc -l)
extra=$(grep extra /home/onetwo/$dir/updates | wc -l)
testing=$(grep testing /home/onetwo/$dir/updates | wc -l)

#Gets total number of upgradeable packages
counts=$(pacman -Qu | wc -l)

#Clickable functions
pacmanupdate() {
  echo -n CORE: $core
  echo -n " - "
  echo -n COMMUNITY: $community
  echo -n " - "
  echo -n EXTRA: $extra
  echo -n " - "
  echo -n TESTING: $testing
}

count() {
  echo -n $counts
}

echo "^fg($RED)^ca(1,sh /home/onetwo/$scriptdir/pacmanupdater.sh)\
^ca(3,sh /home/onetwo/$scriptdir/pacinfo.sh) PACMAN \
^fg($FG) | \
^fg($GREEN)$(count)  ^ca()^ca()" > /home/onetwo/$dir/outputmain.txt

cat /home/onetwo/$dir/output.txt | dzen2 -p -ta r -bg $BG -x $X -y $Y -h $HEIGHT -expand r -fn $FONT -e 'onstart=uncollapse;key_Escape=ungrabkeys,exit'

exit 0
