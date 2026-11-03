#!/bin/bash
set -e

cd /usr/ports/x11/gtk3

curl -LO https://download.gnome.org/sources/gtk/3.24/gtk-3.24.52.tar.xz
tar -xf gtk-3.24.52.tar.xz
cd gtk-3.24.52

./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --enable-x11-backend \
    --disable-wayland-backend

make -j"$(nproc)"
make DESTDIR="$DESTDIR" install
