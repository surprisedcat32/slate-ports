#!/bin/bash

cd /usr/ports/x11/fontconfig
git clone --depth 1 https://gitlab.freedesktop.org/fontconfig/fontconfig.git

cd fontconfig
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

DESTDIR="$DESTDIR" meson install -C build
