#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://www.kernel.org/pub/linux/utils/usb/usbutils/usbutils-019.tar.xz
tar -xf usbutils-019.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
