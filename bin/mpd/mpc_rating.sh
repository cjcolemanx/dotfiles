#!/usr/bin/env bash
mpc_sticker get rating 2>&1 | grep -v '^MPD error: no such sticker$' || echo "unrated"
