#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/x11/libXres"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXres-1.2.3.tar.xz
tar -xf libXres-1.2.3.tar.xz
cd libXres-1.2.3

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
