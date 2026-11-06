#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/x11/dejavu-fonts"

curl -LO https://downloads.sourceforge.net/project/dejavu/dejavu/2.37/dejavu-fonts-ttf-2.37.tar.bz2
tar -xf dejavu-fonts-ttf-2.37.tar.bz2

mkdir -p ${DESTDIR:-}/usr/share/fonts/dejavu
find dejavu-fonts-ttf-2.37 -name '*.ttf' \
    -exec cp '{}' ${DESTDIR:-}/usr/share/fonts/dejavu/ \;

echo "DejaVu fonts installed."
