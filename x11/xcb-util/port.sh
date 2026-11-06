#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/x11/xcb-util"

curl -LO https://xcb.freedesktop.org/dist/xcb-util-0.4.1.tar.xz
tar -xf xcb-util-0.4.1.tar.xz
cd xcb-util-0.4.1

./configure --prefix=/usr --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
