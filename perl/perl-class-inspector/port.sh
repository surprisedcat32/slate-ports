#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/perl/perl-class-inspector"
curl -LO https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/Class-Inspector-1.36.tar.gz
tar -xf Class-Inspector-1.36.tar.gz
cd Class-Inspector-1.36

perl Makefile.PL PREFIX=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
