#!/bin/bash
set -e
cd /usr/ports/x11/xcb-util

curl -LO https://xcb.freedesktop.org/dist/xcb-util-0.4.1.tar.xz
tar -xf xcb-util-0.4.1.tar.xz
cd xcb-util-0.4.1

./configure --prefix=/usr --disable-static

make -j"$(nproc)"
make DESTDIR="$DESTDIR" install
