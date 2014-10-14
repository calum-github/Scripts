#!/bin/sh
 
#
#Modifies Office 2011 SP3 installer to make it instaDMG ready. Expects $1 with the iso
#http://blog-nbalonso.rhcloud.com
#
#
 
TMPDIR='/tmp/buildoffice'
 
if [ "$1" == "" ]; then
    echo "Usage:
    ./buildoffice.sh [path to iso file]\n"
    exit -1
fi
 
echo "INFO: Starting"
 
##
if [ "`md5 ${1} | awk '{ print $NF }' `" == "2acc0fadb6050e15aacd51958be24571" ]; then
    echo "INFO: The iso provided matches the 14.3.0 volume installer"
else
    echo "ERROR: the iso does not match the 14.3.0 volume installer"
    exit -1
fi
##
 
##
echo "INFO: Silently mounting the iso"
hdiutil attach ${1} -quiet -nobrowse
##
 
##
echo "INFO: Expanding the pkg"
pkgutil --expand '/Volumes/Microsoft Office 2011/Office Installer.pkg' /tmp/buildoffice/
##
 
##
echo "INFO: Unmounting the iso"
hdiutil detach '/Volumes/Microsoft Office 2011/' -quiet
##
 
##
echo "INFO: Fixing things..."
find /tmp/buildoffice/ -name PackageInfo -print0 | xargs -0 chmod +x
 
echo '#!/bin/sh
#MS code commented below
#launchctl unload -w /Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist
HELPERPLIST="$3/Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist"
if [ "$3" == "/" ]; then
    #installing on the startup disk // running OSX
    launchctl unload -w $HELPERPLIST
fi
exit 0' > ${TMPDIR}/Office2011_all_licensing_14.3.0.pkg/Scripts/preinstall
 
echo '#!/bin/sh
chown root:wheel "$3/Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist"
chmod 644 "$3/Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist"
chown root:wheel "$3/Library/PrivilegedHelperTools/com.microsoft.office.licensing.helper"
chmod 755 "$3/Library/PrivilegedHelperTools/com.microsoft.office.licensing.helper"
if [ "$3" == "/" ]; then
    #installing on the startup disk // running OSX
    launchctl load -w "$3/Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist"
fi
exit 0' > ${TMPDIR}/Office2011_all_licensing_14.3.0.pkg/Scripts/postinstall
 
echo '#!/bin/sh
exit 0' > ${TMPDIR}/Office2011_all_quit_14.3.0.pkg/Scripts/preinstall
 
echo '#!/bin/bash
RESOURCES_DIRECTORY=`/usr/bin/dirname "$0"`
SET_ICON_FILE_PATH="${RESOURCES_DIRECTORY}/fix_custom_icon"
INSTALLATION_FOLDER="$3/Applications/Microsoft Office 2011/"
"$SET_ICON_FILE_PATH" "$INSTALLATION_FOLDER"
exit 0' > ${TMPDIR}/Office2011_en_required_14.3.0.pkg/Scripts/postinstall
##
 
##
echo "INFO: Compressing the new installer"
pkgutil --flatten ${TMPDIR} ~/Desktop/My_Office_2011_SP3_installer.pkg
##
 
##Clean the house
echo "INFO: Deleting the temporary folder"
rm -rf ${TMPDIR}

##
 
echo "SUCCESS"
exit 0