#!/bin/sh
## postinstall

pathToScript=$0
pathToPackage=$1
targetLocation=$2
targetVolume=$3

extract () {
rm -rf "/private/tmp/AdobeAcrobatXIPro.pkg"
unzip -o "/private/tmp/AdobeAcrobatXIPro.pkg.zip" -d "/private/tmp"
rm -rf "/private/tmp/AcrobatUpd11019.pkg"
unzip -o "/private/tmp/AcrobatUpd11019.pkg.zip" -d "/private/tmp"
rm "/private/tmp/AdobeAcrobatXIPro.pkg.zip"
rm "/private/tmp/AcrobatUpd11019.pkg.zip"
}

installAcrobat () {
/usr/sbin/installer -pkg "/private/tmp/AdobeAcrobatXIPro.pkg" -target /
if (test $? = 0) then
echo "Acrobat XI installed."
rm -rf "/private/tmp/AdobeAcrobatXIPro.pkg"
else
echo "ERROR: Acrobat XI installation failed."
rm -rf "/private/tmp/AdobeAcrobatXIPro.pkg"
exit 1
fi
}

installAcrobatUpdates () {
/usr/sbin/installer -pkg "/private/tmp/AcrobatUpd11019.pkg" -target /
if (test $? = 0) then
echo "Acrobat 11.0.19 installed."
rm -rf "/private/tmp/AcrobatUpd11019.pkg"
else
echo "ERROR: Acrobat 11.0.19 installation failed."
rm -rf "/private/tmp/AcrobatUpd11019.pkg"
exit 1
fi
}

extract
installAcrobat
installAcrobatUpdates


exit 0		## Success
exit 1		## Failure
