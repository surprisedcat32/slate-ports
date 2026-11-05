#!/bin/bash
set -e
cd /usr/ports/lib/libpsl
curl -LO https://github.com/rockdaboot/libpsl/releases/download/0.21.5/libpsl-0.21.5.tar.gz
tar -xf libpsl-0.21.5.tar.gz
cd libpsl-0.21.5
meson setup build --prefix=/usr --buildtype=release \
    -Ddocs=false -Dman=false -Dgtk_doc=false -Dtests=false
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
