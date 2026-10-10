#!/bin/bash
cd /usr/ports/x11/xtrans
git clone https://gitlab.freedesktop.org/xorg/lib/libxtrans.git
cd libxtrans
./autogen.sh
./configure --prefix=/usr
make -j"$(nproc)"
make install
