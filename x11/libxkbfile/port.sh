#!/bin/bash

cd /usr/ports/x11/libxkbfile

curk -LO https://xorg.freedesktop.org/releases/individual/lib/libxkbfile-1.2.0.tar.xz
tar -xf libxkbfile-1.2.0.tar.xz
cd libxkbfile-1.2.0
meson setup build --prefix=/usr
meson compile -C build -j"$(nproc)"
DESTDIR="$DESTDIR" meson install -C build
