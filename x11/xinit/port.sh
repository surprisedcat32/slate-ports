#!/bin/bash

cd /usr/ports/x11/xinit

git clone --depth 1 https://gitlab.freedesktop.org/xorg/app/xinit.git

cd xinit

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
