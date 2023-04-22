#!/usr/bin/env bash

while getopts "i" opt; do
	case $opt in
	i)
		feh "$HOME/bin/assets/keybinds/img/keybinds-1.png"
		break
		;;
	*)
		break
		;;
	esac
done

$PAGER "$HOME/bin/mybinds"
