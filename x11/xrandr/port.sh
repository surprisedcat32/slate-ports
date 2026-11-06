#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/xrandr"

curl -LO https://xorg.freedesktop.org/releases/individual/app/xrandr-1.5.4.tar.xz
tar -xf xrandr-1.5.4.tar.xz
cd xrandr-1.5.4

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
