#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/x11/xauth"
curl -LO https://xorg.freedesktop.org/releases/individual/app/xauth-1.1.tar.gz
tar -xf xauth-1.1.tar.gz
cd xauth-1.1
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
