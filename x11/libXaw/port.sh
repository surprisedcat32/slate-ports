#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libXaw"

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXaw.git

cd libXaw

./autogen.sh

./configure 
    --prefix=/usr/local 
    --enable-shared 
    --enable-static

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
