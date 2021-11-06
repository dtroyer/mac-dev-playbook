#!/bin/bash

HOSTNAME=${1:-sterling}

sudo scutil --set ComputerName $HOSTNAME
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $HOSTNAME

echo "Enable SSH"
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist

echo "Set Caps Lock to Ctrl"
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000e0}]}'
