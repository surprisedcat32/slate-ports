#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR
git clone --depth 1 https://gitlab.gnome.org/GNOME/libgudev.git
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
meson setup build --prefix=/usr -Dtests=disabled -Dintrospection=disabled
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
meson compile -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" meson install -C build
