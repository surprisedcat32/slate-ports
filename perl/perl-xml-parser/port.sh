#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/perl/perl-xml-parser
curl -LO https://www.cpan.org/authors/id/T/TO/TODDR/XML-Parser-2.59.tar.gz
tar -xf XML-Parser-2.59.tar.gz
cd XML-Parser-2.59

perl Makefile.PL PREFIX=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
