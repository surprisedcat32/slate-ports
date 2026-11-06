#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/lib/libmd"

curl -LO https://libbsd.freedesktop.org/releases/libmd-1.1.0.tar.xz
tar -xf libmd-1.1.0.tar.xz
cd libmd-1.1.0

./configure \
    --prefix=/usr \
    --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
