#!/usr/bin/env bash

# BACKENDS BASED ON EXPERIENCE:
# Haishoku - most vibrant and largest color range, but acts wierd with dark backgrounds
# Colorthief - dark, lowest range
# colorz - decent color range
# wal - 2nd darkest
# schemer2 - NOTE: don't have it

PYWAL_BACKEND=colorz # values: colorthief, colorz, haishoku, schemer2, wal

# Set wallpaper in shell/.env
wal --backend "$PYWAL_BACKEND" -i "$WALLPAPER" --saturate 0.7 --vte

# Kitty
# . "$HOME/bin/wal/generate-pywal-theme-kitty.sh"

# Rofi
. "$HOME/bin/wal/generate-pywal-theme-rofi.sh"

# Brave/Chromium
# . "$HOME/bin/theme/generate-pywal-theme-chromium.sh"

# Brave/Polybar
# . "$HOME/bin/theme/generate-pywal-theme-polybar.sh"

# Zathura
# . "$HOME/bin/theme/generate-pywal-theme-zathura.sh"

xrdb "$HOME/.Xresources"
