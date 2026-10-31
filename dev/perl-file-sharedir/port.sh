#!/bin/bash
set -e

cd /usr/ports/dev/perl-file-sharedir
curl -LO https://cpan.metacpan.org/authors/id/R/RE/REHSACK/File-ShareDir-1.118.tar.gz
tar -xf File-ShareDir-1.118.tar.gz
cd File-ShareDir-1.118

perl Makefile.PL PREFIX=/usr

make -j"$(nproc)"
make DESTDIR="$DESTDIR" install
