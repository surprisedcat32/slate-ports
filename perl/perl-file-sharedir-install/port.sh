#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/perl/perl-file-sharedir-install
curl -LO https://cpan.metacpan.org/authors/id/E/ET/ETHER/File-ShareDir-Install-0.14.tar.gz
tar -xf File-ShareDir-Install-0.14.tar.gz
cd File-ShareDir-Install-0.14

perl Makefile.PL PREFIX=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
