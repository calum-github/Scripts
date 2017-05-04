#!/bin/bash


adobe_cc_2017(){
makepkginfo \
-f /Applications/Adobe\ Acrobat\ DC/Adobe\ Acrobat.app \
-f /Applications/Adobe\ After\ Effects\ CC\ 2017/Adobe\ After\ Effects\ CC\ 2017.app \
-f /Applications/Adobe\ Animate\ CC\ 2017/Adobe\ Animate\ CC\ 2017.app \
-f /Applications/Adobe\ Audition\ CC\ 2017/Adobe\ Audition\ CC\ 2017.app \
-f /Applications/Adobe\ Bridge\ CC\ 2017/Adobe\ Bridge\ CC\ 2017.app \
-f /Applications/Adobe\ Dreamweaver\ CC\ 2017/Adobe\ Dreamweaver\ CC\ 2017.app \
-f /Applications/Adobe\ Extension\ Manager\ CC/Adobe\ Extension\ Manager\ CC.app \
-f /Applications/Adobe\ Illustrator\ CC\ 2017/Adobe\ Illustrator.app \
-f /Applications/Adobe\ InCopy\ CC\ 2017/Adobe\ InCopy\ CC\ 2017.app \
-f /Applications/Adobe\ InDesign\ CC\ 2017/Adobe\ InDesign\ CC\ 2017.app \
-f /Applications/Adobe\ Lightroom/Adobe\ Lightroom.app \
-f /Applications/Adobe\ Media\ Encoder\ CC\ 2017/Adobe\ Media\ Encoder\ CC\ 2017.app \
-f /Applications/Adobe\ Muse\ CC\ 2017/Adobe\ Muse\ CC\ 2017.app \
-f /Applications/Adobe\ Photoshop\ CC\ 2017/Adobe\ Photoshop\ CC\ 2017.app \
-f /Applications/Adobe\ Prelude\ CC\ 2017/Adobe\ Prelude\ CC\ 2017.app \
-f /Applications/Adobe\ Premiere\ Pro\ CC\ 2017/Adobe\ Premiere\ Pro\ CC\ 2017.app \
-f /Applications/Adobe\ SpeedGrade\ CC\ 2015/Adobe\ SpeedGrade\ CC\ 2015.app \
-f /Applications/Adobe\ Scout\ CC.app \
> Adobe_CC_2017.xml
}


updates2015(){
makepkginfo \
-f /Applications/Adobe\ After\ Effects\ CC\ 2015/Adobe\ After\ Effects\ CC\ 2015.app \
-f /Applications/Adobe\ Bridge\ CC/Adobe\ Bridge\ CC.app \
-f /Applications/Adobe\ Character\ Animator\ \(Preview\)/Adobe\ Character\ Animator\ \(Preview\).app \
-f /Applications/Adobe\ Dreamweaver\ CC\ 2015/Adobe\ Dreamweaver\ CC\ 2015.app \
-f /Applications/Adobe\ Extension\ Manager\ CC/Adobe\ Extension\ Manager\ CC.app \
-f /Applications/Adobe\ Extension\ Manager\ CS6/Adobe\ Extension\ Manager\ CS6.app \
-f /Applications/Adobe\ Fireworks\ CS6/Adobe\ Fireworks\ CS6.app \
-f /Applications/Adobe\ Flash\ CC\ 2015/Adobe\ Flash\ CC\ 2015.app \
-f /Applications/Adobe\ Illustrator\ CC\ 2015/Adobe\ Illustrator.app \
-f /Applications/Adobe\ Media\ Encoder\ CC\ 2015/Adobe\ Media\ Encoder\ CC\ 2015.app \
-f /Applications/Adobe\ Photoshop\ CC\ 2015/Adobe\ Photoshop\ CC\ 2015.app \
-f /Applications/Adobe\ Premiere\ Pro\ CC\ 2015/Adobe\ Premiere\ Pro\ CC\ 2015.app \
-f /Applications/Adobe\ SpeedGrade\ CC\ 2015/Adobe\ SpeedGrade\ CC\ 2015.app \
> Adobe_Updates_2015.xml
}

adobe_cc_2015(){
makepkginfo \
-f /Applications/Adobe\ Acrobat\ DC/Adobe\ Acrobat.app \
-f /Applications/Adobe\ After\ Effects\ CC\ 2015/Adobe\ After\ Effects\ CC\ 2015.app \
-f /Applications/Adobe\ Audition\ CC\ 2015/Adobe\ Audition\ CC\ 2015.app \
-f /Applications/Adobe\ Bridge\ CC/Adobe\ Bridge\ CC.app \
-f /Applications/Adobe\ Character\ Animator\ \(Preview\)/Adobe\ Character\ Animator\ \(Preview\).app \
-f /Applications/Adobe\ Dreamweaver\ CC\ 2015/Adobe\ Dreamweaver\ CC\ 2015.app \
-f /Applications/Adobe\ Edge\ Animate\ CC\ 2015/Adobe\ Edge\ Animate\ CC\ 2015.app \
-f /Applications/Adobe\ Extension\ Manager\ CC/Adobe\ Extension\ Manager\ CC.app \
-f /Applications/Adobe\ Extension\ Manager\ CS6/Adobe\ Extension\ Manager\ CS6.app \
-f /Applications/Adobe\ Fireworks\ CS6/Adobe\ Fireworks\ CS6.app \
-f /Applications/Adobe\ Flash\ Builder\ 4.7/Adobe\ Flash\ Builder\ 4.7.app \
-f /Applications/Adobe\ Flash\ CC\ 2015/Adobe\ Flash\ CC\ 2015.app \
-f /Applications/Adobe\ Illustrator\ CC\ 2015/Adobe\ Illustrator.app \
-f /Applications/Adobe\ InDesign\ CC\ 2015/Adobe\ InDesign\ CC\ 2015.app \
-f /Applications/Adobe\ Media\ Encoder\ CC\ 2015/Adobe\ Media\ Encoder\ CC\ 2015.app \
-f /Applications/Adobe\ Muse\ CC\ 2015/Adobe\ Muse\ CC\ 2015.app \
-f /Applications/Adobe\ Photoshop\ CC\ 2015/Adobe\ Photoshop\ CC\ 2015.app \
-f /Applications/Adobe\ Prelude\ CC\ 2015/Adobe\ Prelude\ CC\ 2015.app \
-f /Applications/Adobe\ Premiere\ Pro\ CC\ 2015/Adobe\ Premiere\ Pro\ CC\ 2015.app \
-f /Applications/Adobe\ SpeedGrade\ CC\ 2015/Adobe\ SpeedGrade\ CC\ 2015.app \
> Adobe_CC_2015.xml
}

adobe_cc_2014(){
echo "*** Making pkginfo for Adobe CC 2014 ***"
makepkginfo \
-f /Applications/Adobe\ Acrobat\ XI\ Pro/Adobe\ Acrobat\ Pro.app \
-f /Applications/Adobe\ After\ Effects\ CC\ 2014/Adobe\ After\ Effects\ CC\ 2014.app \
-f /Applications/Adobe\ Audition\ CC\ 2014/Adobe\ Audition\ CC\ 2014.app \
-f /Applications/Adobe\ Bridge\ CC/Adobe\ Bridge\ CC.app \
-f /Applications/Adobe\ Dreamweaver\ CC\ 2014.1/Adobe\ Dreamweaver\ CC\ 2014.1.app \
-f /Applications/Adobe\ Edge\ Animate\ CC\ 2014.1/Adobe\ Edge\ Animate\ CC\ 2014.1.app \
-f /Applications/Adobe\ ExtendScript\ Toolkit\ CC/ExtendScript\ Toolkit.app \
-f /Applications/Adobe\ Extension\ Manager\ CC/Adobe\ Extension\ Manager\ CC.app \
-f /Applications/Adobe\ Extension\ Manager\ CS6/Adobe\ Extension\ Manager\ CS6.app \
-f /Applications/Adobe\ Fireworks\ CS6/Adobe\ Fireworks\ CS6.app \
-f /Applications/Adobe\ Flash\ Builder\ 4.7/Adobe\ Flash\ Builder\ 4.7.app \
-f /Applications/Adobe\ Flash\ CC\ 2014/Adobe\ Flash\ CC\ 2014.app \
-f /Applications/Adobe\ Illustrator\ CC\ 2014/Adobe\ Illustrator.app \
-f /Applications/Adobe\ InDesign\ CC\ 2014/Adobe\ InDesign\ CC\ 2014.app \
-f /Applications/Adobe\ Media\ Encoder\ CC\ 2014/Adobe\ Media\ Encoder\ CC\ 2014.app \
-f /Applications/Adobe\ Muse\ CC\ 2014/Adobe\ Muse\ CC\ 2014.app \
-f /Applications/Adobe\ Photoshop\ CC\ 2014/Adobe\ Photoshop\ CC\ 2014.app \
-f /Applications/Adobe\ Prelude\ CC\ 2014/Adobe\ Prelude\ CC\ 2014.app \
-f /Applications/Adobe\ Premiere\ Pro\ CC\ 2014/Adobe\ Premiere\ Pro\ CC\ 2014.app \
-f /Applications/Adobe\ SpeedGrade\ CC\ 2014/Adobe\ SpeedGrade\ CC\ 2014.app \
> Adobe_CC_2014.xml
}





echo "=== Please Choose which version of Adobe CC you wish to create an installs array for ==="
echo ""
echo "=== Enter: 2017, 2015, 2014 or updates2015 (default is 2017)"
read version

case $version in 
    2017)
        echo "=== Using version 2017 ==="
        sleep 1
        echo "=== Making PKGinfo for 2017 ==="
        sleep 1
        adobe_cc_2017
        exit 0 ;;
    2015)
        echo "=== Using version 2015 ==="
        sleep 1
        echo "=== Making PKGInfo for 2015"
        sleep 1
        adobe_cc_2015
        exit 0 ;;
    updates2015)
        echo "=== Using 'updates 2015' ==="
        sleep 1
        echo "=== Making PKGinfo for Update Packages ==="
        sleep 1
        updates2015
        exit 0 ;;
    2014)
        echo "=== Using version 2014 ==="
        sleep 1
        echo "=== Making PKGinfo for 2014 ==="
        sleep 1
        adobe_cc_2014
        exit 0 ;;
    *)
        echo "=== Using version 2017 ==="
        sleep 1
        echo "=== Making PKGinfo for 2017 ==="
        sleep 1
        adobe_cc_2017
        exit 0 ;;
esac

exit 0
