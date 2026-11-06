#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/fontconfig"
curl -LO https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.17.1/fontconfig-2.17.1.tar.xz
tar -xf fontconfig-2.17.1.tar.xz
cd fontconfig-2.17.1
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=disabled
meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
