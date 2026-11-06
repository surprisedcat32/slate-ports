#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://downloads.sourceforge.net/infozip/unzip60.tgz
curl -LO https://downloads.sourceforge.net/infozip/zip30.tar.gz

tar -xf unzip60.tgz
tar -xf zip30.tar.gz

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
make -f unix/Makefile generic -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" -f unix/Makefile prefix=/usr install
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
make -f unix/Makefile generic -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" -f unix/Makefile prefix=/usr install

