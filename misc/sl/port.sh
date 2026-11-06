#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://github.com/mtoyoda/sl/archive/refs/tags/5.02.tar.gz
tar -xf 5.02.tar.gz
cd "$(tar -tf 5.02.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

make CC="${CC:-gcc}" \ -j"$MAKETHREADS"
    CFLAGS="${CFLAGS:--O2}" \
    LDFLAGS="-lncurses"

install -Dm755 sl "$DESTDIR/usr/bin/sl"
