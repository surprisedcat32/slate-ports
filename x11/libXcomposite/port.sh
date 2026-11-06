#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/x11/libXcomposite"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXcomposite-0.4.7.tar.xz
tar -xf libXcomposite-0.4.7.tar.xz
cd libXcomposite-0.4.7

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
