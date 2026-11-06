#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://dotat.at/prog/unifdef/unifdef-2.12.tar.gz
tar -xf unifdef-2.12.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
make
make prefix=/usr DESTDIR="$DESTDIR" install
