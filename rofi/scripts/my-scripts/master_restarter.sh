#!/usr/bin/env bash

source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$ranger_type/$ranger_style"
polybar_loc="$HOME/.config/polybar/grayblocks/config.ini"

# Theme Elements
prompt='Select Process'
mesg="Relaunch the selected process"

if [[ ("$theme" == *'type-1'*) || ("$theme" == *'type-3'*) || ("$theme" == *'type-5'*) ]]; then
	list_col='1'
	list_row='6'
elif [[ ("$theme" == *'type-2'*) || ("$theme" == *'type-4'*) ]]; then
	list_col='6'
	list_row='1'
fi

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
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		killall -q sxhkd
		sxhkd &
		. $HOME/bin/notifications/notify-app-or-process-restart.sh "Sxhkd" "Config reloaded."
	elif [[ "$1" == '--opt2' ]]; then
		killall -q polybar
		bash ~/.config/polybar/launch.sh --grayblocks &
		. $HOME/bin/notifications/notify-app-or-process-restart.sh "Polybar" "Config reloaded."
	elif [[ "$1" == '--opt3' ]]; then
		eww kill
		. $HOME/bin/notifications/notify-app-or-process-restart.sh "Eww" "Config reloaded."
	elif [[ "$1" == '--opt4' ]]; then
		killall -q dunst
		dunst &
		sleep 0.5
		. $HOME/bin/notifications/notify-app-or-process-restart.sh "Dunst" "Config reloaded."
	elif [[ "$1" == '--opt5' ]]; then
		killall -q picom
		picom -c "$HOME/.config/picom/picom.conf" &
		. $HOME/bin/notifications/notify-app-or-process-restart.sh "Picom" "Config reloaded."
	elif [[ "$1" == '--opt6' ]]; then
		bspc wm -r
		. $HOME/bin/notifications/notify-app-or-process-restart.sh "Bspwm" "Config reloaded."
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
