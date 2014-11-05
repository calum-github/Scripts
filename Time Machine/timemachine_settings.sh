#!/bin/bash

echo "Disabling TimeMachine prompt when plugging in external drive"
# Disable Time Machine's & pop-up message whenever an external drive is plugged in
for USER_TEMPLATE in "/System/Library/User Template"/*
do
defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
done
defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
defaults write /Library/Preferences/com.apple.TimeMachine AutoBackup -boolean NO

# Disable Time Machine snapshots on local disk
echo "Disabling Time Machine snapshots on local disk"
tmutil disablelocal

exit 0