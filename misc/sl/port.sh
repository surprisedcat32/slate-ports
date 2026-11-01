#!/bin/bash
cd /usr/ports/misc/sl
curl -LO https://github.com/mtoyoda/sl/archive/refs/tags/5.02.tar.gz
tar -xf 5.02.tar.gz
cd sl-5.02

make CC="${CC:-gcc}" \
    CFLAGS="${CFLAGS:--O2}" \
    LDFLAGS="-lncurses"

install -Dm755 sl "$DESTDIR/usr/bin/sl"
