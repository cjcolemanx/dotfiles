#!/usr/bin/env bash
case "$1" in
screen) flameshot screen --clipboard --path "$SCREENSHOT_DIR" ;;
full) flameshot full --clipboard --path "$SCREENSHOT_DIR" ;;
gui) flameshot gui --clipboard --path "$SCREENSHOT_DIR" ;;
*) exit ;;
esac

dunstify "" "$@"
