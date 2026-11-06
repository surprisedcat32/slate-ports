#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz
tar -xf cpio-2.15.tar.gz
cd "$(tar -tf cpio-2.15.tar.gz | head -1 | cut -d/ -f1)"

./configure --prefix=/usr
sed -i 's/xstat(/stat(/g' src/copyout.c
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
