#!/bin/bash

cd /usr/ports/libXaw

git clone https://gitlab.freedesktop.org/xorg/lib/libXaw.git

cd libXaw

./autogen.sh

./configure 
    --prefix=/usr/local 
    --enable-shared 
    --enable-static

make -j"$(nproc)"

make install
