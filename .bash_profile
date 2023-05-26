# -*- mode: shell-script; -*-

# Source .bashrc
[[ -f ~/.bashrc ]] && source ~/.bashrc

# Set environment variables
scripts="${HOME}/repositories/dotfiles/scripts/"
export PATH="${scripts}:${PATH}"
export EDITOR=vim
export VISUAL=$EDITOR

# Set random wallpaper
ln -sf $(find ~/images/wallpaper -type f | shuf -n 1) /tmp/wallpaper

# Run sway on login
if [ "$(tty)" = "/dev/tty1" ]; then
    dbus-run-session sway
fi

