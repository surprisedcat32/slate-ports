
#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/lib/libjpeg-turbo

curl -LO https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/3.2.1/libjpeg-turbo-3.2.1.tar.gz
tar -xf libjpeg-turbo-3.2.1.tar.gz
cd libjpeg-turbo-3.2.1

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

