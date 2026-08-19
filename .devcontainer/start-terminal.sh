#!/bin/bash

LOG_DIR="/workspaces/linux-assessment/terminal-logs"

mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/terminal-$(date +%Y%m%d-%H%M%S)-$$.log"

exec script -q -f -c "/bin/bash --noprofile --norc" "$LOG_FILE"
