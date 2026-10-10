#!/bin/bash
cd /usr/ports/x11/xorgproto
git clone https://gitlab.freedesktop.org/xorg/proto/xorgproto.git
cd xorgproto
meson setup build --prefix=/usr
meson compile -C build -j"$(nproc)"
meson install -C build
