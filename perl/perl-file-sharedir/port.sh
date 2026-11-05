#!/bin/bash
set -e

cd /usr/ports/perl/perl-file-sharedir
curl -LO https://cpan.metacpan.org/authors/id/R/RE/REHSACK/File-ShareDir-1.118.tar.gz
tar -xf File-ShareDir-1.118.tar.gz
cd File-ShareDir-1.118

perl Makefile.PL PREFIX=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"
