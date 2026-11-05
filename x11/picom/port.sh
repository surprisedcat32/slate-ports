#!/bin/bash
set -e
cd /usr/ports/x11/picom

curl -LO https://github.com/yshui/picom/archive/refs/tags/v13.tar.gz
tar -xf v13.tar.gz
cd picom-13

meson setup build \
    --prefix=/usr \
    -Ddbus=false \
    -Dopengl=false \
    -Dregex=false

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build -j"$MAKETHREADS" install
