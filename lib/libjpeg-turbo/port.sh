
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/3.2.1/libjpeg-turbo-3.2.1.tar.gz
tar -xf libjpeg-turbo-3.2.1.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_INCLUDEDIR=include \
    -DENABLE_SHARED=ON \
    -DENABLE_STATIC=ON \
    -DWITH_JAVA=OFF \
    -DWITH_TESTS=OFF

cmake --build build

DESTDIR="$DESTDIR" cmake --install build

