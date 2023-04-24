#!/usr/bin/env bash
#
# Just run a simple command.
#
# No need to jump to a terminal!
#
# Obvs, use is limited, but can be expanded pretty easily
TYPE="$1"

# Store user-input
command=$(eval "$HOME/bin/rofi/rofi-simple-text-pipe.sh" "CMD")

# echo - for piping
# eval (DEFAULT)- for evaluating
case $TYPE in
echo) echo "$command" ;;
eval) eval "$command" ;;
*) eval "$command" ;;
esac
