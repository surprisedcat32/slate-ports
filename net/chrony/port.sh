#!/bin/bash
cd /usr/ports/net/chrony

curl -LO https://chrony-project.org/releases/chrony-4.7.tar.gz
tar -xf chrony-4.7.tar.gz
cd chrony-4.7

./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/sbin

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
