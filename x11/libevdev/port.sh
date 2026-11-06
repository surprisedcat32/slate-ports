#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libevdev"

curl -LO https://www.freedesktop.org/software/libevdev/libevdev-1.12.0.tar.xz
tar -xf libevdev-1.12.0.tar.xz
cd libevdev-1.12.0

meson setup build --prefix=/usr -Ddocumentation=disabled -Dtests=disabled

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
