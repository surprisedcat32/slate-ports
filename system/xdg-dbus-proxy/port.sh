#!/bin/bash
set -e
cd /usr/ports/system/xdg-dbus-proxy
curl -LO https://github.com/flatpak/xdg-dbus-proxy/releases/download/0.1.9/xdg-dbus-proxy-0.1.9.tar.xz
tar -xf xdg-dbus-proxy-0.1.9.tar.xz
cd xdg-dbus-proxy-0.1.9
meson setup build --prefix=/usr -Dtests=false
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
