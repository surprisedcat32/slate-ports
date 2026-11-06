#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz

tar -xf zstd-1.5.7.tar.gz
cd "$(tar -tf zstd-1.5.7.tar.gz | head -1 | cut -d/ -f1)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
make PREFIX=/usr -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install PREFIX=/usr

