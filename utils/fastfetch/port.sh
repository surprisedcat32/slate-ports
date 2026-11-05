#!/bin/bash
set -e

cd /usr/ports/utils/fastfetch

curl -LO https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.70.0.tar.gz
tar -xf 2.70.0.tar.gz
cd fastfetch-2.70.0

cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

cmake --build build --target fastfetch
DESTDIR="$DESTDIR" cmake --install build
