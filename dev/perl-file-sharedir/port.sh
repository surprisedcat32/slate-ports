#!/bin/bash
set -e

cd /usr/ports/dev/perl-file-sharedir
curl -LO https://cpan.metacpan.org/authors/id/E/ET/ETHER/File-ShareDir-Install-0.14.tar.gz
tar -xf File-ShareDir-Install-0.14.tar.gz
cd File-ShareDir-Install-0.14

perl Makefile.PL PREFIX=/usr

make -j"$(nproc)"
make DESTDIR="$DESTDIR" install
