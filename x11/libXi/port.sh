#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libXi"
curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXi-1.8.4.tar.xz
tar -xf libXi-1.8.4.tar.xz
cd libXi-1.8.4

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
