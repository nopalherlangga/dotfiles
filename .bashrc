#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias shutdown='systemctl poweroff'
alias hyprpaper-restart='pkill hyprpaper && sleep 1 && hyprpaper &'

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

cdls() {
    local dir="$1"
    local dir="${dir:=$HOME}"
    if [[ -d "$dir" ]]; then
        cd "$dir" >/dev/null; ls
    else
        echo "bash: cdls: $dir: Directory not found"
    fi
}