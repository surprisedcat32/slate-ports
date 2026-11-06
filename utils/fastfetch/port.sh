#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.70.0.tar.gz
tar -xf 2.70.0.tar.gz
cd "$(tar -tf 2.70.0.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

cmake --build build --target fastfetch
DESTDIR="$DESTDIR" cmake --install build
