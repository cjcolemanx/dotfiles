#!/usr/bin/env bash
NEW_NAME="$1"
file_name="$(command ls -rt "$SCREENSHOT_DIR" | tail -n 1)"

error_notify() {
	dunstify "Screenshot" "${1}"
	exit 1
}

if [[ "$NEW_NAME" != "" ]]; then
	cp "$SCREENSHOT_DIR/$file_name" "$SCREENSHOT_DIR/$1.png" || error_notify "There was an error renaming your screenshot!"
	rm -f "$file_name" || error_notify "There was an error deleting the old screenshot!"
	exit 0
else
	echo "$file_name"
fi
