#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO http://ftp.gnu.org/pub/gnu/gperf/gperf-3.3.tar.gz 
tar -xf gperf-3.3.tar.gz
cd "$(tar -tf gperf-3.3.tar.gz | head -1 | cut -d/ -f1)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr
make -j"$MAKETHREADS"
make install DESTDIR="${DESTDIR:-}"
