#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/xclock

git clone --depth 1 https://gitlab.freedesktop.org/xorg/app/xclock.git

cd xclock

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
