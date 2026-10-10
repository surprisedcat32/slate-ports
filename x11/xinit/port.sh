#!/bin/bash

cd /usr/ports/x11/xinit

git clone https://gitlab.freedesktop.org/xorg/app/xinit.git

cd xinit

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
