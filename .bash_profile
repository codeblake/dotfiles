# -*- mode: shell-script; -*-

# Source .bashrc
[[ -f ~/.bashrc ]] && source ~/.bashrc

# Set environment variables
scripts="${HOME}/repositories/dotfiles/scripts/"
export PATH="${scripts}:${PATH}"
export EDITOR=nano
export VISUAL=nano

# Run window manager on login
if [ "$(tty)" = "/dev/tty1" ]; then
    dbus-run-session sway
fi
