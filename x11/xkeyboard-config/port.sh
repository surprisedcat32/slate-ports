#!/bin/bash

cd /usr/ports/x11/xkeyboard-config

git clone --depth 1 https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config.git

cd xkeyboard-config

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

DESTDIR="$DESTDIR" meson install -C build
