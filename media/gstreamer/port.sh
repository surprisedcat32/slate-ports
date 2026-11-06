#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.28.8.tar.xz
tar -xf gstreamer-1.28.8.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
meson setup build --prefix=/usr \
    -Dtests=disabled -Dexamples=disabled -Dbenchmarks=disabled
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
