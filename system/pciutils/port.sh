#!/bin/bash
set -e

cd /usr/ports/system/pciutils
curl -LO https://www.kernel.org/pub/software/utils/pciutils/pciutils-3.15.0.tar.xz
tar -xf pciutils-3.15.0.tar.xz
cd pciutils-3.15.0

make -j"$(nproc)" PREFIX=/usr SHARED=yes ZLIB=no DNS=no LIBKMOD=no HWDB=no
make PREFIX=/usr SHARED=yes ZLIB=no DNS=no LIBKMOD=no HWDB=no \
    DESTDIR="$DESTDIR" install install-lib
