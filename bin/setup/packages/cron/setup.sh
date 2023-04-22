#!/usr/bin/env bash
#
# Sets up cron jobs using user-defined scripts

# Copy user crontab (prevent overwrite)
crontab -l >crontab_new

# Append new jobs to old crontab
./add_package_tasks.sh >>crontab_new

# Check for duplicates

# Remove duplicates, write changes
crontab_new=$(echo "$crontab_new" | sort -u)
crontab crontab_new

# Clear local temp file
rm crontab_new
