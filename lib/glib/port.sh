#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://download.gnome.org/sources/glib/2.90/glib-2.90.1.tar.xz
tar -xf glib-2.90.1.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
meson setup build --prefix=/usr -Dtests=false
meson compile -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" meson install -C build
