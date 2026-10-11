#!/bin/bash
if [ ! -f "/usr/ports/installed/devel" ]; then
    slate install dev/dev
fi
if [ ! -f "/usr/ports/installed/meson" ]; then
    slate install dev/meson 
fi
if [ ! -f "/usr/ports/installed/pcre" ]; then
    slate install lib/pcre2
fi
cd /usr/ports/lib/glib
curl -LO https://download.gnome.org/sources/glib/2.86/glib-2.86.1.tar.xz
tar -xf glib-2.86.1.tar.xz
cd glib-2.86.1
meson setup build --prefix=/usr -Dtests=false
meson compile -C build -j"$(nproc)"
meson install -C build
