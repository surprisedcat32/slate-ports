#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/x11/tabbed

curl -LO https://dl.suckless.org/tools/tabbed-0.8.tar.gz
tar -xf tabbed-0.8.tar.gz
cd tabbed-0.8

make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
