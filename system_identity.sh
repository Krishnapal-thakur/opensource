#!/bin/bash
#==================================================================
# Script 1: System Identity Report
# Author: Krishnapal Thakur | Reg No : 24BCE10220
# Course: Open Source Software | VIT Bhopal University
# Purpose: Display system information as a welcome screen
#==================================================================

# --- Variables ---
STUDENT_NAME="Krishnapal Thakur"
REG_NUMBER="24BCE10220"
SOFTWARE_CHOICE="Python"

# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p 2>/dev/null || echo "Unknown")

# --- Display ---
echo "======================================"
echo "  Open Source Audit - $STUDENT_NAME"
echo "======================================"
echo "Kernel  : $KERNEL"
echo "User    : $USER_NAME"
echo "Uptime  : $UPTIME"

# Distro name
if [ -f /etc/os-release ]; then
    DISTRO=$(grep "^PRETTY_NAME=" /etc/os-release | cut -d'"' -f2)
else
    DISTRO=$(uname -o 2>/dev/null || echo "Unknown")
fi
echo "Distro  : $DISTRO"

# Date
echo "Date    : $(date)"

# License message
echo "License : The Python Software Foundation (PSF) License is highly permissive."