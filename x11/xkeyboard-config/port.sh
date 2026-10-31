#!/bin/bash

cd /usr/ports/x11/xkeyboard-config

curl -LO https://xorg.freedesktop.org/releases/individual/data/xkeyboard-config-2.5.1.tar.gz
tar -xf xkeyboard-config-2.5.1.tar.gz
cd xkeyboard-config-2.5.1

meson setup build --prefix=/usr

meson compile -C build -j"$(nproc)"

DESTDIR="$DESTDIR" meson install -C build
