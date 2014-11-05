#!/bin/bash

###################################################################################      
#                                                                                 #
# Author:  Calum Hunter                                                           #
# Date:    21-10-2014                                                             #
# Vesion:  0.1                                                                    #
# Purpose: This script removes the all quit apps pre-install script               #
#          From the Office 2011 Updates as this normally causes a hang            #
#          when deployed as unattended install in some management tools.          #
#                                                                                 #
#                                                                                 #
###################################################################################


# Quick check to ensure you are providing an argument
if [ $# -eq 0 ]
	then
		echo ""
		echo "** Warning **"
		echo "You must supply the location of the office update"
		echo ""
		echo "Useage: ./OfficeUpdate_fixer.sh /path/to/office/update.pkg"
		echo ""
		exit 0
fi

# Location to store our expanded update package
tmpbuild=/tmp/office_update_build

# Expand our update into our temp build folder
echo "Expanding Office Update Package into build folder: $tmpbuild"
pkgutil --expand "${1}" $tmpbuild
echo "Expansion Complete!"

# Get the version of our update
vers=`cat $tmpbuild/Distribution | grep "<title>Office 2011" | awk '{print $3}'`
echo "Running all_quit preinstall script fix for Office 2011 Update Version: $vers"

# Fix up the problem with the all quit preinstall script
echo -e "#!/bin/bash\n\nexit 0" > $tmpbuild/Office2011_all_quit_$vers.combo.pkg/Scripts/preinstall 
echo "Fix completed"
echo "Flattening Office Update package"
echo "Saving to ~/Desktop"

pkgutil --flatten $tmpbuild ~/Desktop/Office2011_Update_"${vers}"_fixed.pkg

echo "Removing temp build folder"

rm -rf $tmpbuild

exit 0