#!/bin/bash

cd /usr/ports/lib/zlib

git clone --depth 1 https://github.com/madler/zlib.git

cd zlib

./configure --prefix=/usr

make -j"$(nproc)"

make install
