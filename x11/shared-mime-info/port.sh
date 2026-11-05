#!/bin/bash

cd /usr/ports/desktop/shared-mime-info

curl -LO https://gitlab.freedesktop.org/xdg/shared-mime-info/-/archive/2.5.1/shared-mime-info-2.5.1.tar.bz2

tar -xf shared-mime-info-2.5.1.tar.bz2
cd shared-mime-info-2.5.1

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dupdate-mimedb=true \
    -Dbuild-tests=false

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install

