#!/bin/bash

cd /usr/ports/x11/libpciaccess

git clone https://gitlab.freedesktop.org/xorg/lib/libpciaccess.git

cd libpciaccess
meson setup build --prefix=/usr
meson compile -C build -j"$(nproc)"
meson install -C build
