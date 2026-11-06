#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/lib/atk"

curl -LO https://download.gnome.org/sources/atk/2.38/atk-2.38.0.tar.xz
tar -xf atk-2.38.0.tar.xz
cd atk-2.38.0

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dintrospection=disabled

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
