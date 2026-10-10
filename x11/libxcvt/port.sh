#!/bin/bash

cd /usr/ports/x11/libxcvt

git clone https://gitlab.freedesktop.org/xorg/lib/libxcvt.git

cd libxcvt

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

meson install -C build
