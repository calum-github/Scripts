#!/bin/bash

# Script to rename computer name to Wi-Fi MAC address
# All machines should have WiFi so we will use that.


# Grab a the primary active network port wi-fi or ethernet
MAC=`networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/,/Ethernet/' | awk 'NR==3' | cut -d " " -f 3 | sed s/://g`

SUFFIX="M"

echo "Setting ComputerName to $MAC-$SUFFIX"

scutil --set ComputerName $MAC-$SUFFIX

echo "Setting HostName to $MAC-$SUFFIX"

scutil --set HostName $SUFFIX-$MAC

echo "Setting LocalHostname to $MAC-$SUFFIX"

scutil --set LocalHostName $MAC-$SUFFIX

echo "Rename completed!"



