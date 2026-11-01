#!/bin/bash
set -e
cd /usr/ports/system/grub
curl -LO https://ftp.gnu.org/gnu/grub/grub-2.14.tar.xz
tar -xf grub-2.14.tar.xz
cd grub-2.14
./configure --prefix=/usr --sysconfdir=/etc --disable-werror --disable-nls --with-platform=efi --target=x86_64
make
make DESTDIR="$DESTDIR" install
make distclean
./configure --prefix=/usr --sysconfdir=/etc --disable-werror --disable-nls --with-platform=pc --target=i386
make
make DESTDIR="$DESTDIR" install
make distclean
make install DESTDIR="$DESTDIR"
