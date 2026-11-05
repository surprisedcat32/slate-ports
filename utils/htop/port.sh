#!/bin/bash
cd /usr/ports/utils/htop
git clone --depth=1 https://github.com/htop-dev/htop.git
cd htop
./autogen.sh
make clean -j"$MAKETHREADS"
./configure --disable-unicode
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"
