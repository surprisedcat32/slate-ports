#!/bin/bash

cd /usr/ports/x11/libxkbfile

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libxkbfile.git

cd libxkbfile
meson setup build --prefix=/usr
meson compile -C build -j"$(nproc)"
meson install -C build
