#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libXt"

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXt.git

cd libXt

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
