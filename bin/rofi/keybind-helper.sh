#!/usr/bin/env bash
#
# Access rofi menus with their associated keybinds

MAP="rofi-mappings.csv"

. "$HOME/bin/rofi/rofi-dmenu-from-file.sh" \
	$MAP \
	"Rofi Bindings (select to launch)" \
	'-mesg "Hello There" -format i' \
	""
# --debug
