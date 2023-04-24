#!/usr/bin/env bash

# source "$HOME"/.config/rofi/applets/shared/theme.bash
# theme="$ranger_type/$ranger_style"
# polybar_loc="$HOME/.config/polybar/grayblocks/config.ini"

# Theme Elements
prompt='Select Process'
mesg="Relaunch the selected process"

# if [[ ("$theme" == *'type-1'*) || ("$theme" == *'type-3'*) || ("$theme" == *'type-5'*) ]]; then
list_col='1'
list_row='6'
# elif [[ ("$theme" == *'type-2'*) || ("$theme" == *'type-4'*) ]]; then
# 	list_col='6'
# 	list_row='1'
# fi

if [[ ("$theme" == *'type-1'*) || ("$theme" == *'type-5'*) ]]; then
	efonts="JetBrains Mono Nerd Font 10"
else
	efonts="JetBrains Mono Nerd Font 28"
fi

# Options
option_1="Sxhkd"
option_2="Polybar"
option_3="Eww"
option_4="Dunst"
option_5="Picom"
option_6="Bspwm"

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-theme-str "element-text {font: \"$efonts\";}" \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows
	# -theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

kill_and_notify() {
	kill_cmd="${1}"
	name="${2}"
	restart_as_daemon="${3}"
	daemon_start_cmd="${4}"

	eval "$kill_cmd"

	case $restart_as_daemon in
	y) eval "$daemon_start_cmd" & ;;
	*)
		# Run restart commandd
		if [[ "$3" != "" ]]; then
			eval "$3"
		fi
		;;
	esac

	# Run any additional commands
	if [[ "$5" != "" ]]; then
		eval "$5"
	fi

	. $HOME/bin/notifications/notify-app-or-process-restart.sh "$name" "Config reloaded by rofi."
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		kill_and_notify "killall -q sxhkd" "SXHKD" "y" "sxhkd"
	elif [[ "$1" == '--opt2' ]]; then
		kill_and_notify "killall -q polybar" "Polybar" "y" "polybar -c $HOME/.config/polybar/config.ini main"
		# kill_and_notify "killall -q polybar" "Polybar" "y" "bash $HOME/.config/polybar/launch.sh --grayblocks"
	elif [[ "$1" == '--opt3' ]]; then
		kill_and_notify "eww kill" "Eww"
	elif [[ "$1" == '--opt4' ]]; then
		kill_and_notify "killall -q dunst" "Dunst" "y" "dunst" "sleep 0.5"
	elif [[ "$1" == '--opt5' ]]; then
		kill_and_notify "killall -q picom" "Picom" "y" "picom -c $HOME/.config/picom/picom.conf"
	elif [[ "$1" == '--opt6' ]]; then
		kill_and_notify "bspc wm -r" "BSPWM" "n"
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$option_1)
	run_cmd --opt1
	;;
$option_2)
	run_cmd --opt2
	;;
$option_3)
	run_cmd --opt3
	;;
$option_4)
	run_cmd --opt4
	;;
$option_5)
	run_cmd --opt5
	;;
$option_6)
	run_cmd --opt6
	;;
esac
