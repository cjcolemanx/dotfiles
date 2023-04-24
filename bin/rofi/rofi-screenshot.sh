#!/usr/bin/env bash
#
# Screenshots

MAP="screenshot-commands.csv"

. "$HOME/bin/rofi/rofi-dmenu-from-file.sh" $MAP "Select Screenshot Type" "" "" "" --no-exit

rename=$("$HOME/bin/rofi/rofi-simple-yes-no.sh" 1 0 "Name screenshot?")

case $rename in
0) exit 0 ;;
1)
	new_name=$("$HOME/bin/rofi/rofi-simple-text-pipe.sh" "Name")
	. "$HOME/bin/utility/get-most-recent-screenshot.sh" "$new_name" && exit 0
	;;
esac
