#!/bin/bash

## Xcite Logic Managed Services Weekly Maintainance Script
## Calum Hunter 
## 15/9/2011

## Which Client are we? Calling the Info field 1 from ARD

compname=`/usr/bin/defaults read /Library/Preferences/com.apple.RemoteDesktop "Text1"`

echo " ### Running report for $compname ### "
date '+%d %B %Y'
echo " "
echo " "
echo " ### Hostname ### "
hostname
echo " "
echo " "
echo " ### Software Version Information ### "
sw_vers
echo " "
echo " "
echo " ### How old is this Mac? ### "
## format for build date information in info field two of ARD is MM.YYYY so 09.2010 means system 
## was built September 2010
month=`/usr/bin/defaults read /Library/Preferences/com.apple.RemoteDesktop "Text2" | cut -f1 -d'.'`
year=`/usr/bin/defaults read /Library/Preferences/com.apple.RemoteDesktop "Text2" | cut -f2 -d'.'`
yearnow=$(date '+%Y')
monthnow=$(date '+%m')
agey=$(($yearnow-$year))
agem=`expr $monthnow - $month`
if [ $agem -lt 0 ] ; then
   agem=$(($monthnow-$month+12))
else
   agem=`expr $monthnow - $month`
fi
echo "This Mac is $agey years and $agem months old!"

echo " "
echo " "
echo " ### Showing System Uptime ### "
uptime
echo " "
echo " "
## Disk Space ##

echo " ### Showing Diskspace ### "

df -lh

## RAID Status ##

# Use diskutil and raidutil incase we have a software raid or a hardware raid

echo " "
echo " "
echo " ### Showing Software RAID Status ### "

## 10.6 introduced a new syntax for checking software raid with diskutil 
## so determine what os we are on first

os=`sw_vers | grep 'ProductVersion:' | cut -d. -f2`

if [ $os -lt 6 ]; then

## command for 10.4 & 10.5
/usr/sbin/diskutil checkraid

else 

## command for 10.6
/usr/sbin/diskutil appleraid list

fi

echo " "
echo " "
echo " ### Showing HARDWARE RAID Status ### "

## command for hardware card
/usr/sbin/raidutil list status

echo " "
echo " "
echo " ### Showing RAM Status ### "

## command to get the pageins
Pageins=`/usr/bin/vm_stat | grep Pageins | awk '{print$2}' | cut -f1 -d'.'`

## command to get pageouts
Pageouts=`/usr/bin/vm_stat | grep Pageouts | awk '{print$2}' | cut -f1 -d'.'`


## Command to express the pageouts compared to pageins as a percentage

memstats=`echo "scale=4; ($Pageouts/$Pageins)*100" | bc`

echo " Pageouts are $memstats %, If more than 10% this machine needs more RAM"


echo " "
echo " "
echo " ### Showing Software updates available ### "
softwareupdate -l

echo " "
echo " "
echo " ### Repairing Disk Permissions ### "

diskutil repairPermissions /

exit 0