#!/bin/bash
# Script to rename computer name to serial number in case it has been changed

SERIAL=`/usr/sbin/system_profiler SPHardwareDataType | grep Serial | /usr/bin/awk '{print$4}'`

PREFIX="Mac"

echo "Setting ComputerName to $SERIAL"

scutil --set ComputerName $PREFIX-$SERIAL

echo "Setting HostName to $SERIAL"

scutil --set HostName $PREFIX-$SERIAL

echo "Setting LocalHostname to $SERIAL"

scutil --set LocalHostName $PREFIX$SERIAL

echo "Rename completed!"



