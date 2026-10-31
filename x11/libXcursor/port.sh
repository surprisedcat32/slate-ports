#!/bin/bash

cd /usr/ports/x11/libXcursor

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXcursor-1.2.3.tar.xz
tar -xf libXcursor-1.2.3.tar.gz
cd libXcursor-1.2.3

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
