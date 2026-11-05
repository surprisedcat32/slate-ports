#!/bin/bash
set -e
cd /usr/ports/system/bubblewrap
curl -LO https://github.com/containers/bubblewrap/releases/download/v0.13.1/bubblewrap-0.13.1.tar.xz
tar -xf bubblewrap-0.13.1.tar.xz
cd bubblewrap-0.13.1
meson setup build --prefix=/usr -Dtests=false
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
