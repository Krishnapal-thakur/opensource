#!/bin/bash
#==================================================================
# Script 4: Log File Analyzer
# Author: Krishnapal Thakur | Reg No : 24BCY10269
# Course: Open Source Software | VIT Bhopal University
# Purpose: Check log file and count keyword occurrences
#==================================================================

LOGFILE=${1:-"/tmp/mock_pip.log"}
KEYWORD=${2:-"ERROR"}    # Default keyword is 'ERROR'
COUNT=0

# Adding mock data if no file provided (for testing the run)
if [ ! -f "$LOGFILE" ]; then
    echo "ERROR: Could not satisfy requirement" > "$LOGFILE"
    echo "INFO: Downloading packages" >> "$LOGFILE"
    echo "WARNING: Permissions broken" >> "$LOGFILE"
    echo "ERROR: Version conflict" >> "$LOGFILE"
fi

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"

# Retry if file is empty
if [ ! -s "$LOGFILE" ]; then
    RETRY=0
    until [ -s "$LOGFILE" ] || [ $RETRY -ge 3 ]; do
        echo "File is empty. Retrying... ($RETRY)"
        sleep 1
        RETRY=$((RETRY + 1))
    done
fi

echo "Last 5 matching lines:"
tail -n 100 "$LOGFILE" 2>/dev/null | grep -i "$KEYWORD" | tail -n 5