#!/usr/bin/env bash
#
# Helper script for running:
#   - nested rofi menus
#   - shell commands
#
# You can pass a file via the first position, the title of the picker
# via the second, and lastly indicate whether it's a file outside of
# the bin/rofi/csv directory by passing a 'y' via the second.
#
# No matter what the file must contain only key-pair strings separated by
# ',' (comma) with linebreaks between each pair
#
# Additionally, environmen variables are NOT expanded, so don't use "$HOME" and
# the like. '~/' works fine tho.

DEFAULT_FILE_FOLDER="$HOME/bin/rofi/csv"
# NOTE: TRYING STUFF OUT
# THEME="$HOME/.config/rofi/custom-rofi/test.rasi"

MAP="$1"
TITLE="$2"
EXTRA_OPTS="$3"
REMOTE="$4"
DEBUG="$5"
SKIP_EXIT="$6"

case $REMOTE in
y) MAP="$REMOTE" ;;
*) MAP="$DEFAULT_FILE_FOLDER/$MAP" ;;
esac

if [[ "$3" == "" ]]; then
	EXTRA_OPTS=""
fi

case $DEBUG in
--debug)
	dunstify \
		-a "ROFI" \
		"Debug" \
		"$(printf "%s\n\nCOMMAND:\n%s" "$MAP" "rofi -dmenu $EXTRA_OPTS")" \
		-h string:x-dunst-stack-tag:DEBUG-ROFI-DMENU-CSV
	;;
esac

# shellcheck disable=SC2002
# Only way it works lol
cat "$MAP" |
	cut -d "," -f 1 |
	rofi -dmenu "$EXTRA_OPTS" -p "$TITLE" |
	head -n 1 |
	xargs -i --no-run-if-empty grep "{}" "$MAP" |
	cut -d ',' -f 2 |
	head -n 1 |
	xargs -i --no-run-if-empty /bin/bash -c "{}"

if [[ "$SKIP_EXIT" != "--no-exit" ]]; then
	exit 0
fi
