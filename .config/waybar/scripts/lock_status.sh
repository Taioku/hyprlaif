#!/usr/bin/env bash

PID_FILE="/tmp/waybar_lock_pid"

if [[ -f "$PID_FILE" ]] && ps -p "$(cat $PID_FILE)" >/dev/null 2>&1; then
  echo ''
else
  echo ''
fi
