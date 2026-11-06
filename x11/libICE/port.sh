#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libICE"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libICE-1.1.2.tar.xz
tar -xf libICE-1.1.2.tar.xz
cd libICE-1.1.2

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
