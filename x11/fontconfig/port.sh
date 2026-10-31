#!/bin/bash

cd /usr/ports/x11/fontconfig
curl -LO https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.16.0.tar.xz
tar -xf fontconfig-2.16.0.tar.xz
cd fontconfig-2.16.0
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

DESTDIR="$DESTDIR" meson install -C build
