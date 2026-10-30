#!/bin/bash

cd /usr/ports/x11/libXcursor

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXcursor.git

cd libXcursor

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
