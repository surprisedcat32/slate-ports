#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://www.cpan.org/authors/id/T/TO/TODDR/XML-Parser-2.59.tar.gz
tar -xf XML-Parser-2.59.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

perl Makefile.PL PREFIX=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
