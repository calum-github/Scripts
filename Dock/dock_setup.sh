#!/bin/bash

# Default dock settings for user accounts
# Configured via Dockutil

# This should be run as a initial login script via launchd and then removed.

# Remove the dock items we don't want
echo "Removing Dock Items....."
/usr/local/bin/dockutil --remove Launchpad
/usr/local/bin/dockutil --remove Mail
/usr/local/bin/dockutil --remove Contacts
/usr/local/bin/dockutil --remove Reminders
/usr/local/bin/dockutil --remove Notes
/usr/local/bin/dockutil --remove Messages
/usr/local/bin/dockutil --remove FaceTime
/usr/local/bin/dockutil --remove 'App Store'
/usr/local/bin/dockutil --remove 'System Preferences'

# Add new items 
echo "Adding new Dock Items..."
/usr/local/bin/dockutil --add /Applications/Firefox.app
/usr/local/bin/dockutil --add '/Applications/Microsoft Office 2011/Microsoft Word.app'
/usr/local/bin/dockutil --add '/Applications/Microsoft Office 2011/Microsoft PowerPoint.app'
/usr/local/bin/dockutil --add '/Applications/Microsoft Office 2011/Microsoft Excel.app'
/usr/local/bin/dockutil --add '/Applications/Photo Booth.app'

# Let the people know
echo "Dock is now configured!"
echo "Cleaning up - Removing Plist and Setup Script"

# Clean up after ourselves
rm -rf ~/LaunchAgent/au.edu.nsw.det.calumhunter.docksetup.plist
#rm -rf /Library/Scripts/dock_setup.sh

exit 0