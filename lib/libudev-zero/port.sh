#!/bin/bash
cd /usr/ports/lib/libudev-zero
git clone --depth 1 https://github.com/illiliti/libudev-zero.git
cd libudev-zero
meson setup build --prefix=/usr
meson compile -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" meson install -C build
