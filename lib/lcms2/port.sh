#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://downloads.sourceforge.net/project/lcms/lcms/2.19/lcms2-2.19.tar.gz
tar -xf lcms2-2.19.tar.gz
cd "$(tar -tf lcms2-2.19.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr --disable-static
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
