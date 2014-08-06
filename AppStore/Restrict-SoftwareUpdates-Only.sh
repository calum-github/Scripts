#/bin/bash

# Restrict the app store to Software Updates Only

defaults write /Library/Preferences/com.apple.appstore restrict-store-softwareupdate-only -bool yes

exit 0
