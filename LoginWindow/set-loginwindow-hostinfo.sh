#!/bin/bash

# Show the one of the following pieces of information in the login window

Host_Name = HostName
OS_Vers = SystemVersion
SysBuild = SystemBuild
SerialNum = SerialNumber
IPAdd = IPAddress
DS_Stat = DSStatus

# Set the key
defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo $DS_Stat

exit 0