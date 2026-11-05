#!/bin/bash
set -e
cd /usr/ports/system/polkit

curl -LO https://github.com/polkit-org/polkit/archive/refs/tags/127.tar.gz
tar -xf 127.tar.gz
cd polkit-127

meson setup build \
    --prefix=/usr \
    --sysconfdir=/etc \
    -Dauthfw=shadow \
    -Dsession_tracking=ConsoleKit \
    -Dintrospection=false \
    -Dman=false \
    -Dtests=false

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
