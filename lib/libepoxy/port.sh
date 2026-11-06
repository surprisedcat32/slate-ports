#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

git clone --depth 1 https://github.com/anholt/libepoxy.git
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

meson setup build --prefix=/usr -Dtests=false
meson compile -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" meson install -C build
