#!/bin/bash
set -e
cd /usr/ports/media/gstreamer
curl -LO https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.28.8.tar.xz
tar -xf gstreamer-1.28.8.tar.xz
cd gstreamer-1.28.8
meson setup build --prefix=/usr \
    -Dtests=disabled -Dexamples=disabled -Dbenchmarks=disabled
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
