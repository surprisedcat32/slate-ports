#!/bin/bash
cd /usr/ports
git clone https://bitmath.org/git/mtdev.git
cd mtdev
./autogen.sh
./configure --prefix=/usr
make -j"$(nproc)"
make install
