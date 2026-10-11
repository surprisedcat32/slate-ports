#!/bin/bash
#!!!!!!!!!!!!!!!! Experimental
set -e

cd /usr/ports/system/linux-firmware

if [ ! -d linux-firmware/.git ]; then
    git clone --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git linux-firmware
else
    git -C linux-firmware pull --ff-only
fi

cd linux-firmware

mkdir -p /usr/lib/firmware

cp -a . /usr/lib/firmware/

rm -rf /usr/lib/firmware/.git
rm -f /usr/lib/firmware/.gitignore
rm -f /usr/lib/firmware/.gitattributes
rm -f /usr/lib/firmware/README
rm -f /usr/lib/firmware/WHENCE

echo "Linux firmware installed successfully."
