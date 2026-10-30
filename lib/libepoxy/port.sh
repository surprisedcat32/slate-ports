#!/bin/bash
set -e

cd /usr/ports/x11

git clone --depth 1 https://github.com/anholt/libepoxy.git
cd libepoxy

meson setup build --prefix=/usr -Dtests=false
meson compile -C build -j"$(nproc)"
meson install -C build
