#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/xorg-macros"

curl -LO https://xorg.freedesktop.org/releases/individual/util/util-macros-1.20.2.tar.xz
tar -xf util-macros-1.20.2.tar.xz
cd util-macros-1.20.2

./autogen.sh --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
