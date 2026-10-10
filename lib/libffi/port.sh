#!/bin/bash
cd /usr/ports/lib/libffi
curl -LO https://github.com/libffi/libffi/releases/download/v3.5.2/libffi-3.5.2.tar.gz
tar -xf libffi-3.5.2.tar.gz
cd libffi-3.5.2
./configure --prefix=/usr --enable-shared
make -j"$(nproc)"
make install
