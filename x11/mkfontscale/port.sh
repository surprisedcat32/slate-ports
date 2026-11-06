#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/x11/mkfontscale"
curl -LO https://xorg.freedesktop.org/releases/individual/app/mkfontscale-1.2.4.tar.xz
tar -xf mkfontscale-1.2.4.tar.xz
cd mkfontscale-1.2.4

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
