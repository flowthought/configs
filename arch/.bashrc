#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default prompt
# PS1='[\u@\h \W]\$ '

LIGHTRED="\[$(tput setaf 167)\]"
BLUE="\[$(tput setaf 25)\]"
RESET="\[$(tput sgr0)\]"

PS1="[${BLUE}\u@\h ${LIGHTRED}\w${RESET}]\n$ "

# Aliases
alias ls='ls --color=auto'

alias gs='git status'
alias gf='git fetch'
alias gm='git merge'
alias gr='git rebase'
alias gc='git commit'
alias gco='git checkout'
alias gst='git stash'
alias gl='git lg'
alias gp='git push'
alias gd='git diff'
alias gdt='git difftool'
