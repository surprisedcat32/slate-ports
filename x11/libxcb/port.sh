#!/bin/bash

cd /usr/ports/x11/libxcb

git clone https://gitlab.freedesktop.org/xorg/lib/libxcb.git

cd libxcb

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

meson install -C build
