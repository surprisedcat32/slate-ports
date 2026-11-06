#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://download.gnome.org/sources/glib/2.90/glib-2.90.1.tar.xz
tar -xf glib-2.90.1.tar.xz
cd "$(tar -tf glib-2.90.1.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
meson setup build --prefix=/usr -Dtests=false
meson compile -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" meson install -C build
