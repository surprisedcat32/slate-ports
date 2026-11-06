#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libSM"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libSM-1.2.6.tar.xz
tar -xf libSM-1.2.6.tar.xz
cd libSM-1.2.6

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
