#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO http://ftp.gnu.org/pub/gnu/gperf/gperf-3.3.tar.gz 
tar -xf gperf-3.3.tar.gz

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR
./configure --prefix=/usr
make -j"$MAKETHREADS"
make install DESTDIR="${DESTDIR:-}"
