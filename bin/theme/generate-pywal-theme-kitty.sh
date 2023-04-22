#!/usr/bin/env bash
CONFIG="$HOME/.config/kitty/colors-kitty.conf"
GENERATED_THEME="$HOME/.cache/wal/colors-kitty.conf"

# Backup
cp -f "$CONFIG" "$CONFIG~"

# Write new
cp -f "$GENERATED_THEME" "$CONFIG"

# Get tabs configuration
active_tab_fg=$(echo "$(cat $GENERATED_THEME)" | grep -m 1 -i foreground | sed 's/\s/;/' | sed 's/\s//g' | cut -f2 -d ";")
active_tab_bg=$(echo "$(cat $GENERATED_THEME)" | grep -m 1 -i color1 | sed 's/\s/;/' | sed 's/\s//g' | cut -f2 -d ";")
inactive_tab_fg=$(echo "$(cat $GENERATED_THEME)" | grep -m 1 -i cursor | sed 's/\s/;/' | sed 's/\s//g' | cut -f2 -d ";")
inactive_tab_bg=$(echo "$(cat $GENERATED_THEME)" | grep -m 1 -i color2 | sed 's/\s/;/' | sed 's/\s//g' | cut -f2 -d ";")
tab_bg=$(echo "$(cat $GENERATED_THEME)" | grep -m 1 -i background | sed 's/\s/;/' | sed 's/\s//g' | cut -f2 -d ";")
tab_margin_color=$(echo "$(cat $GENERATED_THEME)" | grep -m 1 -i color3 | sed 's/\s/;/' | sed 's/\s//g' | cut -f2 -d ";")

echo "active_tab_foreground $active_tab_fg" >>"$CONFIG"
echo "active_tab_background $active_tab_bg" >>"$CONFIG"
echo "inactive_tab_foreground $inactive_tab_fg" >>"$CONFIG"
echo "inactive_tab_background $inactive_tab_bg" >>"$CONFIG"
echo "tab_bar_background $tab_bg" >>"$CONFIG"
echo "tab_bar_margin_color $tab_margin_color" >>"$CONFIG"
