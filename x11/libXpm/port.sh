#!/bin/bash

cd /usr/ports/x11/libXpm

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXpm.git

cd libXpm

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
