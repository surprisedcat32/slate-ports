#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://ftp.gnu.org/gnu/grub/grub-2.14.tar.xz
tar -xf grub-2.14.tar.xz
cd "$(tar -tf grub-2.14.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr --sysconfdir=/etc --disable-werror --disable-nls --with-platform=efi --target=x86_64
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
make distclean -j"$MAKETHREADS"
./configure --prefix=/usr --sysconfdir=/etc --disable-werror --disable-nls --with-platform=pc --target=i386
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
make distclean -j"$MAKETHREADS"
make install DESTDIR="$DESTDIR"
