#!/usr/bin/env bash
#
# SILLY ME! this is a built in thing with dunstctl!

if [[ $(dunstctl is-paused) == "false" ]];; then
  return 0
else
  return 1
fi

# # Helper for toggle-custom-notifications.sh
# # Simply checks for file existence
# # Can use in polybar and notifications (that need it)
# DISABLED_NOTIFS_FILE="/tmp/custom-notifs-disabled"
#
# # if not disabled, return 0; else return 1
# if [ -f "$DISABLED_NOTIFS_FILE" ]; then
# 	echo 0
# else
# 	echo 1
# fi
