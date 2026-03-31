#!/bin/bash
#==================================================================
# Script 2: FOSS Package Inspector
# Author : Krishnapal Thakur | Reg No : 24BCE10220
# Course : Open Source Software | VIT Bhopal University
# Purpose: Check if a package is installed and print its details
#==================================================================

PACKAGE="python3"   # e.g. httpd, mysql, vlc, firefox

# Check if package is installed
if bash -c "rpm -q $PACKAGE" &>/dev/null || bash -c "dpkg -s $PACKAGE" &>/dev/null; then
    echo "$PACKAGE is installed."

    # Using rpm if exists, otherwise dpkg fallback
    if command -v rpm &>/dev/null; then
        rpm -qi $PACKAGE | grep -E 'Version|License|Summary'
    else
        dpkg -s $PACKAGE | grep -E 'Version|Maintainer|Description' | head -n 3
    fi
else
    echo "$PACKAGE is NOT installed."
fi

# Philosophy note based on package
case $PACKAGE in
    httpd)   echo "Apache: the web server that built the open internet" ;;
    mysql)   echo "MySQL: open source at the heart of millions of apps" ;;
    python3) echo "Python: Simple is better than complex; Readability counts." ;;
    vlc)     echo "VLC: Plays almost every media format freely." ;;
    firefox) echo "Firefox: Supports an open and secure internet." ;;
    docker)  echo "Docker: Build, Ship, and Run Any App Anywhere." ;;
    *)       echo "Unknown software package philosophy." ;;
esac