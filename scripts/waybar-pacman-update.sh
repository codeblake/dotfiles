#!/bin/sh
foot -a pkgupdate -e sudo pacman -Syu --noconfirm \
&& ~/.config/scripts/wofi-pacman.sh \
&& pkill -SIGRTMIN+8 waybar
