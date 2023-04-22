#!/usr/bin/env bash
notify-send "Regenerating Colorscheme"
echo "" >/tmp/wm_start_log

wal --preview >"$HOME/colorscheme"

# Kitty
cp "$HOME/.cache/wal/colors-kitty.conf" "$HOME/.config/kitty/colors-kitty.conf"
echo "Copied kitty colors to config dir" >>/tmp/wm_start_log

# Chromium
[ -f "$HOME/bin/generate-pywal-theme-chromium.sh" ] && . "$HOME/bin/generate-pywal-theme-chromium.sh"
echo "Generated Chromium theme" >>/tmp/wm_start_log

# Show scheme
# urxvt -e "bat ~/colorscheme"
