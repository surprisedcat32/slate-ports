#!/bin/bash
set -e
cd /usr/ports/lib/lcms2
curl -LO https://downloads.sourceforge.net/project/lcms/lcms/2.19/lcms2-2.19.tar.gz
tar -xf lcms2-2.19.tar.gz
cd lcms2-2.19
./configure --prefix=/usr --disable-static
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
