#!/usr/bin/env bash

if [[ "$1" == "-w" ]]; then
  WINEARCH=win32 WINEPREFIX=/home/jared/win32 /home/jared/games/Planescape\ Torment/start.sh -w
else
  WINEARCH=win32 WINEPREFIX=/home/jared/win32 /home/jared/games/Planescape\ Torment/start.sh
fi
