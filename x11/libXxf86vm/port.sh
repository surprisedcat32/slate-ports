#!/bin/bash
set -e

cd /usr/ports/x11libXxf86vm

git clone https://gitlab.freedesktop.org/xorg/lib/libXxf86vm.git
cd libXxf86vm

./autogen.sh --prefix=/usr
make -j"$(nproc)"
make install
