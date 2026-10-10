#!/bin/bash

cd /usr/ports/x11/libpciaccess

git clone https://gitlab.freedesktop.org/xorg/lib/libpciaccess.git

cd libpciaccess

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
