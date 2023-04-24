#!/usr/bin/env bash
#
# Rofi my mpc wrapper

MAP="mpcc-commands.csv"

. "$HOME/bin/rofi/rofi-dmenu-from-file.sh" $MAP "Run MPC(c) Command"
