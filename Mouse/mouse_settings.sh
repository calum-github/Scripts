#!/bin/bash


USER_TEMPLATE_PREFS=/System/Library/User\ Template/English.lproj/Library/Preferences

# Set Apple Mouse button 1 to Primary click and button 2 to Secondary click.
echo "Set button 2 as secondary click on apple mouse"
defaults write "${USER_TEMPLATE_PREFS}"/com.apple.driver.AppleHIDMouse Button1 -integer 1
defaults write "${USER_TEMPLATE_PREFS}"/com.apple.driver.AppleHIDMouse Button2 -integer 2
echo "Setting mouse and trackpad scolling direction to: Normal"
defaults write "${USER_TEMPLATE_PREFS}"/.GlobalPreferences com.apple.swipescrolldirection -bool FALSE

exit 0