#!/bin/sh

curl -LO https://download.gnome.org/sources/pango/1.58/pango-1.58.2.tar.xz
tar -xf pango-1.58.2.tar.xz
cd pango-1.58.2

mkdir build
cd build

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nofallback \
    -Dintrospection=disabled \
    -Ddocumentation=false \
    -Dman-pages=false \
    -Dbuild-testsuite=false \
    -Dbuild-examples=false \
    -Dcairo=enabled \
    -Dfontconfig=enabled \
    -Dfreetype=enabled \
    -Dxft=enabled \
    -Dlibthai=disabled \
    -Dsysprof=disabled

ninja -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja install
