# -*- mode: shell-script; -*-

# Source .bashrc
[[ -f ~/.bashrc ]] && source ~/.bashrc

# Set environment variables
scripts="${HOME}/repositories/dotfiles/scripts/"
export PATH="${scripts}:${PATH}"
export EDITOR=nano
export VISUAL=nano

if [[ -f /tmp/wallpaper ]]; then
	export WALLPAPER=/tmp/wallpaper
else
	export WALLPAPER=/usr/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png
fi

# Run window manager on login
if [ "$(tty)" = "/dev/tty1" ]; then
    dbus-run-session sway
fi

