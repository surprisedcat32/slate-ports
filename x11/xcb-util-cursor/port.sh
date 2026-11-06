#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/x11/xcb-util-cursor"

curl -LO https://xcb.freedesktop.org/dist/xcb-util-cursor-0.1.5.tar.xz
tar -xf xcb-util-cursor-0.1.5.tar.xz
cd xcb-util-cursor-0.1.5

./configure --prefix=/usr --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
