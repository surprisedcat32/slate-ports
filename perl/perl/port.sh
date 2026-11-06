#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://www.cpan.org/src/5.0/perl-5.42.0.tar.gz

tar -xf perl-5.42.0.tar.gz

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
sh Configure -des -Dprefix=/usr
sed -i 's/eaccess((p), (f))/faccessat(AT_FDCWD, (p), (f), AT_EACCESS)/' pp_sys.c
sed -i '1i#include <fcntl.h>\n#include <unistd.h>' pp_sys.c
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

