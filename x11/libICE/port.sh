#!/bin/bash

cd /usr/ports/x11/libICE

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libICE.git

cd libICE

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
