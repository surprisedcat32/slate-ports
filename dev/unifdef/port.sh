#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://dotat.at/prog/unifdef/unifdef-2.12.tar.gz
tar -xf unifdef-2.12.tar.gz
cd "$(tar -tf unifdef-2.12.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
make
make prefix=/usr DESTDIR="$DESTDIR" install
