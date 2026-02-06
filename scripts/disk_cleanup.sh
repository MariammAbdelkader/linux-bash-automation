#!/bin/bash

# Directory to clean
LOG_DIR="/var/log"
# Remove files older than DAYS
DAYS=7

sudo find $LOG_DIR -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;

echo "Old logs cleaned from $LOG_DIR"
