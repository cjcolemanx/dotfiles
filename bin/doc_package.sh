#!/usr/bin/env bash
#
# Quick log newly installed packages to the setup script
# TODO: add installation helper

TYPE="$1"
PACKAGE_NAME="$2"
PACKAGE_NOTE=${3:-''}

yay_file="$HOME/bin/setup/packages/yay/packages.txt"
pac_file="$HOME/bin/setup/pacman/packages.txt"
py_file="$HOME/bin/setup/python/packages.txt"
cargo_file="$HOME/bin/setup/cargo/packages.txt"
node_file="$HOME/bin/setup/node/packages.txt"

case "$TYPE" in
yay | aur) echo "$PACKAGE_NAME # $PACKAGE_NOTE" >>"$yay_file" ;;
pac | pacman) echo "$PACKAGE_NAME # $PACKAGE_NOTE" >>"$pac_file" ;;
py | python) echo "$PACKAGE_NAME # $PACKAGE_NOTE" >>"$py_file" ;;
rust | cargo) echo "$PACKAGE_NAME # $PACKAGE_NOTE" >>"$cargo_file" ;;
js | npm | node) echo "$PACKAGE_NAME # $PACKAGE_NOTE" >>"$node_file" ;;
*) echo "USAGE: docpackage [type] [package name] [note]" ;;
esac
