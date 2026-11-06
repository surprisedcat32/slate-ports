#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/xproto"

# Fetch a shallow copy of xorgproto. Mesa clones git; xorgproto also
# publishes release tarballs, which are safer to pin.
git clone --depth=1 --branch xorgproto-2026.1 \
  https://gitlab.freedesktop.org/xorg/proto/xorgproto.git

cd xorgproto

export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig

meson setup build \
  --prefix=/usr \
  --buildtype=release

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
