#!/bin/bash

cd /usr/ports/x11/libevdev

curl -LO https://www.freedesktop.org/software/libevdev/libevdev-1.12.0.tar.xz
tar -xf libevdev-1.20.0.tar.xz
cd libevdev-1.20.0

meson setup build --prefix=/usr -Ddocumentation=disabled -Dtests=disabled

meson compile -C build -j"$(nproc)"

DESTDIR="$DESTDIR" meson install -C build
