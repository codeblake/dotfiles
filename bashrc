#!/bin/bash
# ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
# ██████╔╝███████║███████╗███████║██████╔╝██║
# ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║
# ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable ctrl-s, ctrl-q
stty -ixon

# Change to dir without typing cd
shopt -s autocd

# Command history size
HISTSIZE="INFINITE"

# Colours
col_reset="\033[00m"
col_blue="\033[34m"
col_yellow="\033[33m"
col_green="\033[32m"
col_red="\033[31m"

# Prompt
git_branch() {
	branch_name="$(git branch 2> /dev/null | sed -e 's/* \(.*\)/\1/')"
	[ ! "$branch_name" == "" ] && echo -e " on ${col_green}${branch_name}${col_reset}"
}

host="${col_red}\h${col_reset}"
dir="${col_yellow}\W${col_reset}"
user="${col_blue}\u${col_reset}"

export PS1="[${user}@${host} in ${dir}\$(git_branch)] "

# Aliases
alias build="make clean install"
alias mkd="mkdir -pv"
alias exa="exa --group-directories-first"
alias links='ls -al | grep "\->"'

# Replacement aliases
command -v exa &> /dev/null || alias ls="exa --group-directories-first"

