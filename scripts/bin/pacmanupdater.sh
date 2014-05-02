#! /bin/bash

# Where your output file is
user=jared
dir=test

pacman -Sy && pacman -Qu > /home/$user/$dir/updates
