#!/bin/sh
foot -a pkgupdate \
     -e sudo pacman -Syu --noconfirm \
    && waybar-pacman.sh \
    && pkill -SIGRTMIN+8 waybar
