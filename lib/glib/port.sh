#!/bin/bash
cd /usr/ports/lib/glib
curl -LO https://download.gnome.org/sources/glib/2.86/glib-2.86.1.tar.xz
tar -xf glib-2.86.1.tar.xz
cd glib-2.86.1
meson setup build --prefix=/usr -Dtests=false
meson compile -C build -j"$(nproc)"
meson install -C build
