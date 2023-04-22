#!/bin/usr/env bash
PYWAL_BACKEND=haishoku # values: colorthief, colorz, schemer2, wal

# Set wallpaper in shell/.env
wal --backend "$PYWAL_BACKEND" -i "$WALLPAPER" --preview

# Kitty
. "$HOME/bin/theme/generate-pywal-theme-kitty.sh"

# Rofi
. "$HOME/bin/theme/generate-pywal-theme-rofi.sh"

# Brave/Chromium
. "$HOME/bin/theme/generate-pywal-theme-chromium.sh"

# Brave/Polybar
. "$HOME/bin/theme/generate-pywal-theme-polybar.sh"

# Zathura
. "$HOME/bin/theme/generate-pywal-theme-zathura.sh"
