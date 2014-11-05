#!/bin/bash

# user template location
USER_TEMPLATE_PREFS=/System/Library/User\ Template/English.lproj/Library/Preferences

# Set screen saver preferences

# Set the Start time to: Never
echo "Setting Screensaver activation to: Never"
defaults -currentHost write com.apple.screensaver idleTime 0
defaults -currentHost write "${USER_TEMPLATE_PREFS}"/com.apple.screensaver idleTime 0

exit 0