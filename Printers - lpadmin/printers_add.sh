#!/bin/bash

## Add Printers Script

PrinterServer="10.85.122.62"

Printer1="M12_Printer"
Printer1PPD="/Library/Printers/PPDs/Contents/Resources/en.lproj/Kyocera FS-2000D.PPD"

Printer2="M12_Colour"
Printer2PPD="/Library/Printers/PPDs/Contents/Resources/en.lproj/Kyocera FS-C5015N.PPD"


Printer3="M11_Printer"
Printer3PPD="/Library/Printers/PPDs/Contents/Resources/en.lproj/Kyocera FS-2000D.PPD"


Printer4="M5_Printer"
Printer4PPD="/Library/Printers/PPDs/Contents/Resources/en.lproj/Kyocera FS-2000D.PPD"


Printer5="M14_Printer"
Printer5PPD="/Library/Printers/PPDs/Contents/Resources/en.lproj/Kyocera FS-2000D.PPD"


echo " adding printer 1 ...."
lpadmin -p $Printer1 -L "M12" -E -v lpd://$PrinterServer/$Printer1 -P "$Printer1PPD"


echo " adding printer 2 ...."
lpadmin -p $Printer2 -L "M12" -E -v lpd://$PrinterServer/$Printer2 -P "$Printer2PPD"


echo " adding printer 3 ...."
lpadmin -p $Printer3 -L "M11" -E -v lpd://$PrinterServer/$Printer3 -P "$Printer3PPD"


echo " adding printer 4 ...."
lpadmin -p $Printer4 -L "M5" -E -v lpd://$PrinterServer/$Printer4 -P "$Printer4PPD"


echo " adding printer 5 ...."
lpadmin -p $Printer5 -L "M14" -E -v lpd://$PrinterServer/$Printer5 -P "$Printer5PPD"




