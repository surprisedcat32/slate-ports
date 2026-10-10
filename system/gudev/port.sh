#!/bin/bash
cd /usr/ports/system/gudev
git clone https://gitlab.gnome.org/GNOME/libgudev.git
cd libgudev
meson setup build --prefix=/usr -Dtests=disabled -Dintrospection=disabled
meson compile -C build -j"$(nproc)"
meson install -C build
