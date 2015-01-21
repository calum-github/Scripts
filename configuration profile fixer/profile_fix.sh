#!/bin/bash

# Quick script to take a configuration profile from 
# Profile manager and convert it to binary and then back
# to xml to fix up the lack of indentations
#
# Useage: ./profile_fix.sh /path/to/config_profile.mobileconfig

if [ -z "$1" ]
	then
		echo "Useage: ./profile_fix.sh /path/to/config_profile.mobileconfig"
		exit 0
fi
echo "### Fixing line indentations ###"
/usr/bin/plutil -convert binary1 $1
/usr/bin/plutil -convert xml1 $1
echo "### Done ###"
exit 0