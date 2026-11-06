#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://chrony-project.org/releases/chrony-4.7.tar.gz
tar -xf chrony-4.7.tar.gz
cd "$(tar -tf chrony-4.7.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/sbin

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
