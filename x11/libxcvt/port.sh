#!/bin/bash

cd /usr/ports/x11/libxcvt

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libxcvt-0.1.3.tar.xz
tar -xf libxcvt-0.1.3.tar.xz
cd libxcvt-0.1.3

meson setup build --prefix=/usr

meson compile -C build -j"$MAKETHREADS" -j"$(nproc)"

DESTDIR="$DESTDIR" meson install -C build
