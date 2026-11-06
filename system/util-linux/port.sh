
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://cdn.kernel.org/pub/linux/utils/util-linux/v2.42/util-linux-2.42.4.tar.xz
tar -xf util-linux-2.42.4.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

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

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

