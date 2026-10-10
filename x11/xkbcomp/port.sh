#!/bin/bash

cd /usr/ports/x11/xkbcomp

git clone https://gitlab.freedesktop.org/xorg/app/xkbcomp.git

cd xkbcomp

./autogen.sh
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
./configure --prefix=/usr

make -j"$(nproc)"

make install
