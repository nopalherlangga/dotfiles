#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias shutdown='systemctl poweroff'

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"