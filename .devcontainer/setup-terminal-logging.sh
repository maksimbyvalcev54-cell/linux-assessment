#!/bin/bash

LOG_DIR="/workspaces/linux-assessment/terminal-logs"

mkdir -p "$LOG_DIR"

if ! grep -q "LINUX_ASSESSMENT_TERMINAL_LOGGING" "$HOME/.bashrc"; then
cat >> "$HOME/.bashrc" <<'BASHRC'

# LINUX_ASSESSMENT_TERMINAL_LOGGING
if [[ $- == *i* ]] && [[ -z "$LINUX_ASSESSMENT_TERMINAL_LOGGING" ]]; then
    export LINUX_ASSESSMENT_TERMINAL_LOGGING=1

    LOG_DIR="/workspaces/linux-assessment/terminal-logs"
    mkdir -p "$LOG_DIR"

    LOG_FILE="$LOG_DIR/terminal-$(date +%Y%m%d-%H%M%S)-$$.log"

    exec script -q -f "$LOG_FILE" bash --noprofile --norc
fi

BASHRC
fi
