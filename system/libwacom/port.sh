#!/bin/bash
cd /usr/ports/system/libwacom
curl -LO https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.14.0/libwacom-2.14.0.tar.xz
tar -xf libwacom-2.14.0.tar.xz
cd libwacom-2.14.0
meson setup build --prefix=/usr
meson compile -C build -j"$(nproc)"
meson install -C build
