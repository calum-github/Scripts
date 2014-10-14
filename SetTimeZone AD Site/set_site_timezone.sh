#!/bin/bash

######################################################
#                                                    #
# Author:   Calum Hunter                             #
# Date:     14-10-2014                               #
# Version:  0.1                                      #
# Purpose:  Set the timezone based upon AD Site ID   #
#                                                    #
######################################################

# First lets get our site code. scoop this up from /var
info="/var/location_details.txt"

# Now parse this to grab just our 4 digit site code
site=`cat $info | cut -d " " -f 2 | cut -c 1-4`

## Log some info to stdout about what we are doing.
notify(){
	echo "*** INFO ***    Site is outside of standard AEST/AEDST (Sydney) timezone!"
	echo "*** INFO ***    Checking AD Site code to determine correct timezone"
	echo "*** INFO ***    Found site code:- $site"
	echo "*** INFO ***    Setting timezone to $timezone"
}

## Check to see if our site code matches any of these special sites. Set the timezone variable on match. 
case $1 in
	1921)
		timezone="Australia/Lord_Howe"
		notify;;
	1028|8105|1371|1369|1432|4232|4233|5302|8491)
		timezone="Australia/Adelaide"
		notify;;
		*) 
		timezone="Australia/Sydney"
		echo "*** INFO ***    Nothing special"
		echo "*** INFO ***    Setting timezone to $timezone";;
esac

# Set the timezone here
/usr/sbin/systemsetup -settimezone $timezone

exit 0