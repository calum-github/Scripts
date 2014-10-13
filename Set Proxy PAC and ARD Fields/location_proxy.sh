#!/bin/bash

#################################################################################
## Author:  Calum Hunter                                                        #
##																				#	
## Version: 0.1  	                                                            #
##																				#
## Date:    13/10/2014														    #			
##																			    #
## Purpose:	Quick script to populate the ARD fields with site information       #
## 			Also fill the network interfaces with the proxy pac URL 		    #
##																				#
## Notes:   Some code borrowed from Ben Toms (The Mac Mule) github.com/macmule  #
##																				#
#################################################################################


# Read in our variables
read autoProxyURL < /var/proxyurl.txt
read locationinfo < /var/location_details.txt

# Populate the location information into the ARD Field 1
echo "Setting our Computer Location information into ARD Field 1"
/usr/bin/defaults write /Library/Preferences/com.apple.RemoteDesktop Text1 -string "$locationinfo"


# Detects all network hardware & creates services for all installed network hardware
echo "Detecting all connected network hardware"
/usr/sbin/networksetup -detectnewhardware

# Set the proxy for all network services
IFS=$'\n'

	#Loops through the list of network services
	for i in $(networksetup -listallnetworkservices | tail +2 );
	do
	
		# Get a list of all services
		autoProxyURLLocal=`/usr/sbin/networksetup -getautoproxyurl "$i" | head -1 | cut -c 6-`
		
		# Echo's the name of any matching services & the autoproxyURL's set
		echo "$i Proxy set to $autoProxyURLLocal"
	
		# If the value returned of $autoProxyURLLocal does not match the value of $autoProxyURL for the interface $i, change it.
		if [[ $autoProxyURLLocal != $autoProxyURL ]]; then
			networksetup -setautoproxyurl $i $autoProxyURL
			echo "Set proxy for $i to $autoProxyURL"
		fi
	done

echo "Proxies All Present And Correct..."

unset IFS

exit 0 