#!/bin/sh

# Enable ARD for user
enabled_ard_user="cadmin"

# Enable for user and give all privileges
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -users $enabled_ard_user -access -on -restart -agent -privs -all

# Allow access for all users
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -specifiedUsers