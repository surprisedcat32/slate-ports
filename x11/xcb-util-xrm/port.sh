#!/bin/bash
set -e
cd /usr/ports/x11/xcb-util-xrm

git clone --depth 1 https://github.com/Airblader/xcb-util-xrm.git
cd xcb-util-xrm

./autogen.sh --prefix=/usr --disable-static

make -j"$(nproc)"
make DESTDIR="$DESTDIR" install
