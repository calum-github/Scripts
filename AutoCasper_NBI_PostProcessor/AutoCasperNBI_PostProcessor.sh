#!/bin/bash

######################################################################################
#                                                                                    #
# Author:	Calum Hunter                                                             #
# Date:		11/11/2014                                                               #
# Version:	0.2                                                                      #
# Purpose:	Script to clean up an AutoCasperNBI for use with DEC Strapper.            #
#			                                                                         #
#                                                                                    #
######################################################################################

# Everyones favourite buddy
plistbuddy="/usr/libexec/PlistBuddy"

main(){
	show_description
	get_program_paths
	check_for_ds
	fix_NBImageInfo
	enforce_SMB1
	remove_casper_imaging_startup
	kill_finder
	remove_apps
	remove_widgets
	remove_system_library_files
	remove_menu_extras
	remove_dodgy_frameworks
	remove_unneccesary_Agents_Daemons	
	install_additional_packages
	convert_to_sparse
}

remove_unneccesary_Agents_Daemons(){
	echo "*** Removing unneeded LaunchAgents"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.AddressBook.abd.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.AddressBook.AssistantService.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.AddressBook.SourceSync.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.AirPlayUIAgent.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.AirPortBaseStationAgent.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.bluetoothUIServer.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.CalendarAgent.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.CalendarAgentLauncher.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.Finder.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.findmymacmessenger.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.icbaccountsd.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.icloud.AOSNotificationAgent.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.icloud.AOSNotificationLoginAgent.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.ManagedClient.agent.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.ManagedClient.enrollagent.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.PCIESlotCheck.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.safaridavclient.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.SafariNotificationAgent.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.soagent.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.speech.feedbackservicesserver.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.speech.recognitionserver.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.speech.speechdatainstallerd.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.speech.speechsynthesisd.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.speech.synthesisserver.plist"
	rm -rf "${nbivol}/System/Library/LaunchAgents/com.apple.ubd.plist"
	echo "*** Removing unneeded LaunchDaemons"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.AirPlayXPCHelper.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.backupd-auto.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.backupd.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.bluetoothaudiod.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.cmio.AppleCameraAssistant.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.cmio.AVCAssistant.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.cmio.IIDCVideoAssistant.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.cmio.VDCAssistant.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.dvdplayback.setregion.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.findmymac.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.findmymacmessenger.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.iCloudStats.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.ManagedClient.cloudconfigurationd.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.ManagedClient.enroll.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.ManagedClient.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.ManagedClient.startup"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.mbicloudsetupd.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.mdmclient.daemon.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.PCIELaneConfigTool.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.periodic-daily.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.periodic-monthly.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.periodic-weekly.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.postgres.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.printtool.daemon"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.racoon.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.remotepairtool.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.systemstats.analysis.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.systemstats.daily.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/com.apple.systemstatsd.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/org.cups.cups-lpd.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/org.cups.cupsd.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/org.postfix.master.plist"
	rm -rf "${nbivol}/System/Library/LaunchDaemons/telnet.plist"
}

remove_dodgy_frameworks(){
	echo "*** Removing buggy frameworks"
	rm -rf "${nbivol}/System/Library/PrivateFrameworks/ShareKit.framework"
	echo "*** Removing ShareKit (Note: Removing this prevents Console.app from launching)"
	echo "*** Removing Console.app - as its not going to work anyway"
	rm -rf "${nbivol}/Applications/Utilities/Console.app"
}

show_description(){
	echo "*** Post Processor for AutoCasperNBI to create NBI for DEC ***"
	echo ""
	echo "*** This script will add the extra files and applications to a NBI for use in the DEC environment"
	echo ""
}

enforce_SMB1(){
	echo "*** Enforcing SMB1 connections"
	echo "[default]" >> "${nbivol}/etc/nsmb.conf" 
	echo "smb_neg=smb1_only" >> "${nbivol}/etc/nsmb.conf"
}

get_program_paths(){
	echo "*** We need some paths first"
	echo " "
	echo "Please provide the path to the NetBoot.dmg file inside the .nbi folder"
	read nb_dmg
	echo ""
	echo "Your NetBoot.dmg path is $nb_dmg"
	echo ""
	echo "Now mounting your DMG"
	echo ""
	nbivol=`hdiutil attach $nb_dmg | grep "/Volumes" | awk '{print $3}'`
	echo "DMG mounted at $nbivol"
	echo ""
	echo "Please provide the path to the NBImageInfo.plist"
	read nbimageinfo
	echo ""	
	echo "Path to NBImage info is $nbimageinfo"
	echo ""
	echo ""
	echo "Please provide the path to the folder containing additional PKG's that need to be installed"
	read pkg_location
	echo ""
	echo "Found the following Packages:"
	pkgs_to_install=`ls $pkg_location`
	echo $pkgs_to_install
	echo ""
	echo "Running Cleanup...."
	echo ""
}

install_additional_packages(){
	echo "*** Installing additional packages from $pkg_location"
	for package in $pkgs_to_install
	do
		installer -dumplog -verbose -pkg "$pkg_location/$package" -target $nbivol
	done
}

convert_to_sparse(){
	echo "*** Please unmount $nbivol ****"
	echo "*** When unmounted hit y to continue"
	read unmount
	sleep 2
	echo "*** Converting to sparse image"
	hdiutil convert -format UDSP $nb_dmg -o $nb_dmg.sparseimage
	echo "*** Moving old DMG"
	mv $nb_dmg $nb_dmg.old
}

fix_NBImageInfo(){
	echo "*** Converting $nbimageinfo to XML from BINARY"
	plutil -convert xml1 $nbimageinfo
	echo "*** Removing incorrect disabled systems from $nbimageinfo"
	$plistbuddy -c "delete :DisabledSystemIdentifiers" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers array" $nbimageinfo
	echo "*** Adding list of unsupported MacBookPro systems to $nbimageinfo"
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacBookPro3,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacBookPro2,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacBookPro1,2" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacBookPro1,1" $nbimageinfo
	echo "*** Adding list of unsupported MacBook systems to $nbimageinfo"
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacBook5,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacBook4,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacBook3,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacBook2,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacBook1,1" $nbimageinfo
	echo "*** Adding list of unsupported MacBookAir systems to $nbimageinfo"
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacBookAir1,1" $nbimageinfo
	echo "*** Adding list of unsupported Macmini systems to $nbimageinfo"
	$plistbuddy -c "add :DisabledSystemIdentifiers: string Macmini3,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string Macmini2,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string Macmini1,1" $nbimageinfo
	echo "*** Adding list of unsupported iMac systems to $nbimageinfo"
	$plistbuddy -c "add :DisabledSystemIdentifiers: string iMac7,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string iMac6,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string iMac5,2" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string iMac5,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string iMac4,2" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string iMac4,1" $nbimageinfo
	echo "*** Adding list of unsupported MacPro systems to $nbimageinfo"
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacPro3,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacPro3,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacPro2,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string MacPro1,1" $nbimageinfo
	echo "*** Adding list of unsupported Xserve systems to $nbimageinfo"
	$plistbuddy -c "add :DisabledSystemIdentifiers: string Xserve3,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string Xserve2,1" $nbimageinfo
	$plistbuddy -c "add :DisabledSystemIdentifiers: string Xserve1,1" $nbimageinfo
}

remove_menu_extras(){
	echo "*** Removing Menu Extras"
	rm -rf "${nbivol}/System/Library/CoreServices/Menu Extras/Bluetooth.menu"
	rm -rf "${nbivol}/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
}

remove_apps(){
	echo "*** Removing undeeded extra apps"
	rm -rf "${nbivol}/Applications/Casper\ Imaging.app"
	rm -rf "${nbivol}/Applications/Launchpad.app"
	rm -rf "${nbivol}/Applications/Utilities/Activity\ Monitor.app"
	rm -rf "${nbivol}/Applications/Utilities/Grab.app"
}

remove_casper_imaging_startup(){
	echo "*** Removing LaunchAgent for Casper Imaging startup"
	rm $nbivol/Library/LaunchAgents/com.AutoCasperNBI.CasperImaging.plist
}

check_for_ds(){
	if [ ! -d "${nbivol}/Applications/Utilities/DeployStudio Admin.app" ]; then
		echo "**********************************************************************************"
		echo "*** WARNING!!! DeployStudio Server does not appear to be installed on the NBI! ***"
		echo " "
		echo "*** Please install the latest version of DeployStudio on the NBI!"
		echo "*** Once your finished installing make sure to UNMOUNT the DMG and re-run this script ***"
		exit 0
	fi
}

kill_finder(){
	echo "*** Moving Finder to old.Finder.backup to prevent nasties "
	mv $nbivol/System/Library/CoreServices/Finder.app $nbivol/System/Library/CoreServices/old.Finder.app
}

remove_system_library_files(){
	echo "*** Removing unneeded files from system library"
	rm -rf $nbivol/System/Library/CoreServices/Setup\ Assistant.app
	rm -rf $nbivol/System/Library/CoreServices/Certificate\ Assistant.app
	rm -rf $nbivol/System/Library/CoreServices/Network\ Setup\ Assistant.app
	rm -rf $nbivol/System/Library/CoreServices/ManagedClient.app
	rm -rf $nbivol/System/Library/CoreServices/Network\ Diagnostics.app
	rm -rf $nbivol/System/Library/CoreServices/Install\ Command\ Line\ Developer\ Tools.app
	rm -rf $nbivol/System/Library/CoreServices/AddPrinter.app
}

remove_widgets(){
	echo "*** Removing Widgets and extras"
	rm -rf $nbivol/Library/QuickLook
	rm -rf $nbivol/Library/Widgets/*
	rm -rf $nbivol/Library/Spotlight/*
	rm -rf $nbivol/Library/Image\ Capture
	rm -rf $nbivol/Library/Messages/*
}


# Run the functions defined inside the main function
main 

exit 0




