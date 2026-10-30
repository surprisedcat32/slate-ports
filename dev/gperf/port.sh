#!/bin/bash
slate install dev/dev

cd /usr/ports/dev/gperf

curl -LO https://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz

tar -xf gperf-3.1.tar.gz

cd gperf-3.1
./configure --prefix=/usr
make -j"$(nproc)"
make install DESTDIR="${DESTDIR:-}"
