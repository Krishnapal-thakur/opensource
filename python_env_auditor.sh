#!/bin/bash
#==================================================================
# Script 3: Disk and Permission Auditor
# Author: Krishnapal Thakur | Reg No : 24BCY10269
# Course: Open Source Software | VIT Bhopal University
# Purpose: Check disk usage and file permissions
#==================================================================

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "----------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

# Software config directory check
SOFTWARE_CONFIG="/etc/python3"

echo ""
echo "Software Config Check ($SOFTWARE_CONFIG):"

if [ -d "$SOFTWARE_CONFIG" ]; then
    CONF_PERMS=$(ls -ld "$SOFTWARE_CONFIG" | awk '{print $1, $3, $4}')
    echo "$SOFTWARE_CONFIG => Permissions: $CONF_PERMS"
else
    echo "$SOFTWARE_CONFIG does not exist on this system"
fi