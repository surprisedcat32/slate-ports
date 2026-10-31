#!/bin/bash

cd /usr/ports/x11/libxcvt

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libxcvt.git

cd libxcvt

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

DESTDIR="$DESTDIR" meson install -C build
