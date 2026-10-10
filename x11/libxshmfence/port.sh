#!/bin/bash
set -e

cd /usr/ports/x11/libxshmfence

git clone https://gitlab.freedesktop.org/xorg/lib/libxshmfence.git
cd libxshmfence

./autogen.sh --prefix=/usr
make -j"$(nproc)"
make install
