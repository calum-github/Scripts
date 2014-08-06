#!/bin/sh

dscl . -delete /Computers/localhost
rm -R /Library/Managed\ Preferences/*
jamf manage
reboot

