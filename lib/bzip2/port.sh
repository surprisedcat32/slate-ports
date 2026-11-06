#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/lib/bzip2

curl -LO https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz
tar -xf bzip2-1.0.8.tar.gz

cd bzip2-1.0.8

make -f Makefile-libbz2_so
make clean

make -j"$MAKETHREADS"

make PREFIX="$DESTDIR/usr" install

install -Dm755 libbz2.so.1.0.8 "$DESTDIR/usr/lib/libbz2.so.1.0.8"
cp libbz2.so.1.0.8 "$DESTDIR/usr/lib/libbz2.so.1.0"
cp libbz2.so.1.0 "$DESTDIR/usr/lib/libbz2.so"

install -Dm755 bzip2-shared "$DESTDIR/usr/bin/bzip2"

cp bzip2 "$DESTDIR/usr/bin/bunzip2"
cp bzip2 "$DESTDIR/usr/bin/bzcat"
