#!/bin/bash
set -e
cd /usr/ports/media/gst-plugins-base
curl -LO https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.28.8.tar.xz
tar -xf gst-plugins-base-1.28.8.tar.xz
cd gst-plugins-base-1.28.8
meson setup build --prefix=/usr \
    -Dtests=disabled -Dexamples=disabled \
    -Dgtk_doc=disabled -Dintrospection=disabled
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
