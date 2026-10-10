#!/bin/bash

cd /usr/ports/x11/freetype

git clone https://gitlab.freedesktop.org/freetype/freetype.git

cd freetype

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

meson install -C build
ln -sf /usr/lib64/pkgconfig/freetype2.pc /usr/lib64/pkgconfig/freetype.pc
