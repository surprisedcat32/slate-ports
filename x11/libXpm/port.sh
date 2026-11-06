#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libXpm"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXpm-3.5.20.tar.xz
tar -xf libXpm-3.5.20.tar.xz
cd libXpm-3.5.20

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
