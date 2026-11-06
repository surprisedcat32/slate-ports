#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/x11/menu-cache"

curl -LO https://downloads.sourceforge.net/lxde/menu-cache-1.1.0.tar.xz
tar -xf menu-cache-1.1.0.tar.xz
cd menu-cache-1.1.0

./configure --prefix=/usr --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
