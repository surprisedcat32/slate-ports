#!/bin/bash
set -e

cd /usr/ports/x11/font-misc-misc
curl -LO https://xorg.freedesktop.org/releases/individual/font/font-misc-misc-1.1.3.tar.xz
tar -xf font-misc-misc-1.1.3.tar.xz
cd font-misc-misc-1.1.3

./configure \
    --prefix=/usr \
    --with-fontrootdir=/usr/share/fonts/X11

make -j"$(nproc)"
make DESTDIR="$DESTDIR" install
