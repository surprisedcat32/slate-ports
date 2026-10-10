#!/bin/bash

cd /usr/ports/x11/libinput

git clone https://gitlab.freedesktop.org/libinput/libinput.git

cd libinput

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

meson install -C build
