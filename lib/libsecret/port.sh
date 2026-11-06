#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://download.gnome.org/sources/libsecret/0.21/libsecret-0.21.8.2.tar.xz
tar -xf libsecret-0.21.8.2.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
meson setup build --prefix=/usr \
    -Dgtk_doc=false -Dmanpage=false \
    -Dintrospection=false -Dvapi=false -Dtests=false
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
