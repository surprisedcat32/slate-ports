#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/lib/zstd

curl -LO https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz

tar -xf zstd-1.5.7.tar.gz

cd zstd-1.5.7
make PREFIX=/usr -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install PREFIX=/usr

