#!/bin/bash

cd /usr/ports/x11/zlib

git clone https://github.com/madler/zlib.git

cd zlib

./configure --prefix=/usr

make -j"$(nproc)"

make install
