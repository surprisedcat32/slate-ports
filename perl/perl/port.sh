#!/bin/bash

cd /usr/ports/perl/perl

curl -LO https://www.cpan.org/src/5.0/perl-5.42.0.tar.gz

tar -xf perl-5.42.0.tar.gz

cd perl-5.42.0
sh Configure -des -Dprefix=/usr
sed -i 's/eaccess((p), (f))/faccessat(AT_FDCWD, (p), (f), AT_EACCESS)/' pp_sys.c
sed -i '1i#include <fcntl.h>\n#include <unistd.h>' pp_sys.c
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"

