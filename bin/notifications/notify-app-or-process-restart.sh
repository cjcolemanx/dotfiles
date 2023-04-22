#!/usr/bin/env bash
app_name="$1"
msg="$2"

dunstify "$msg" -h string:x-dunst-stack-tag:restarted -a "$app_name" -t 1500
