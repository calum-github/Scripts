#!/bin/bash


# user template location
USER_TEMPLATE_PREFS=/System/Library/User\ Template/English.lproj/Library/Preferences

# set the default view for all users
echo "Setting default finder views for all users"
defaults write "${USER_TEMPLATE_PREFS}"/com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write "${USER_TEMPLATE_PREFS}"/com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write "${USER_TEMPLATE_PREFS}"/com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write "${USER_TEMPLATE_PREFS}"/com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write "${USER_TEMPLATE_PREFS}"/com.apple.finder NewWindowTarget PfHm

exit 0