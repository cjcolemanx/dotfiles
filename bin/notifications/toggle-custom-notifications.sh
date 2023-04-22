#!/usr/bin/env bash

# Script to stop some automatic notifications
#
# Mostly useful for disabling notifications caused by sxhkd or media players ...
#
# ... cuz I'm lazy and would like to lock them with another keypress lmao
DISABLED_NOTIFS_FILE="/tmp/custom-notifs-disabled"

if [ -f "$DISABLED_NOTIFS_FILE" ]; then
	rm -f "$DISABLED_NOTIFS_FILE"
else
	touch "$DISABLED_NOTIFS_FILE"
fi
