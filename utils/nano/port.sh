#!/bin/bash
set -e
cd /usr/ports/utils/nano
curl -LO https://ftp.gnu.org/gnu/nano/nano-9.3.tar.xz
tar -xf nano-9.3.tar.xz
cd nano-9.3
./configure --prefix=/usr --disable-nls
make
make DESTDIR="$DESTDIR" install
