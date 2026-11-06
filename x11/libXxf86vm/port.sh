#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/x11/libXxf86vm"

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXxf86vm.git
cd libXxf86vm

./autogen.sh --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
