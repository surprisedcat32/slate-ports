#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/x11/libXdamage"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXdamage-1.2.1.tar.xz
tar -xf libXdamage-1.2.1.tar.xz
cd libXdamage-1.2.1

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
