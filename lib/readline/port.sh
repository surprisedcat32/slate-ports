#!/bin/bash

cd /usr/ports/lib/readline

git clone --depth 1 https://git.savannah.gnu.org/git/readline.git

cd readline

CFLAGS="-fPIC" ./configure --prefix=/usr

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
