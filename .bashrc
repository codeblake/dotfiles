# -*- mode: shell-script; -*-
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable ctrl-s, ctrl-q
stty -ixon

# History
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups
HISTSIZE=1000
HISTFILESIZE=1000
shopt -s histappend

# Escape Sequences
reset='\[\e[01;00m\]'
blue='\[\e[01;34m\]'
yellow='\[\e[01;33m\]'
green='\[\e[01;32m\]'
red='\[\e[01;31m\]'

# Prompt
host="${red}\h${reset}"
user="${blue}\u${reset}"
dir="${yellow}\W${reset}"
branch() {
    branch="$(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p')"
    [ ! -z "${branch}" ] && printf " on ${branch}"
}
export PS1="[${user}@${host} in ${dir}\$(branch)] "

# Aliases
[ command -v exa &> /dev/null ] && alias ls="exa --group-directories-first"
[ command -v figlet &> /dev/null ] && alias ascii="figlet -f standard"
[ command -v batman &> /dev/null ] && alias man="batman"
[ command -v zathura &> /dev/null ] && alias pdf="zathura"
[ command -v swayimg &> /dev/null ] && alias img="swayimg"
[ command -v sdcv &> /dev/null ] && alias dict="sdcv"

alias gs="git status"
alias gl="git log --oneline --graph"
alias gd="git diff"

# Browser
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
  export MOZ_DBUS_REMOTE=1
  export MOZ_ENABLE_WAYLAND=1
fi
