#!/bin/bash
cd /usr/ports
git clone --depth 1 https://bitmath.org/git/mtdev.git
cd mtdev
./autogen.sh
./configure --prefix=/usr
make -j"$(nproc)"
make install
