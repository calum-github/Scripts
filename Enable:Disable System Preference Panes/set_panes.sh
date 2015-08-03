#!/bin/bash

#############################################################
#                                                           #
# Author:   Calum Hunter                                    #
# Date:     3-2-2015                                        #
# Version:  0.1                                             #
# Purpose:  This script allows for the enabling             #
#           and disabling of system preference panes.       #
#           Yes you can do this with profiles.              #
#           Yes I should be using Python and CFPrefs        #
#                                                           #
#############################################################

# Standard variables
sys_prefs_plist="/Library/Preferences/com.apple.systempreferences.plist"
script_name=$0
mode=$1
pref=$2

main(){
	sanity_checks
	run_mode
}

useage(){
		echo "######################################################################################################"
		echo "#                                                                                                    #"
		echo "# Useage:- To enable a preference pane: ${script_name} --enable com.apple.preferences.mouse             #"
		echo "#          To disable a preference pane: ${script_name} --disable com.apple.preferences.mouse            #"
		echo "#                                                                                                    #"
		echo "#          To find out the bundle ID of your preference pane run something like this:                #"
		echo "# grep -A 1 CFBundleIdentifier /System/Library/PreferencePanes/Profiles.prefPane/Contents/Info.plist #" 
		echo "#                                                                                                    #"
		echo "######################################################################################################"
		exit 1
}

run_mode(){
	# Are we going to enable or disable a pane?
	if [ "$mode" = "--enable" ];
		then
		renable_pref_pane
	elif [ "$mode" = "--disable" ];
		then
		disable_pref_pane
	fi
}

sanity_checks(){
	# Check for admin/root permissions
	if [ "$(id -u)" != "0" ]; then
		echo "*** You need to be running this as root, or have root privs ie. sudo" 1>&2
		exit 1
	fi	
	# Check for correct options being given
	if [[ "$mode" = "--enable" ]] || [[ "$mode" = "--disable" ]];
		then
			echo "Mode specified correctly" > /dev/null
		else
			useage
	fi
	if [ -z $pref ];
		then 
		useage
	fi
}

disable_pref_pane(){
	# Disable the prefpane provided by the user
	find_pref
	if [ ${pref_status} = 0 ];
		then
			echo "*** Warning - ${pref} is already disabled!"
			exit 1
		else
			echo "*** Disabling ${pref}"
			defaults write $sys_prefs_plist DisabledPreferencePanes -array-add '<string>'"${pref}"'</string>' 
			refresh_cfprefs
	fi
}

refresh_cfprefs(){
	# I KNOW! I KNOW! But doing this with Python is HARD!
	echo "*** Done, refreshing cfprefsd..."
	killall cfprefsd
	chmod 644 $sys_prefs_plist 
}

find_pref(){
	# See if we can find the requested preference pane in our list of disabled panes
	plutil -convert xml1 "${sys_prefs_plist}"
	grep "${pref}" "${sys_prefs_plist}" > /dev/null
	pref_status=$?
}

renable_pref_pane(){
	# enable our currently disabled pane
	find_pref
	if [[ ${pref_status} -ne 0 ]];
		then
			echo "*** ${pref} is not disabled! Nothing to do. Move along."
			exit 1
	elif [[ ${pref_status} = 0 ]];
		then 
			echo "*** Enabling preference pane ${pref}"
			sed -i '' '/'"${pref}"'/d' "${sys_prefs_plist}"
			refresh_cfprefs
	fi
}

main
exit 0
