#!/bin/bash

cd /usr/ports/x11/fontconfig
git clone https://gitlab.freedesktop.org/fontconfig/fontconfig.git

cd fontconfig
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

meson install -C build
