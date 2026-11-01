#!/bin/bash

cd /usr/ports/x11/xorg-server
curl -LO https://xorg.freedesktop.org/releases/individual/xserver/xorg-server-21.1.25.tar.xz
tar -xf xorg-server-12.1.25.tar.xz


cd xorg-server-21.1.25
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
rm -rf build
meson setup build   --prefix=/usr
meson configure build \
  -Dsystemd_logind=false \
  -Dsystemd_notify=false \
  -Dglamor=true

meson compile -C build -j"$(nproc)"

DESTDIR="$DESTDIR" meson install -C build
