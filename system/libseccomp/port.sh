#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/system/libseccomp
curl -LO https://github.com/seccomp/libseccomp/releases/download/v2.6.1/libseccomp-2.6.1.tar.gz
tar -xf libseccomp-2.6.1.tar.gz
cd libseccomp-2.6.1
./configure --prefix=/usr --disable-static
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
