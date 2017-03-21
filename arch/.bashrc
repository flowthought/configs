#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Default prompt
# PS1='[\u@\h \W]\$ '

LIGHTRED="\[$(tput setaf 167)\]"
BLUE="\[$(tput setaf 25)\]"
RESET="\[$(tput sgr0)\]"

PS1="[${BLUE}\u@\h ${LIGHTRED}\w${RESET}]\n$ "
