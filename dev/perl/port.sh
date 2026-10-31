#!/bin/bash

cd /usr/ports/dev/perl

curl -LO https://www.cpan.org/src/5.0/perl-5.42.0.tar.gz

tar -xf perl-5.42.0.tar.gz

cd perl-5.42.0
sh Configure -des -Dprefix=/usr
make -j"$(nproc)"
make DESTDIR="$DESTDIR" install

