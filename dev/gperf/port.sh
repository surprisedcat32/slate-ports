#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/dev/gperf"

curl -LO http://ftp.gnu.org/pub/gnu/gperf/gperf-3.3.tar.gz 
tar -xf gperf-3.3.tar.gz

cd gperf-3.3
./configure --prefix=/usr
make -j"$MAKETHREADS"
make install DESTDIR="${DESTDIR:-}"
