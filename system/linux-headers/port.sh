#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.18.60.tar.xz
tar -xf linux-6.18.60.tar.xz

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

make mrproper -j"$MAKETHREADS"

make headers_install \
    ARCH=x86 \
    INSTALL_HDR_PATH=/usr \
    DESTDIR="$DESTDIR"

