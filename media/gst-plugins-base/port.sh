#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.28.8.tar.xz
tar -xf gst-plugins-base-1.28.8.tar.xz
cd "$(tar -tf gst-plugins-base-1.28.8.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
meson setup build --prefix=/usr \
    -Dtests=disabled -Dexamples=disabled \
    -Dgtk_doc=disabled -Dintrospection=disabled
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
