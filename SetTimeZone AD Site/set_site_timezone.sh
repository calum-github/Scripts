#!/bin/bash

#########################################################
#                                                       #
# Author:   Calum Hunter                                #
# Date:     14-10-2014                                  #
# Version:  0.2                                         #
# Purpose:  Set the timezone based upon AD Site ID      #
# Changes:  0.2 Better comments &log output to syslog   #
#                                                       #
#########################################################

# Location of our site and building information
info="/var/location_details.txt"

# Parse through our information file to pull out our site code
site=`cat $info | cut -d " " -f 2 | cut -c 1-4`

## This function logs our info to the system.log
notify(){
	logger -s "*** INFO ***    Site is outside of standard AEST/AEDST (Sydney) timezone!"
	logger -s "*** INFO ***    Checking AD Site code to determine correct timezone"
	logger -s "*** INFO ***    Found site code:- $site"
	logger -s "*** INFO ***    Setting timezone to $timezone"
}

## Check to see if our site code matches any of these special sites. Set the timezone variable on match. 
case $site in
	1921)
		timezone="Australia/Lord_Howe" 			# Site 1921 is Lord Howe - set time zone appropriately 
		notify;;								# Run our notify function for logging purposes
	1028|8105|1371|1369|1432|4232|4233|5302|8491)  # These sites are all ACST ie. Adelaide, so set timezone to Adelaide
		timezone="Australia/Adelaide"			
		notify;;								# Run our notify function for logging purposes
		*) 
		timezone="Australia/Sydney"				# For everyone else, we assume you are in Sydney, so set timezone and log some info
		logger -s "*** INFO ***    AD Site $site"
		logger -s "*** INFO ***    No special timezones found"
		logger -s "*** INFO ***    Setting timezone to $timezone";;
esac

# Set the timezone here
/usr/sbin/systemsetup -settimezone $timezone

exit 0