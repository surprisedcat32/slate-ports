#!/bin/bash
set -e
cd /usr/ports/system/grub
curl -LO https://ftp.gnu.org/gnu/grub/grub-2.14.tar.xz
tar -xf grub-2.14.tar.xz
cd grub-2.14
./configure --prefix=/usr --sysconfdir=/etc --disable-werror --disable-nls --with-platform=efi --target=x86_64
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
make distclean -j"$MAKETHREADS"
./configure --prefix=/usr --sysconfdir=/etc --disable-werror --disable-nls --with-platform=pc --target=i386
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
make distclean -j"$MAKETHREADS"
make install DESTDIR="$DESTDIR"
