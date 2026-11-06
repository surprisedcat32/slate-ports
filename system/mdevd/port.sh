#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://skarnet.org/software/mdevd/mdevd-0.1.5.0.tar.gz
tar -xf mdevd-0.1.5.0.tar.gz
cd "$(tar -tf mdevd-0.1.5.0.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
