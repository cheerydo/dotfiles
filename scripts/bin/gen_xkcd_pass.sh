#!/usr/bin/env sh

I=0
[ $(printf "$1" | grep -E '[0-9]+') ] && NUM="$1" || NUM="1"
[ $(uname) = "SunOS" ] && FILE="/usr/dict/words" || FILE="/usr/share/dict/words"
DICT=$(LC_CTYPE=C grep -E '^[a-zA-Z]{3,6}$' "$FILE")
until [ "$I" -eq "$NUM" ]; do
    I=$((I+1))
    WORDS=$(printf "$DICT" | /home/jared/bin/shuff 6 | paste -s -d ' ' /dev/stdin)
    XKCD=$(printf "$WORDS" | sed 's/ //g')
    printf "$XKCD ($WORDS)" | awk '{x=$1;$1="";printf "%-36s %s\n", x, $0}'
done | column
