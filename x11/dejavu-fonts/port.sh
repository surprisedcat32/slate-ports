#!/bin/sh
set -e

cd /usr/ports/x11/dejavu-fonts

curl -LO https://downloads.sourceforge.net/project/dejavu/dejavu/2.37/dejavu-fonts-ttf-2.37.tar.bz2
tar -xf dejavu-fonts-ttf-2.37.tar.bz2

mkdir -p /usr/share/fonts/dejavu
find dejavu-fonts-ttf-2.37 -name '*.ttf' \
    -exec cp '{}' /usr/share/fonts/dejavu/ \;

echo "DejaVu fonts installed."
