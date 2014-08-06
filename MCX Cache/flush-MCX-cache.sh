#!/bin/bash

## Flush MCX Cache for 10.6/10.7 clients

## First lets remove the cached MCX Settings

echo "Flushing MCX Cache for 10.6/10.7"

dscl . -list Computers | grep -v "^localhost$" | while read computer_name ; do sudo dscl . -delete Computers/"$computer_name" ; done

echo "MCX cache in DS Node /Local has been removed"

## Now we must remove the cached settings for the mobile user account

echo "Now removing MCX caches stored in local mobile accounts"

for i in `ls /Users/`
do
	dscl . -delete /Users/$i MCXSettings
	dscl . -delete /Users/$i MCXFlags
	dscl . -delete /Users/$i cached_groups
	echo "Removed MCXSettings, MCXFlags and cached_groups for $i"
done


## Now lets go ahead and remove the actual cached files in /Library/Managed Client

rm -rf /Library/Managed\ Preferences/*
echo "Removed /Library/Managed Preferences"

exit 0

