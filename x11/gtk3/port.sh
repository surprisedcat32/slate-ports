#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/x11/gtk3"

curl -LO https://download.gnome.org/sources/gtk/3.24/gtk-3.24.52.tar.xz
tar -xf gtk-3.24.52.tar.xz
cd gtk-3.24.52
meson setup build \
    --prefix=/usr \
    --sysconfdir=/etc \
    --buildtype=release \
    -Dintrospection=false \
    -Dman=false \
    -Dgtk_doc=false \
    -Dwayland_backend=false \
    -Dx11_backend=true

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
