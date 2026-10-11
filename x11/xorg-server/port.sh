#!/bin/bash

cd /usr/ports/x11/xorg-server

if [ ! -d xorg-server/.git ]; then
git clone --depth=1 https://gitlab.freedesktop.org/xorg/xserver.git xorg-server
fi
cd xorg-server
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
rm -rf build
meson setup build   --prefix=/usr
meson configure build \
  -Dsystemd_logind=false \
  -Dsystemd_notify=false \
  -Dglamor=true

meson compile -C build -j"$(nproc)"

meson install -C build
ln -s /usr/lib64/lib* /usr/lib/
