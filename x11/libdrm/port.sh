#!/bin/bash

cd /usr/ports/x11/libdrm

git clone --depth 1 https://gitlab.freedesktop.org/mesa/drm.git libdrm

cd libdrm

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

DESTDIR="$DESTDIR" meson install -C build
