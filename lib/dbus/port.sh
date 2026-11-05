
#!/bin/bash
set -e

cd /usr/ports/lib/dbus

curl -LO https://dbus.freedesktop.org/releases/dbus/dbus-1.16.2.tar.xz
tar -xf dbus-1.16.2.tar.xz
cd dbus-1.16.2

meson setup build \
    --prefix=/usr \
    --libdir=lib \
    --buildtype=release \
    -Dsystemd=disabled \
    -Dapparmor=disabled \
    -Dselinux=disabled \
    -Daudit=disabled \
    -Ddocs=disabled \
    -Dman=enabled \
    -Dembedded_tests=false

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install

