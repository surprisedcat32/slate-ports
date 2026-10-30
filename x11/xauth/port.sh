#!/bin/bash
set -e

cd /usr/ports/x11/xauth

git clone --depth 1 https://gitlab.freedesktop.org/xorg/app/xauth.git
cd xauth

./autogen.sh --prefix=/usr
make -j"$(nproc)"
make install
