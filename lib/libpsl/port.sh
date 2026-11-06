#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://github.com/rockdaboot/libpsl/releases/download/0.21.5/libpsl-0.21.5.tar.gz
tar -xf libpsl-0.21.5.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
meson setup build --prefix=/usr --buildtype=release \
    -Ddocs=false -Dman=false -Dgtk_doc=false -Dtests=false
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
