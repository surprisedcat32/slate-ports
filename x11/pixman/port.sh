#!/bin/bash

cd /usr/ports/x11/pixman

git clone --depth 1 https://gitlab.freedesktop.org/pixman/pixman.git

cd pixman

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

DESTDIR="$DESTDIR" meson install -C build
