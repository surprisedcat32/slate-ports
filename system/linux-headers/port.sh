#!/bin/bash
set -e

cd /usr/ports/system/linux
curl -LO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.18.60.tar.xz
tar -xf linux-6.18.60.tar.xz

cd linux-6.18.60

make mrproper

make headers_install \
    ARCH=x86 \
    INSTALL_HDR_PATH=/usr \
    DESTDIR="$DESTDIR"

