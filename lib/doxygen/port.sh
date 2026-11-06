#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://www.doxygen.nl/files/doxygen-1.14.0.src.tar.gz
tar -xf doxygen-1.14.0.src.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
mkdir build
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
