#!/bin/sh
foot -a pkgupdate \
     -e sudo pacman -Syu --noconfirm \
    && waybar-pacman.sh \
    && swaymsg reload \
    && sleep 1 \
    && pkill -SIGRTMIN+8 waybar
