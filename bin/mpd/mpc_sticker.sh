#!/usr/bin/env bash
mpc sticker "$(mpc current -f '%file%')" "$@"
