#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libXrender"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXrender-0.9.13.tar.xz
tar -xf libXrender-0.9.13.tar.xz
cd libXrender-0.9.13

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
