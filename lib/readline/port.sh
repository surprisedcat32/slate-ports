#!/bin/bash

cd /usr/ports/lib/readline

git clone https://git.savannah.gnu.org/git/readline.git

cd readline

CFLAGS="-fPIC" ./configure --prefix=/usr

make -j"$(nproc)"

make install
