#!/usr/bin/env bash
#
# Simple script for sending a dunst notification of package updates

updates_core_num="$(cat /tmp/updates_arch_core_repo_num)"
updates_user_num="$(cat /tmp/updates_arch_user_repo_num)"

# Notify
dunstify "Packages" "  │ CORE: $updates_core_num\n  │ AUR : $updates_user_num" -h string:x-dunst-stack-tag:updates -a "ARCH" -t 1500
