#!/bin/bash

cd /usr/ports/x11/libICE

git clone https://gitlab.freedesktop.org/xorg/lib/libICE.git

cd libICE

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
