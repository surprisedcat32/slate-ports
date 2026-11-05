#!/bin/bash
set -e
cd /usr/ports/x11/xcb-util-renderutil

curl -LO https://xcb.freedesktop.org/dist/xcb-util-renderutil-0.3.10.tar.xz
tar -xf xcb-util-renderutil-0.3.10.tar.xz
cd xcb-util-renderutil-0.3.10

./configure --prefix=/usr --disable-static

make
make DESTDIR="$DESTDIR" install
