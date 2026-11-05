#!/bin/bash
set -e
cd /usr/ports/dev/unifdef
curl -LO https://dotat.at/prog/unifdef/unifdef-2.12.tar.gz
tar -xf unifdef-2.12.tar.gz
cd unifdef-2.12
make
make prefix=/usr DESTDIR="$DESTDIR" install
