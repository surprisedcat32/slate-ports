#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/pixman"

curl -LO https://cairographics.org/releases/pixman-0.46.4.tar.xz
tar -xf pixman-0.46.4.tar.xz
cd pixman-0.46.4

meson setup build --prefix=/usr

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
