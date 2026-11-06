#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libxkbfile"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libxkbfile-1.2.0.tar.xz
tar -xf libxkbfile-1.2.0.tar.xz
cd libxkbfile-1.2.0
meson setup build --prefix=/usr
meson compile -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" meson install -C build
