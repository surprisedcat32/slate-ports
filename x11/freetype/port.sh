#!/bin/bash

cd /usr/ports/x11/freetype

git clone https://gitlab.freedesktop.org/freetype/freetype.git

cd freetype

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

meson install -C build
