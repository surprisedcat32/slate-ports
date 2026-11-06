#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO https://github.com/simdutf/simdutf/archive/refs/tags/v9.3.0.tar.gz
tar -xf v9.3.0.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSIMDUTF_BUILD_TESTS=OFF \
    -DSIMDUTF_BUILD_FUZZERS=OFF \
    -DSIMDUTF_BUILD_BENCHMARKS=OFF

cmake --build build -j"$(nproc)"
DESTDIR="$DESTDIR" cmake --install build
