#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/system/mdevd"

curl -LO https://skarnet.org/software/mdevd/mdevd-0.1.5.0.tar.gz
tar -xf mdevd-0.1.5.0.tar.gz
cd mdevd-0.1.5.0

./configure \
    --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
