#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/x11/xcb-util-xrm"
curl -LO https://github.com/Airblader/xcb-util-xrm/releases/download/v1.3/xcb-util-xrm-1.3.tar.bz2
tar -xf xcb-util-xrm-1.3.tar.bz2
cd xcb-util-xrm-1.3

./configure --prefix=/usr --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
