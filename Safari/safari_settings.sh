#!/bin/bash

# Set some basic safari settings
homepage="http://www.dec.nsw.gov.au/"
USER_TEMPLATE_PREFS=/System/Library/User\ Template/English.lproj/Library/Preferences

# Show status bar
/usr/bin/defaults write "${USER_TEMPLATE_PREFS}"/com.apple.Safari ShowStatusBar -bool true
# Show favorites bar
/usr/bin/defaults write "${USER_TEMPLATE_PREFS}"/com.apple.Safari ShowFavoritesBar -bool true
# Safari opens with: A new window
/usr/bin/defaults write "${USER_TEMPLATE_PREFS}"/com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false
# New windows open with: Empty Page
/usr/bin/defaults write "${USER_TEMPLATE_PREFS}"/com.apple.Safari NewWindowBehavior -int 0
# New tabs open with: Empty Page
/usr/bin/defaults write "${USER_TEMPLATE_PREFS}"/com.apple.Safari NewTabBehavior -int 1
# Homepage
/usr/bin/defaults write "${USER_TEMPLATE_PREFS}"/com.apple.Safari HomePage -string "$homepage"
# Don't open "safe" files after downloading
/usr/bin/defaults write "${USER_TEMPLATE_PREFS}"/com.apple.Safari AutoOpenSafeDownloads -bool false

exit 0