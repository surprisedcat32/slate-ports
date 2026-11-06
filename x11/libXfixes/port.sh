#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libXfixes"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXfixes-6.0.2.tar.xz
tar -xf libXfixes-6.0.2.tar.xz
cd libXfixes-6.0.2

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
