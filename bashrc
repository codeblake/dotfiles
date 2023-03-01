#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable ctrl-s, ctrl-q
stty -ixon

# Command history
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups
HISTSIZE=1000
HISTFILESIZE=1000
shopt -s histappend

# PROMPT
col_reset="\033[00m"
col_blue="\033[34m"
col_yellow="\033[33m"
col_green="\033[32m"
col_red="\033[31m"

git_branch() {
	branch="$(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p')"
	[ ! "$branch" == "" ] && echo -e " on ${col_green}${branch}${col_reset}"
}

host="${col_red}\h${col_reset}"
dir="${col_yellow}\W${col_reset}"
user="${col_blue}\u${col_reset}"

export PS1="[${user}@${host} in ${dir}\$(git_branch)] "

# Aliases
[ command -v exa &> /dev/null ] || alias ls="exa"
alias gs="git status"
alias gl="git log --oneline"

# Firefox
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
	export MOZ_DBUS_REMOTE=1
	export MOZ_ENABLE_WAYLAND=1
fi
