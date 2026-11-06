#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/x11/lxterminal

curl -LO https://downloads.sourceforge.net/lxde/lxterminal-0.4.1.tar.xz
tar -xf lxterminal-0.4.1.tar.xz
cd lxterminal-0.4.1

./configure --prefix=/usr --sysconfdir=/etc --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
