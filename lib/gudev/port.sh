#!/bin/bash
cd /usr/ports/system/gudev
git clone https://gitlab.gnome.org/GNOME/libgudev.git
cd libgudev
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
meson setup build --prefix=/usr -Dtests=disabled -Dintrospection=disabled
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
meson compile -C build -j"$(nproc)"
meson install -C build
