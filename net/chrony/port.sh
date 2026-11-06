#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO https://chrony-project.org/releases/chrony-4.7.tar.gz
tar -xf chrony-4.7.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/sbin

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
