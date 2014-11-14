#!/bin/bash
#
# Sample usage:
#
#    sudo ./AutoDSNBI.sh osx_updated_140526-10.9.3-13D65.hfs.dmg 1093 DS10.9.3 ~/Downloads


###############################################################################
###                       Customize these variables                         ###
###############################################################################


# Protocol, NFS or HTTP.
declare -r PROTOCOL="NFS"
# Available languages:
#   default     Use the source system's settings.
#   en          English
#   de          German
#   fr          French
#   fr_CA       Canadian french
declare -r LANGUAGE="default"
# NTP server.
declare -r NTP_SERVER="time.euro.apple.com"


# Server URLs.
declare -r DS_SERVER_URL="https://ds.example.com:60443"
declare -r DS_SERVER_URL2="$DS_SERVER_URL"
# Uncomment to disable version mismatch alerts.
#declare -r DISABLE_VERSION_MISMATCH="-disableversionsmismatchalerts"


# User and password for runtime.
declare -r DS_LOGIN="deploystudio"
declare -r DS_PASSWORD=""
# User and password for ARD agent.
declare -r ARD_LOGIN="dsremote"
declare -r ARD_PASSWORD="dsremotepassword"
# Uncomment to display log window by default.
declare -r DISPLAY_LOG_WINDOW="-displaylogs"
# Time in seconds before reboot after workflow completion.
declare -r TIMEOUT="-timeout 30"
# Time before display goes to sleep, in minutes.
declare -r DISPLAYSLEEP="-displaysleep 10"


# Uncomment to enable python and ruby.
declare -r ENABLE_PYTHON="-enablepython"
#declare -r ENABLE_RUBY="-enableruby"
# Uncomment to customize network settings.
#declare -r ENABLE_CUSTOM_TCP="-enablecustomtcpstacksettings"
declare -r DISABLE_WIFI="-disablewirelesssupport"
declare -r SMB1ONLY="-smb1only"
# Custom title variables:
#   %v  OS version
#   %b  OS build
#   %d  Build date
declare -r CUSTOM_TITLE="DS %v (%b) %d"
# Path to background image (absolute path, or relative to source volume).
declare -r CUSTOM_BACKGROUND="System/Library/CoreServices/DefaultDesktop.jpg"


########################################################################


# Exit status constants.

declare -ri EX_OK=0
declare -ri EX_USAGE=64
declare -ri EX_DATAERR=65
declare -ri EX_NOINPUT=66
declare -ri EX_NOUSER=67
declare -ri EX_NOHOST=68
declare -ri EX_UNAVAILABLE=69
declare -ri EX_SOFTWARE=70
declare -ri EX_OSERR=71
declare -ri EX_OSFILE=72
declare -ri EX_CANTCREAT=73
declare -ri EX_IOERR=74
declare -ri EX_TEMPFAIL=75
declare -ri EX_PROTOCOL=76
declare -ri EX_NOPERM=77
declare -ri EX_CONFIG=78


# Cleanup.

eject_dmg() {
    local mountpath="$1"
    if [[ -d "$mountpath" ]]; then
        if ! hdiutil eject "$mountpath" >/dev/null; then
            for tries in {1..10}; do
                sleep $tries
                if hdiutil eject "$mountpath" -force; then
                    break
                fi
            done
        fi
    fi
}

declare -a dmgmounts
unmount_dmgs() {
    for mountpath in "${dmgmounts[@]}"; do
        eject_dmg "$mountpath"
    done
    unset dmgmounts
}

trap unmount_dmgs EXIT


# Arguments.

die() {
    echo "$2" 1>&2
    exit "$1"
}

if [[ $# -ne 4 ]]; then
    die $EX_USAGE "Usage: $(basename "$0") <source> <netboot id> <netboot name> <destination dir>"
fi
src="$1"
nb_id="$2"
nb_name="$3"
dest_dir="$4"

if [[ ! -d "$dest_dir" ]]; then
    die $EX_UNAVAILABLE "$dest_dir does not exist"
fi
if [[ ! -w "$dest_dir" ]]; then
    die $EX_CANTCREAT "$dest_dir is not writable"
fi
dest_nbi="$dest_dir/$nb_name.nbi"
if [[ -e "$dest_nbi" ]]; then
    die $EX_CANTCREAT "$dest_nbi already exists"
fi


# Requirements.

DSADMIN_PATH="/Applications/Utilities/DeployStudio Admin.app"
DSASST_PATH="$DSADMIN_PATH/Contents/Applications/DeployStudio Assistant.app"
SYS_BUILD_PATH="$DSASST_PATH/Contents/Resources/sysBuilder/sys_builder.sh"
if [[ ! -x "$SYS_BUILD_PATH" ]]; then
    die $EX_UNAVAILABLE "DeployStudio Assistant not found"
fi
EXPECTED_USAGE="Usage: sys_builder.sh -basesystem <source volume> -type local -volume <volume name> [-erasedisk][-loc <language>][-serverurl <server url>][-serverurl2 <server url 2>][-disableversionsmismatchalerts][-login <login>][-password <password>][-ardlogin <login>][-ardpassword <password>][-displaylogs][-timeout =<duration in seconds>][-displaysleep <duration in minutes>][-enableruby][-enablepython][-enablecustomtcpstacksettings][-disablewirelesssupport][-ntp <network time server>][-customtitle <Runtime mainwindow title>][-custombackground <Runtime custom background image path>][-smb1only]"
usage=$("$SYS_BUILD_PATH" | grep Usage:)
if [[ "$usage" != "$EXPECTED_USAGE" ]]; then
    die $EX_SOFTWARE "Unexpected usage for sys_builder.sh"
fi

if [[ $(id -u) -ne 0 ]]; then
    die $EX_NOPERM "$(basename "$0") must run as root"
fi


# Source.

if [[ -f "$src" ]]; then
    src_vol=$(hdiutil attach -nobrowse -noautoopen -noverify -owners on "$src" | grep Apple_HFS | cut -f3)
    dmgmounts+=("$src_vol")
else
    src_vol="$src"
fi

ver_plist="$src_vol/System/Library/CoreServices/SystemVersion.plist"
if [[ ! -f "$ver_plist" ]]; then
    die $EX_DATAERR "$src doesn't look like a valid system volume or OS image"
fi

src_name=$(   /usr/libexec/PlistBuddy -c "print :ProductName"         "$ver_plist")
src_version=$(/usr/libexec/PlistBuddy -c "print :ProductVersion"      "$ver_plist")
src_build=$(  /usr/libexec/PlistBuddy -c "print :ProductBuildVersion" "$ver_plist")
echo "Using $src_name $src_version ($src_build) as the source"


# Expand variables in title.

title="$CUSTOM_TITLE"
title="${title/\%v/$src_version}"
title="${title/\%b/$src_build}"
title="${title/\%d/$(date "+%y%m%d")}"


# Copy background image.
BKG_PATH="/tmp/_$(uuidgen)_background.jpg"
(
    cd "$src_vol"
    cp "$CUSTOM_BACKGROUND" "$BKG_PATH"
)

# Build nbi.

"$SYS_BUILD_PATH" \
    -basesystem "$src_vol" \
    -type netboot \
    -id "$nb_id" \
    -name "$nb_name" \
    -dest "$dest_dir" \
    -protocol "$PROTOCOL" \
    -loc "$LANGUAGE" \
    -serverurl "$DS_SERVER_URL" \
    -serverurl2 "$DS_SERVER_URL2" \
    $DISABLE_VERSION_MISMATCH \
    -login "$DS_LOGIN" \
    -password "$DS_PASSWORD" \
    -ardlogin "$ARD_LOGIN" \
    -ardpassword "$ARD_PASSWORD" \
    $DISPLAY_LOG_WINDOW \
    $TIMEOUT \
    $DISPLAYSLEEP \
    $ENABLE_PYTHON \
    $ENABLE_RUBY \
    $ENABLE_CUSTOM_TCP \
    $DISABLE_WIFI \
    -ntp "$NTP_SERVER" \
    -customtitle "$title" \
    -custombackground "$BKG_PATH" \
    $SMB1ONLY
retval=$?
rm -f "$BKG_PATH"

exit $retval