#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

VERSION=1.0.16

curl -LO https://github.com/fribidi/fribidi/releases/download/v${VERSION}/fribidi-${VERSION}.tar.xz
tar -xf fribidi-${VERSION}.tar.xz
cd "$(tar -tf fribidi-${VERSION}.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
