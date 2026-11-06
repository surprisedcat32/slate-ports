#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/x11/rofi

curl -LO https://github.com/davatorium/rofi/releases/download/2.0.0/rofi-2.0.0.tar.xz
tar -xf rofi-2.0.0.tar.xz
cd rofi-2.0.0

meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
