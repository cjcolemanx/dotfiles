#!/usr/bin/env bash
MY_LOGS="$HOME/.tmp/mylogs"
LOG_NAME="$1"
LOG_OUTPUT="$2"
APPEND="$3"

# Make sure folder exists
! [ -d "$MY_LOGS" ] && mkdir "$MY_LOGS"
! [ -f "$MY_LOGS/$LOG_NAME" ] && touch "$MY_LOGS/$LOG_NAME"

case "$APPEND" in
--append) echo "$LOG_OUTPUT" >>"$MY_LOGS/$LOG_NAME" ;;
*) echo "$LOG_OUTPUT" >"$MY_LOGS/$LOG_NAME" ;;
esac
