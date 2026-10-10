#!/bin/bash

cd /usr/ports/x11/libdrm

git clone https://gitlab.freedesktop.org/mesa/drm.git libdrm

cd libdrm

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

meson install -C build
