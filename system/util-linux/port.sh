
#!/bin/bash
set -e

cd /usr/ports/system/util-linux

curl -LO https://cdn.kernel.org/pub/linux/utils/util-linux/v2.42/util-linux-2.42.4.tar.xz
tar -xf util-linux-2.42.4.tar.xz
cd util-linux-2.42.4

./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --runstatedir=/run \
    --disable-nls \
    --disable-makeinstall-chown \
    --without-systemd \
    --without-udev \
    --without-python \
    --without-tinfo \
    --without-ncurses \
    --without-readline \
    --without-audit \
    --without-selinux \
    --without-cryptsetup \
    --without-libuser \
    --without-slang \
    --without-utempter

make
make DESTDIR="$DESTDIR" install

