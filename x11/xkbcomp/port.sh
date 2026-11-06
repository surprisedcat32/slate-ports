#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/xkbcomp"

curl -LO https://xorg.freedesktop.org/releases/individual/app/xkbcomp-1.5.0.tar.xz
tar -xf xkbcomp-1.5.0.tar.xz
cd xkbcomp-1.5.0

./autogen.sh
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
