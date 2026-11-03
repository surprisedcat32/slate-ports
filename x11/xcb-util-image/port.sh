#!/bin/bash
set -e
cd /usr/ports/x11/xcb-util-image

curl -LO https://xcb.freedesktop.org/dist/xcb-util-image-0.4.1.tar.xz
tar -xf xcb-util-image-0.4.1.tar.xz
cd xcb-util-image-0.4.1

./configure --prefix=/usr --disable-static

make -j"$(nproc)"
make DESTDIR="$DESTDIR" install
