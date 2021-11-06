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

echo "Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

echo "Finder Preview Pane defaults"
for i in public.archive public.audio public.image public.item public.movie public.presentation public.text; do
    defaults write com.apple.finder PreviewPaneSettings -dict-add "$i" '{ showQuickActions = 0; }'
done
