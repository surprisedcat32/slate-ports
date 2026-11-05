#!/bin/bash
set -e
cd /usr/ports/lib/libsoup
curl -LO https://download.gnome.org/sources/libsoup/3.8/libsoup-3.8.1.tar.xz
tar -xf libsoup-3.8.1.tar.xz
cd libsoup-3.8.1
meson setup build --prefix=/usr \
    -Ddocs=disabled -Dintrospection=disabled \
    -Dtests=false -Dvapi=disabled
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
