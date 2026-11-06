#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libpciaccess"

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libpciaccess.git

cd libpciaccess
meson setup build --prefix=/usr
meson compile -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" meson install -C build
