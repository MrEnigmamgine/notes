#!/bin/sh
## Set the locale to en_US.UTF-8
export LANG=en_US.UTF-8
KEYMAP=us

## Set the keyboard layout
loadkeys $KEYMAP
echo "Locale set to $LANG and keyboard layout set to $KEYMAP."
locale

## Set console font
setfont eurlatgr

echo 
echo "Ensuring timedatectl is working properly..."
timedatectl status
