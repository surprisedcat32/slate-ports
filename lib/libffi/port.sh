#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://github.com/libffi/libffi/releases/download/v3.5.2/libffi-3.5.2.tar.gz
tar -xf libffi-3.5.2.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
./configure --prefix=/usr --enable-shared
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
ln -sf /usr/lib64/libffi.so.8 ${DESTDIR:-}/usr/lib/libffi.so.8
