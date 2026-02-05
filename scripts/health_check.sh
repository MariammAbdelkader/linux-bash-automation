#!/bin/bash

# Get the directory of THIS script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Load thresholds
source "$SCRIPT_DIR/../config/thresholds.conf"

# Log file
LOG_FILE="$SCRIPT_DIR/../logs/health.log"

# Timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Get system usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Log usage
echo "[$TIMESTAMP] CPU: ${CPU}% MEM: ${MEM}% DISK: ${DISK}%" >> $LOG_FILE

# Function to check thresholds
check_threshold () {
  if [ "$1" -gt "$2" ]; then
    echo "⚠️ ALERT: $3 usage exceeded threshold at $TIMESTAMP" >> $LOG_FILE
  fi
}

check_threshold "$CPU" "$CPU_THRESHOLD" "CPU"
check_threshold "$MEM" "$MEM_THRESHOLD" "Memory"
check_threshold "$DISK" "$DISK_THRESHOLD" "Disk"
