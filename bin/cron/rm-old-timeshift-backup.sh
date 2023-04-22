#!/usr/bin/env bash
run_cmd() {
	# format of snapshot name:
	# "YYYY-MM-DD_HH-MM-SS"
	timeshift --delete --snapshot "$1"
}

get_date_only() {
	date="$(echo "$1" | cut -f 1 -d "_")"
	echo "$date"
}
