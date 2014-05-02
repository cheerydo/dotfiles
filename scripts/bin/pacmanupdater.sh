#! /bin/bash

# Where your output file is
user=jared
dir=test

sudo pacman -Sy && pacman -Qu > /home/$user/$dir/updates
