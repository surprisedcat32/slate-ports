
#!/bin/bash
set -e

cd /usr/ports/x11/fltk

curl -LO https://github.com/fltk/fltk/releases/download/release-1.4.5/fltk-1.4.5-source.tar.gz 
tar -xf fltk-1.4.5-source.tar.gz
cd fltk-1.4.5

cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_INCLUDEDIR=include \
    -DFLTK_BUILD_TEST=OFF \
    -DFLTK_BUILD_EXAMPLES=OFF

cmake --build build -j"$(nproc)"

DESTDIR="$DESTDIR" cmake --install build

