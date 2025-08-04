#!/bin/bash
script_name=$(basename "$0")
instance_count=$(ps aux | grep -F "$script_name" | grep -v grep | grep -v $$ | wc -l)

if [ $instance_count -gt 1 ]; then
    sleep $instance_count
fi

check_lock_files() {
    local pacman_lock="/var/lib/pacman/db.lck"
    local checkup_lock="${TMPDIR:-/tmp}/checkup-db-${UID}/db.lck"

    while [ -f "$pacman_lock" ] || [ -f "$checkup_lock" ]; do
        sleep 1
    done
}

check_lock_files

updates=$(checkupdates-with-aur | wc -l)

if [ "$updates" -gt 0 ]; then
    printf '{"text": "%s", "alt": "%s", "tooltip": "Update available"}' "󰚰 $updates" "$updates"
else
    printf '{}'
fi