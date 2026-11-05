#!/bin/bash
set -e
cd /usr/ports/www/webkitgtk
curl -LO https://webkitgtk.org/releases/webkitgtk-2.54.2.tar.xz
tar -xf webkitgtk-2.54.2.tar.xz
cd webkitgtk-2.54.2
cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DPORT=GTK \
    -DUSE_GTK4=OFF \
    -DENABLE_MINIBROWSER=ON \
    -DENABLE_WEBDRIVER=OFF \
    -DENABLE_DOCUMENTATION=OFF \
    -DENABLE_BUBBLEWRAP_SANDBOX=ON
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
