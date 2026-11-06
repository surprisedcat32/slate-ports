#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libdrm"
#thanks LFS for this!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!111!1!
curl -LO https://dri.freedesktop.org/libdrm/libdrm-2.4.134.tar.xz
tar -xf libdrm-2.4.134.tar.xz
cd libdrm-2.4.134

meson setup build --prefix=/usr

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
