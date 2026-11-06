#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/freetype"
curl -LO https://download.savannah.gnu.org/releases/freetype/freetype-2.15.0.tar.xz
tar -xf freetype-2.15.0.tar.xz
cd freetype-2.15.0

meson setup build --prefix=/usr

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
ln -sf /usr/lib64/pkgconfig/freetype2.pc ${DESTDIR:-}/usr/lib64/pkgconfig/freetype.pc
