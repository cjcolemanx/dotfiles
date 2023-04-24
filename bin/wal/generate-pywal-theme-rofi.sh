#!/usr/bin/env bash
cp -f ~/.cache/wal/colors-rofi-dark.rasi ~/.cache/wal/colors-rofi-light.rasi ~/.config/rofi
# #
# # Built to be compatible with my current config
# #
# # ... which is a cloned repo : )
# #
# # FIXME: not done
#
# # Defaults
# BACKGROUND=""
# BACKGROUND_ALT=""
# FOREGROUND=""
# SELECTED=""
# ACTIVE=""
# URGENT=""
#
# # Read theme colors - use kitty as a base
# THEME=$(cat $HOME/.cache/wal/colors-kitty.conf)
#
# extract_color_only() {
# 	# replace first space with delimiter, then trim remaining and cut on delimiter
# 	echo "$1" | sed 's/\s/;/' | sed 's/\s//g' | cut -f2 -d ";"
# }
#
# fg=$(echo "$THEME" | grep -m 1 -i foreground | sed 's/\s/;/' | sed 's/\s//g' | cut -f2 -d ";")
# bg=$(echo "$THEME" | grep -m 1 -i background | sed 's/\s/;/' | sed 's/\s//g' | cut -f2 -d ";")
# active=$(echo "$THEME" | grep -m 1 -i cursor | sed 's/\s/;/' | sed 's/\s//g' | cut -f2 -d ";")
#
# color_fg=$(echo "$THEME" | grep -i "$fg" | grep -m 1 -i color | sed 's/\s/;/' | sed 's/\s//g' | cut -f1 -d ";")
# color_bg=$(echo "$THEME" | grep -i "$bg" | grep -m 1 -i color | sed 's/\s/;/' | sed 's/\s//g' | cut -f1 -d ";")
#
# # debug
# dunstify "COLORS SCRIPT" "$fg\n$bg\n$active\n\nparsed:\n$color_fg\n$color_bg" -h string:x-dunst-stack-tag:debug-color-script
