#!/bin/bash

cd /usr/ports/x11/pixman

git clone https://gitlab.freedesktop.org/pixman/pixman.git

cd pixman

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

meson install -C build
