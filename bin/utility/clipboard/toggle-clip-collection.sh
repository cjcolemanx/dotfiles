#!/usr/bin/env bash
#
# Toggle clipboard history via a tmpfile

TMP_FILE=/tmp/cliphistory-disabled

if [[ -f "$TMP_FILE" ]]; then
	clipctl enable
	rm -f "$TMP_FILE"
else
	clipctl disable
	echo "" >"$TMP_FILE"
fi
