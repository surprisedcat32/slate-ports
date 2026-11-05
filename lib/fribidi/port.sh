#!/bin/bash
set -e

cd /usr/ports/lib/fribidi

VERSION=1.0.16

curl -LO https://github.com/fribidi/fribidi/releases/download/v${VERSION}/fribidi-${VERSION}.tar.xz
tar -xf fribidi-${VERSION}.tar.xz
cd fribidi-${VERSION}

./configure --prefix=/usr

make
make DESTDIR="$DESTDIR" install
