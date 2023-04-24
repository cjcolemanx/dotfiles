#!/usr/bin/env bash
#
# Pass an arbitrary # of strings as arguments, they'll get parsed and
# separated into the rofi menu.
choice=$(printf "%s|" "$@" | rofi -sep "|" -dmenu)

echo "$choice"
