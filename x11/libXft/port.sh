#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libXft"

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXft.git

cd libXft
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
