#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libinput"

git clone --depth 1 https://gitlab.freedesktop.org/libinput/libinput.git

cd libinput
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
meson setup build --prefix=/usr -Dtests=false -Ddebug-gui=false

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
