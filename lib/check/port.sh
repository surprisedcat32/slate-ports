#!/bin/bash
cd /usr/ports/lib/check
curl -LO https://github.com/libcheck/check/releases/download/0.15.2/check-0.15.2.tar.gz
tar -xf check-0.15.2.tar.gz
cd check-0.15.2
./configure --prefix=/usr
make -j"$(nproc)"
make install
