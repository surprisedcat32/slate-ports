#!/bin/bash

cd /usr/ports/x11/fontconfig

git clone https://gitlab.freedesktop.org/fontconfig/fontconfig.git

cd fontconfig

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

meson install -C build
