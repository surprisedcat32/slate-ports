#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libXinerama"
curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXinerama-1.1.6.tar.xz
tar -xf libXinerama-1.1.6.tar.xz
cd libXinerama-1.1.6

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
