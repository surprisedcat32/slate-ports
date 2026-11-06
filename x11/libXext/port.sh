#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libXext"

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXext.git

cd libXext

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
