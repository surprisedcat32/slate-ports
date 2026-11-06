#!/bin/sh
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig
cd "${PORT_DIR:-/usr/ports}/x11/libX11"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libX11-1.8.tar.xz
tar -xf libX11-1.8.tar.xz
cd libX11-1.8

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
