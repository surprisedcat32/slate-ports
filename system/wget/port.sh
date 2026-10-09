#!/bin/bash

cd /usr/ports/system/wget

git clone --depth=1 https://git.savannah.gnu.org/git/wget.git

cd wget

./bootstrap

./configure \
    --prefix=/usr \
    --with-ssl=openssl

make -j"$(nproc)"

make install
