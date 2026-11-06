#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/x11/xorgproto"
git clone --depth 1 https://gitlab.freedesktop.org/xorg/proto/xorgproto.git
cd xorgproto
meson setup build --prefix=/usr
meson compile -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" meson install -C build
