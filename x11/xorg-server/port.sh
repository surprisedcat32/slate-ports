#!/bin/bash

cd /usr/ports/x11/xorg-server

git clone https://gitlab.freedesktop.org/xorg/xserver.git xorg-server

cd xorg-server

meson setup build   --prefix=/usr
meson configure build \
  -Dsystemd_logind=false \
  -Dsystemd_notify=false \
  -Dglamor=false

meson compile -C build -j"$(nproc)"

meson install -C build
ln -s /usr/lib64/lib* /usr/lib/
