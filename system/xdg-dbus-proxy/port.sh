#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://github.com/flatpak/xdg-dbus-proxy/releases/download/0.1.9/xdg-dbus-proxy-0.1.9.tar.xz
tar -xf xdg-dbus-proxy-0.1.9.tar.xz
cd "$(tar -tf xdg-dbus-proxy-0.1.9.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
meson setup build --prefix=/usr -Dtests=false
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
