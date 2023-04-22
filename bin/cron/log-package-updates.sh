#!/usr/bin/env bash
#
# Simple script for getting the number of CORE and USER packages that are
# out of date.
#
# Used in notifications and similar User-alert type stuff.

# PACMAN (core)
if ! updates_core=$(checkupdates 2>/dev/null | wc -l); then
	updates_core=0
fi

# YAY (user)
if ! updates_user=$(yay -Qum 2>/dev/null | wc -l); then
	updates_user=0
fi

# Strip and count
updates_core_num=$(echo "$updates_core" | awk "{print}")
updates_user_num=$(echo "$updates_user" | awk "{print}")

# Add to tmpfile
echo "$updates_core_num" >>/tmp/updates_arch_core_repo_num
echo "$updates_user_num" >>/tmp/updates_arch_user_repo_num
