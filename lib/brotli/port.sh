
#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/lib/brotli"

curl -LO https://github.com/google/brotli/archive/refs/tags/v1.2.0.tar.gz
tar -xf v1.2.0.tar.gz
cd brotli-1.2.0

cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_INCLUDEDIR=include \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF

cmake --build build

DESTDIR="$DESTDIR" cmake --install build

