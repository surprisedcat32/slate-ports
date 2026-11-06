#!/bin/sh
#!!!!!!!!!!!!!!!! Experimental
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

if [ ! -d linux-firmware/.git ]; then
    git clone --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git linux-firmware
else
    git -C linux-firmware pull --ff-only
fi

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

mkdir -p ${DESTDIR:-}/usr/lib/firmware

cp -a . ${DESTDIR:-}/usr/lib/firmware/

rm -rf ${DESTDIR:-}/usr/lib/firmware/.git
rm -f ${DESTDIR:-}/usr/lib/firmware/.gitignore
rm -f ${DESTDIR:-}/usr/lib/firmware/.gitattributes
rm -f ${DESTDIR:-}/usr/lib/firmware/README
rm -f ${DESTDIR:-}/usr/lib/firmware/WHENCE

echo "Linux firmware installed successfully."
