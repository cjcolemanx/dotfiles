#!/usr/bin/env bash
YES_RES="${1:-Yes}"
NO_RES="${2:-No}"
TITLE="$3"
#

answer=$(echo "Yes,No" | rofi -sep "," -dmenu -p "$TITLE")

case $answer in
Yes) echo "$YES_RES" ;;
No) echo "$NO_RES" ;;
esac
