#!/bin/bash

cd /usr/ports/x11/libSM

git clone https://gitlab.freedesktop.org/xorg/lib/libSM.git

cd libSM

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
