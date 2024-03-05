#!/bin/bash

# Set up environment variables
CRON_SCHEDULE="*/15 * * * *"

REPO=$(echo "$GITHUB_REPOSITORY" | cut -d'/' -f2)
SCRIPT_PATH="/workspaces/$REPO/.devcontainer/sync.sh"

# Install cron
apt-get update
apt-get install -y cron

# Add cron job to crontab using environment variables
(echo "$CRON_SCHEDULE $SCRIPT_PATH") | crontab -
