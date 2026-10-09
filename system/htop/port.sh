#!/bin/bash
cd /usr/ports/system/htop
git clone --depth=1 https://github.com/htop-dev/htop.git
cd htop
./autogen.sh
make clean
./configure --disable-unicode
make -j"$(nproc)"
make install
