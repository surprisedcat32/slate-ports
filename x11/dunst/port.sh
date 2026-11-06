#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/x11/dunst"

curl -LO https://github.com/dunst-project/dunst/archive/refs/tags/v1.13.2.tar.gz
tar -xf v1.13.2.tar.gz
cd dunst-1.13.2

meson setup build \
    --prefix=/usr \
    -Dwayland=disabled \
    -Ddocs=disabled \
    -Dtests=disabled

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
