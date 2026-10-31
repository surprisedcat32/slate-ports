#!/bin/bash

cd /usr/ports/x11/libevdev

git clone --branch libevdev-1.14.0 --depth 1 https://gitlab.freedesktop.org/libevdev/libevdev.git

cd libevdev

meson setup build --prefix=/usr -Ddocumentation=disabled -Dtests=disabled

meson compile -C build -j"$(nproc)"

DESTDIR="$DESTDIR" meson install -C build
