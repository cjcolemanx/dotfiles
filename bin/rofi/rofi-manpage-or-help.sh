#!/usr/bin/env bash
#
# Open a manpage or help file in an existing Kitty terminal.
#
# Opens a new tab (--location=neighbor)

man_list() {
	apropos --long . | awk '{print $1}' | tr -d '()'
}

man_cmd() {
	man "${1}"
}

help_cmd() {
	"${1}" --help || "${1}" -h
}

man_or_help=$("$HOME/bin/rofi/rofi-choice-from-opts.sh" "Manual Page" "Help")

case $man_or_help in
"Manual Page")
	man_selection=$(man_list | rofi -dmenu)
	kitty @ launch --location=neighbor man "$man_selection"
	;;
Help)
	help_selection=$("$HOME/bin/rofi/rofi-simple-text-pipe.sh" "Help for what?")
	kitty @ launch --location=neighbor --hold "$help_selection" --help || "$help_selection" -h
	;;
*) echo ;;
esac
