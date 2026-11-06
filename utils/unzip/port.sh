#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://downloads.sourceforge.net/infozip/unzip60.tgz
curl -LO https://downloads.sourceforge.net/infozip/zip30.tar.gz

tar -xf unzip60.tgz
cd "$(tar -tf unzip60.tgz | head -1 | cut -d/ -f1)"
tar -xf zip30.tar.gz
cd "$(tar -tf zip30.tar.gz | head -1 | cut -d/ -f1)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
make -f unix/Makefile generic -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" -f unix/Makefile prefix=/usr install
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
make -f unix/Makefile generic -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" -f unix/Makefile prefix=/usr install

