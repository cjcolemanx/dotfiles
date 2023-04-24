#!/usr/bin/env bash
APP="$1"
SCREENSHOT_TYPE="$2"
IS_IN_CLIPBOARD="$3"

# NOTE: MUST set the environment variable SCREENSHOT_DIR
PRIVATE_OPTS="$4"

# TODO: get most  recent image from screenshot
screenshot_name="..."

if [[ $IS_IN_CLIPBOARD == True ]]; then
	format_append=" (Copied to Clipboard)."
else
	format_append="."
fi

case $PRIVATE_OPTS in
--say-dir)
	format="$(printf "%s %s saved to %s%s" "$SCREENSHOT_TYPE" "$screenshot_name" "$SCREENSHOT_DIR" "$format_append")"
	;;
*)
	format="$(printf "%s %s saved to your screenshot directory%s" "$SCREENSHOT_TYPE" "$screenshot_name" "$format_append")"
	;;
esac

# Get screenshot name for display (will path later)
screenshot=$(eval "$HOME/bin/utility/get-most-recent-screenshot.sh")

# Setup output folder path
preview_dir="$HOME/.tmp/dunst-icons"
# Setup output file path
preview_name="$preview_dir/last_screenshot.png"

# Copy newest screenshot
cp -f "$SCREENSHOT_DIR/$screenshot" "$preview_dir"

# Prep image for notification
ffmpeg -y -i "$SCREENSHOT_DIR/$screenshot" \
	-an -vf scale=128:128 "$preview_name" \
	>/dev/null 2>&1

dunstify -a "$APP" \
	"Screenshot taken" \
	"$format" \
	-h string:x-dunst-stack-tag:screenshot-taken-notify \
	-i "$preview_name" \
	-t 3000

rm -f "$preview_dir/$screenshot"
