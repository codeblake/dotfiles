# -*- mode: shell-script; -*-

# Source .bashrc
[[ -f ~/.bashrc ]] && source ~/.bashrc

# Set environment variables
scripts="${HOME}/repositories/dotfiles/scripts/"
export PATH="${scripts}:${PATH}"
export EDITOR=nano
export VISUAL=nano

## A precaution to set the default wallpaper if non set yet
#[[ -f /tmp/wallpaper ]] \
#	|| cp "/usr/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png" \ 
#	      "/tmp/wallpaper"

# Run window manager on login
if [ "$(tty)" = "/dev/tty1" ]; then
    dbus-run-session sway
fi

